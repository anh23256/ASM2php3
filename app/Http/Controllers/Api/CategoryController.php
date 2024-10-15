<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            //Lấy tất cả categories
            $categories = Category::query()->latest('id')->paginate(10);

            return response()->json([
                'status' => true,
                'data'   => $categories,
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
            'name'  => 'required|string|max:10|unique:categories',
        ]);

        //Kiểm tra xem có lỗi validate không
        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => $validator->errors(),
            ]);
        }

        try {
            //Thêm mới danh mục
            Category::query()->create($request->all());

            return response()->json([
                'status' => true,
                'message' => 'Thêm mới thành công',
            ], 201);
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
     * Display the specified resource.
     */
    public function show(string $id)
    {
        try {
            //Tìm category theo id nếu không thấy trả về lỗi
            $category = Category::findOrFail($id);

            return response()->json([
                'status' => true,
                'data'   => $category,
            ]);
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

            //404 notfound
            return response()->json([
                'status' => false,
                'message'   => 'Không tìm thấy danh mục với id =' . $id,
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
            'name' => ['required', 'string', 'max:10', Rule::unique('categories')->ignore($id)],
        ]);

        //Kiểm tra xem có lỗi validate không
        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => $validator->errors(),
            ]);
        }

        //Tìm category theo id nếu không thấy trả về lỗi
        $category = Category::findOrFail($id);

        try {
            //Cập nhật sản phẩm
            $category->update($request->all());

            return response()->json([
                'status' => true,
                'message' => 'Cập nhật thành công',
            ]);
        } catch (\Throwable $th) {
            //Log lỗi
            Log::error(__CLASS__ . '@' . __FUNCTION__, ['errors' => $th->getMessage()]);

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
            //Tìm category theo id nếu không thấy trả về lỗi
            $category = Category::findOrFail($id);

            //Xóa danh mục
            $category->delete();

            return response()->json([
                'status' => true,
                'message'=> 'Xóa thành công'
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

    public function products(string $id)
    {
        try {
            //Kiểm tra xem có cate không không trả về lỗi
            $category = Category::findOrFail($id);

            return response()->json([
                'status'     => true,
                'category'   => $category->name,
                'products'   => $category->products,
            ]);
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
