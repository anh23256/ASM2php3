<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashBoardController extends Controller
{
    public function index(Request $request)
    {
        try {
            //kiểm tra nếu date lớn hơn hiện tại thì cho về hiện tại
            if ($request->input('date') > now()) $date = now();
            //lấy thời gian
            $date = date('Y/m/d', strtotime($request->input('date') ?? now()));
            //Lấy thời gian trừ đi 30 ngày
            $mothDate = date('Y/m/d', strtotime($date . ' -30 days'));
            //Tính tiền thu được trong 1 tháng
            $earnMonth = DB::table('orders')->select(DB::raw("SUM(total_amount) as total_earnings"))
                ->where('status', 'completed')
                ->where('updated_at', '>=', $mothDate)
                ->where('updated_at', '<=', $date)->get();

            $orderCompled = DB::table('orders')->select(DB::raw("COUNT(*) as count_compled"))
            ->where('status', 'completed')
            ->where('updated_at', '>=', $mothDate)
            ->where('updated_at', '<=', $date)->get();

            // $dataEarnToMonth = [];

            // for ($i=1; $i <=12 ; $i++) { 
            //     $earnMonth = DB::table('orders')->select(DB::raw("SUM(total_amount) as total_earnings"))
            //     ->where('status', 'completed')
            //     ->whereMonth('updated_at',$i)->get();

            //     $dataEarnToMonth[] = $earnMonth[0]->total_earnings ?? 0;
            // }

            // $dataChartArea = json_encode($dataEarnToMonth);
            
            //Kiểm tra nếu total_earnings trống thì gán bằng 0
            if (empty($earnMonth[0]->total_earnings)) $earnMonth[0]->total_earnings = 0;

            return view('admin.dashboard', compact('earnMonth', 'orderCompled'));
        } catch (\Throwable $th) {
            abort(500);
        }
    }
}
