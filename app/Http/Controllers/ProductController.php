<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $products = Product::query()->select('id', 'name', 'price', 'image', 'category_id')->with('category')->latest('id')->limit(8)->get();
            $categories = Category::query()->select('id', 'name')->with(['products' => function ($query) {
                $query->select('id', 'name', 'price', 'image','category_id')->with('category')->latest('id')->limit(8);
            }])->latest('id')->limit(4)->get();
            $productCates['AllProduct'] = $products;

            foreach ($categories as $category) {
                $productCates[$category->name] = $category->products;
            }

            // dd($productCates);
            return view('client.index', compact('productCates'));
        } catch (\Throwable $th) {
            abort(500);
        }
    }

    /**
     * Show the form for creating a new resource.
     */
    public function shopDetail(Product $product)
    {
        try {
            $cate_id = $product->category_id;
            $category = Category::query()->where('id', $cate_id)->first();
            $relatedProducts = $category->products()->get();

            return view('client.shop-detail', compact('product', 'relatedProducts', 'category'));
        } catch (\Throwable $th) {
            abort_if(empty($product), 404);
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function shop(Request $request)
    {
        try {
            $products = Product::query()->latest('id')->paginate(9);
            $keyword = $request->input('search') ?? '';

            if (!empty($keyword)) {
                $products = Product::where('name', 'like', "%{$keyword}%")->latest('id')->paginate(9);
            }
            // dd($products);
            return view('client.shop', compact('products', 'keyword'));
        } catch (\Throwable $th) {
            abort(500);
        }
    }
}
