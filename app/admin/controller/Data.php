<?php
// +----------------------------------------------------------------------
// | HisiPHP框架[基于ThinkPHP5开发]
// +----------------------------------------------------------------------
// | Copyright (c) 2016-2018 http://www.hisiphp.com
// +----------------------------------------------------------------------
// | HisiPHP承诺基础框架永久免费开源，您可用于学习和商用，但必须保留软件版权信息。
// +----------------------------------------------------------------------
// | Author: 橘子俊 <364666827@qq.com>，开发者QQ群：50304283
// +----------------------------------------------------------------------
namespace app\admin\controller;

use app\common\util\Dir;
use app\admin\model\Data as DataModel;
use \think\Request;

/**
 * 后台默认首页控制器
 * @package app\admin\controller
 */

class Data extends Admin
{

    /**
     * 中文数据库
     * @author 吴伟祥 <1113249273@qq.com>
     * @return mixed
     */
    public function ch_data(){
        $data_list = DataModel::chdatalist('ch_data');
        $ee=[];
        $ff=[];
        foreach ($data_list as $k => $v) {
            if (!in_array($v['type2'].$v['min_typename'],$ee)) {
                $ff[]=$v;
                $ee[]=$v['type2'].$v['min_typename'];
            }
        }
        $new_data=array_group_by($ff, 'type2');
        $this->assign('datalist',$new_data);
        return $this->fetch();
    }

    /**
     * 英文数据库
     * @author 吴伟祥 <1113249273@qq.com>
     * @return mixed
     */
    public function en_data(){
//        $data_list = DataModel::chdatalist('en_data');
//        $this->assign('datalist',$data_list);
//        return $this->fetch();


        $data_list = DataModel::chdatalist('en_data');
        $ee=[];
        $ff=[];
        foreach ($data_list as $k => $v) {
            if (!in_array($v['type2'].$v['min_typename'],$ee)) {
                $ff[]=$v;
                $ee[]=$v['type2'].$v['min_typename'];
            }
        }
        $new_data=array_group_by($ff, 'type2');
        $this->assign('datalist',$new_data);
        return $this->fetch();
    }


    /**
     * 医学数据库
     * @author 吴伟祥 <1113249273@qq.com>
     * @return mixed
     */
    public function doc_data(){
        $data_list = DataModel::chdatalist('doc_data');
        $ee=[];
        $ff=[];
        foreach ($data_list as $k => $v) {
            if (!in_array($v['type2'].$v['min_typename'],$ee)) {
                $ff[]=$v;
                $ee[]=$v['type2'].$v['min_typename'];
            }
        }
        $new_data=array_group_by($ff, 'type2');
        $this->assign('datalist',$new_data);
        return $this->fetch();
    }


    /**
     * 法律数据库
     * @author 吴伟祥 <1113249273@qq.com>
     * @return mixed
     */
    public function law_data(){
        $data_list = DataModel::chdatalist('law_data');
        $ee=[];
        $ff=[];
        foreach ($data_list as $k => $v) {
            if (!in_array($v['type2'].$v['min_typename'],$ee)) {
                $ff[]=$v;
                $ee[]=$v['type2'].$v['min_typename'];
            }
        }
        $new_data=array_group_by($ff, 'type2');
        $this->assign('datalist',$new_data);
        return $this->fetch();
    }

    /**
     * 经济数据库
     * @author 吴伟祥 <1113249273@qq.com>
     * @return mixed
     */
    public function ec_data(){
        $data_list = DataModel::chdatalist('ec_data');
        $ee=[];
        $ff=[];
        foreach ($data_list as $k => $v) {
            if (!in_array($v['type2'].$v['min_typename'],$ee)) {
                $ff[]=$v;
                $ee[]=$v['type2'].$v['min_typename'];
            }
        }
        $new_data=array_group_by($ff, 'type2');
        $this->assign('datalist',$new_data);
        return $this->fetch();
    }

    /**
     * 数据录入页面
     * @author 吴伟祥 <1113249273@qq.com>
     * @return mixed
     */
    public function add_data(){
        $data_list = DataModel::datalist();
        // 获取分页显示
        $page = $data_list->render();
        $this->assign('page', $page);
        $this->assign('datalist',$data_list);
        return $this->fetch();
    }


    /**
     * 数据显示页面
     * @author 吴伟祥 <1113249273@qq.com>
     * @return mixed
     */
    public function data_show(){
//        $type2=input('get.type2');
        $type2=input('type2');
        $min_typename=input('min_typename');

        $detail_list = DataModel::wanwanlist($type2,$min_typename);
        error_log("你好".var_export($detail_list,true));

//        dump($detail_list[0]['type']);
        $this->assign('choose_type', $detail_list[0]['type']);

        $this->assign('choose_list', $detail_list);
        $this->assign('webdoor', $detail_list[0]['webdoor']);
        $this->assign('webname', $detail_list[0]['type2']);
        return $this->fetch();
    }

     /*留言板显示页面*/
     public function lyb(){
         return $this->fetch('message');
     }
    /**
     * 数据新增录入
     * @author 吴伟祥 <1113249273@qq.com>
     * @return mixed
     */
    public function add(){
        if ($this->request->isPost()) {
            $data = $this->request->post();
            // 验证
//            $result = $this->validate($data, 'AdminRole');
//            if($result !== true) {
//                return $this->error($result);
//            }
            unset($data['id']);
            if (!DataModel::creates($data)) {
                return $this->error('添加失败');
            }
            return $this->success('添加成功','add_data');
        }
        return $this->fetch();
    }

    /**
     * 修改录入数据
     * @author 吴伟祥 <1113249273@qq.com>
     * @return mixed
     */
    public function edit_data($id = 0)
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();
            // 当前登陆用户不可更改自己的分组角色
            // 验证
//            $result = $this->validate($data, 'AdminRole');
//            if($result !== true) {
//                return $this->error($result);
//            }
            if (!DataModel::updates($data)) {
                return $this->error('修改失败');
            }
            return $this->success('修改成功','add_data');
        }

        $data=DataModel::datainfo($id);
        $this->assign('data_info', $data);
        return $this->fetch();
    }

    /**
     * 删除记录
     * @author 吴伟祥 <1113249273@qq.com>
     * @return mixed
     */
    public function deldata($id = 0){
        $datadel=DataModel::datadel($id);
        if ($datadel){
            return $this->success('删除成功','add_data');
        }else{
            return $this->error('删除失败');
        }

    }
}
