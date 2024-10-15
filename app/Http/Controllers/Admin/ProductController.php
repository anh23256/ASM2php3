<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;

use function PHPUnit\Framework\throwException;

class ProductController extends Controller
{
    const PATH = 'admin.products.';
    public function index()
    {
        try {
            //Lấy sản phẩm kèm theo mối quan hệ
            $products = Product::query()->with('category:id,name')->latest('id')->paginate(10);

            return view(self::PATH . __FUNCTION__, compact('products'));
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            //Lỗi hệ thống
            abort(500);
        }
    }

    public function show(Product $product)
    {
        try {
            return view(self::PATH . __FUNCTION__, compact('product'));
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            //Chuyển về trang chủ với thông báo khi có lỗi
            return redirect()->route('products.index')->with('success', 'Lỗi hệ thống');
        }
    }

    public function destroy(Product $product)
    {
        try {
            //Xóa sản phẩm
            $product->delete();

            //Xóa ảnh sản phẩm
            if (Storage::exists($product->image)) {
                Storage::delete($product->image);
            }

            return redirect()->route('products.index')->with('success', true);
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            //Chuyển về trang chủ với thông báo khi có lỗi
            return redirect()->route('products.index')->with('success', 'Xóa không thành công');

            // //Kiểu tra tài nguyên tồn tại không
            // abort_if(empty($product), 404);

            // //Lỗi hệ thống
            // abort(500);
        }
    }

    public function create()
    {
        //Lấy tất cả cate
        $categories = Category::query()->pluck('name','id')->all();

        return view(self::PATH . __FUNCTION__, compact('categories'));
    }

    public function store(Request $request)
    {
        //Kiểm tra validate
        $validator = $request->validate([
            'name'          => 'required|string',
            'category_id'   => 'required|exists:categories,id',
            'description'   => 'nullable',
            'price'         => 'required|min:1000|numeric',
            'quantity'      => 'required|min:0|numeric',
            'image'         => 'nullable|image|max:2000',
        ]);

        try {
            //Lấy dữ liệu trừ image
            $data = $request->except('image');

            //Kiểm tra xem request có file không
            if ($request->hasFile('image')) {
                //Upload file vào trong images
                $data['image'] = Storage::put('images', $request->file('image'));
            }

            //Thêm mới sản phẩm
            Product::query()->create($data);

            //Chuyển về trang chủ nếu thành công
            return redirect()->route('products.index')->with('success', true);
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            //Kiểm tra xem có dữ liệu image không và có tồn tại file này trong storage không có thì xóa
            if (!empty($data['image']) && Storage::exists($data['image'])) {
                Storage::delete($data['image']);
            }

            //Chuyển về trang chủ với thông báo khi có lỗi
            return back()->with('success', 'Lỗi hệ thống');
        }
    }

    public function edit(Product $product)
    {
        //lấy tất cả bản ghi của cate
        $categories = Category::query()->pluck('name','id')->all();

        return view(self::PATH . __FUNCTION__,compact('product', 'categories'));
    }

    public function update(Product $product, Request $request)
    {
        //Kiểm tra validate
        $validator = $request->validate([
            'name'          => 'required|string',
            'category_id'   => 'required|exists:categories,id',
            'description'   => 'nullable',
            'price'         => 'required|min:1000|numeric',
            'quantity'      => 'required|min:0|numeric',
            'image'         => 'nullable|image|max:2000',
        ]);

        try {
            //Lấy dữ liệu trừ image
            $data = $request->except('image');

            //Kiểm tra xem request có file không
            if ($request->hasFile('image')) {
                //Upload file vào trong images
                $data['image'] = Storage::put('images', $request->file('image'));
            }

            //Lấy đường dẫn cũ của ảnh
            $currencyImage = $product->image;

            //Thêm mới sản phẩm
            $product->update($data);

            //có ảnh và update thành công thì xóa ảnh cũ
            if(!empty($data['image']) && Storage::exists($currencyImage)){
                Storage::delete($currencyImage);
            }

            //Chuyển về trang chủ nếu thành công
            return redirect()->route('products.edit', $product)->with('success', true);
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            //Kiểm tra xem có dữ liệu image không và có tồn tại file này trong storage không có thì xóa
            if (!empty($data['image']) && Storage::exists($data['image'])) {
                Storage::delete($data['image']);
            }

            //Chuyển về trang chủ với thông báo khi có lỗi
            return back()->with('success', 'Lỗi hệ thống');
        }
    }
}
