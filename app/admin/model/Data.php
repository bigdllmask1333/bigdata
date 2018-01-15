<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2017/12/21
 * Time: 10:15
 */

namespace app\admin\model;

use think\Model;
use think\Db;
class Data  extends Model
{
    /**
     * 数获取数据列表
     * @author 吴伟祥 <1113249273@qq.com>
     * @return mixed
     */
    public static function datalist(){
        $datalist=Db::table('hisi_bigdata')->where('del',0)->paginate(10);
        return $datalist;
    }

    public static  function  chdatalist($info){
        $datalist=Db::table('hisi_bigdata')->field('type2,min_typename')->where('type1',$info)->select();
        return $datalist;
    }

    /**
     * 分类数据列表
     * @author 吴伟祥 <1113249273@qq.com>
     * @return mixed
     */
    public static function  wanwanlist($type2,$min_typename){
        $datalist=Db::table('hisi_bigdata')
            ->where('type2',$type2)
            ->where('min_typename',$min_typename)
            ->select();
        return $datalist;
    }

    /**
     * 新增数据
     * @author 吴伟祥 <1113249273@qq.com>
     * @return mixed
     */
    public static function creates($data){
        $datalist=Db::table('hisi_bigdata')->insert($data);
        if ($datalist){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 更新数据
     * @author 吴伟祥 <1113249273@qq.com>
     * @return mixed
     */
    public static function updates($data){
        $datalist=Db::table('hisi_bigdata')->where('id', $data['id'])->update($data);
        if ($datalist){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 编辑信息获取
     * @author 吴伟祥 <1113249273@qq.com>
     * @return mixed
     */
    public static function datainfo($id){
        $datalist=Db::table('hisi_bigdata')->where('id',$id)->find();
        if ($datalist){
            return $datalist;
        }else{
            return false;
        }
    }

    /**
     * 删除对应信息
     * @author 吴伟祥 <1113249273@qq.com>
     * @return mixed
     */
    public static function datadel($id){
        $check=Db::table('hisi_bigdata')->delete($id);
        if ($check){
            return true;
        }else{
            return false;
        }
    }


}