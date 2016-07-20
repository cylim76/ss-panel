<?php

namespace App\Controllers\Admin;

use App\Models\AutoCtrl;
use App\Controllers\AdminController;

class AutoCtrlController extends AdminController
{
    public function index($request, $response, $args){
		$pageNum = 1;
        if (isset($request->getQueryParams()["page"])) {
            $pageNum = $request->getQueryParams()["page"];
        }
        $logs = AutoCtrl::orderBy('id', 'desc')->paginate(15, ['*'], 'page', $pageNum);
		$logs->setPath('/admin/autoctrl');
        return $this->view()->assign('logs',$logs)->display('admin/autoctrl/index.tpl');
    }

    public function create($request, $response, $args){
        return $this->view()->display('admin/autoctrl/add.tpl');
    }

    public function add($request, $response, $args){
        $autoctrl = new AutoCtrl();
        $autoctrl->datetime =  time();
		$autoctrl->value =  $request->getParam('content');
		$autoctrl->sign =  $request->getParam('sign');
		$autoctrl->type =  1;
        
        if(!$autoctrl->save()){
            $rs['ret'] = 0;
            $rs['msg'] = "添加失败";
            return $response->getBody()->write(json_encode($rs));
        }
        $rs['ret'] = 1;
        $rs['msg'] = "添加成功";
        return $response->getBody()->write(json_encode($rs));
    }


	public function delete($request, $response, $args){
        $id = $request->getParam('id');
        $autoctrl = AutoCtrl::find($id);
        if(!$autoctrl->delete()){
            $rs['ret'] = 0;
            $rs['msg'] = "删除失败";
            return $response->getBody()->write(json_encode($rs));
        }
        $rs['ret'] = 1;
        $rs['msg'] = "删除成功";
        return $response->getBody()->write(json_encode($rs));
    }

}