package com.ruoyi.system.unit;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.uuid.IdUtils;

import java.text.SimpleDateFormat;
import java.util.Date;

//公共
public class Common {

    /**
     * 通用的方法调用 生成id
     * @return 结果
     */
    public static String  shengchengID(){
        return IdUtils.fastUUID();
    }


    /**
     * 后台获取当前登录人id   用于控制权限也行。 自己看自己的
     */
    public static String  shengchengUserID(){
        return String.valueOf(SecurityUtils.getUserId());
    }

    /**
     * 生成登陆人的账号
     */
    public static String  shengchengUserNAME(){
        return String.valueOf(SecurityUtils.getUsername());
    }

    /**
     * 获取用户身份信息
     */
    public static LoginUser shengLoginUser(){
        return   SecurityUtils.getLoginUser();
    }


    /**
     * 获取用户姓名
     */
    public static String shengchengNickNAME(){
        LoginUser l =  SecurityUtils.getLoginUser();
        SysUser sysUser = l.getUser();
        return  sysUser.getNickName();
    }


    /**
     * 后台转换时间
     */
    public static String shengchengTime(){
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date =new Date();
        return  sdf1.format(date);
    }

}
