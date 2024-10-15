<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            //Lấy sản phẩm kèm theo mối quan hệ
            $products = Product::query()->with('category:id,name')->latest('id')->paginate(10);

            return response()->json([
                'status' => true,
                'data'   => $products,
            ]);
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            //Lỗi hệ thống
            return response()->json([
                'status' => false,
                'message'   => 'Lỗi hệ thống',
            ], 500);
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //Kiểm tra validate
        $validator = Validator::make($request->all(), [
            'name'          => 'required|string',
            'category_id'   => 'required|exists:categories,id',
            'description'   => 'nullable',
            'price'         => 'required|min:1000|numeric',
            'quantity'      => 'required|min:0|numeric',
            'image'         => 'nullable|image|max:2000',
        ]);

        //Kiểm tra xem có lỗi validate không
        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => $validator->errors(),
            ]);
        }

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

            return response()->json([
                'status' => true,
                'message' => 'Thêm mới thành công',
            ], 201);
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            //Kiểm tra xem có dữ liệu image không và có tồn tại file này trong storage không có thì xóa
            if (!empty($data['image']) && Storage::exists($data['image'])) {
                Storage::delete($data['image']);
            }

            //Lỗi hệ thống
            return response()->json([
                'status' => false,
                'message'   => 'Lỗi hệ thống',
            ], 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        try {
            //Tìm sản phẩm theo id nếu không thấy trả về lỗi
            $product = Product::findOrFail($id);

            return response()->json([
                'status' => true,
                'data'   => $product,
            ]);
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            //404 notfound
            return response()->json([
                'status' => false,
                'message'   => 'Không tìm thấy sản phẩm với id =' . $id,
            ], 404);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //Kiểm tra validate
        $validator = Validator::make($request->all(), [
            'name'          => 'required|string',
            'category_id'   => 'required|exists:categories,id',
            'description'   => 'nullable',
            'price'         => 'required|min:1000|numeric',
            'quantity'      => 'required|min:0|numeric',
            'image'         => 'nullable|image|max:2000',
        ]);

        //Kiểm tra xem có lỗi validate không
        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => $validator->errors(),
            ]);
        }

        //Tìm sản phẩm nếu k có trả về lỗi
        $product = Product::findOrFail($id);

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
            if (!empty($data['image']) && Storage::exists($currencyImage)) {
                Storage::delete($currencyImage);
            }

            return response()->json([
                'status' => true,
                'message' => 'Cập nhật thành công',
            ]);
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            //Kiểm tra xem có dữ liệu image không và có tồn tại file này trong storage không có thì xóa
            if (!empty($data['image']) && Storage::exists($data['image'])) {
                Storage::delete($data['image']);
            }

            return response()->json([
                'status' => false,
                'message'   => 'Lỗi hệ thống',
            ], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        try {
            //Tìm sản phẩm nếu k có trả về lỗi
            $product = Product::findOrFail($id);

            //Xóa sản phẩm
            $product->delete();

            //Xóa ảnh sản phẩm
            if (Storage::exists($product->image)) {
                Storage::delete($product->image);
            }

            return response()->json([
                'status' => true,
                'message' => 'Xóa thành công'
            ], 204);
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            //Lỗi hệ thống
            return response()->json([
                'status' => false,
                'message'   => 'Không tìm thấy danh mục với id =' . $id,
            ], 500);
        }
    }
}
