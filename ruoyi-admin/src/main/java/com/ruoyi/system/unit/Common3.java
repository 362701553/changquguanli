package com.ruoyi.system.unit;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.mapper.SysUserMapper;
import com.ruoyi.system.mapper.SysUserPostMapper;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.system.service.impl.SysUserServiceImpl;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;

//公共
public class Common3 {
    @Autowired
    private ISysUserService userService;
    @Autowired
    private SysUserServiceImpl sysUserService;
    @Autowired
    private SysUserMapper userMapper;
    @Autowired
    private SysUserPostMapper userPostMapper;


    /**
     * 通过用户ID查询用户
     *
     * @param userId 用户ID
     * @return 用户对象信息
     */
    public SysUser selectUserById(String userId)
    {
        return userMapper.selectUserById(Long.valueOf(userId));
    }

    /**
     * 写个单独注册用户的 todo
     */
    //
    /**
     * 新增保存用户信息
     */
    public int insertUser(SysUser user)
    {   //加判断是为了注册 如果是前端界面个人用户自己注册的 那就是直接写死部门角色 岗位这些就自动用权限了
        if(Strings.isNotEmpty(user.getYonghuType())){
            if("1".equals(user.getYonghuType())){//1就是普通用户
                //所属部门deptId todo 不能写死外部传
                //岗位postIds   todo 不能写死外部传
                //角色roleIds   todo 不能写死外部传
                user.setDeptId(104L);
                Long[] postIds = {4L};
                user.setPostIds(postIds);
                Long[] roleIds = {2L};
                user.setRoleIds(roleIds);
            }
        }
        // 新增用户信息
        int rows = userMapper.insertUser(user);
        // 新增用户岗位关联
        sysUserService.insertUserPost(user);
        // 新增用户与角色管理
        sysUserService.insertUserRole(user);
        return rows;
    }


    //(一.1)写个单独注册用户的
    //下面的方法是例子
//不同实体放进来就写成   // 新增用户岗位关联  // 新增用户与角色管理写成了一个方法
    public void insertUserPostAndRole(Long[] postIds,Long userId,Long[] roleIds){
        //用到user.getPostIds();
        //用到user.getUserId()
        //用到user.getRoleIds()
        SysUser user = new SysUser();
        user.setPostIds(postIds);
        user.setUserId(userId);
        user.setRoleIds(roleIds);
        sysUserService.insertUserPost(user);
        // 新增用户与角色管理
        sysUserService.insertUserRole(user);
    }

////(一.2)实体里面添加 todo
//    private SysDept dept;
//    /** 角色对象 */
//    private List<SysRole> roles;
//    /** 角色组 */
//    private Long[] roleIds;
//    /** 岗位组 */
//    private Long[] postIds;
//    /** 角色ID */
//    private Long roleId;


//** *(一.3)看例子 todo */
//    public int insertSysStru(不同的实体)
//    {
//        user.setCreateTime(DateUtils.getNowDate());
//        //所属部门deptId todo 不能写死外部传
//        //岗位postIds   todo 不能写死外部传
//        //角色roleIds   todo 不能写死外部传
//        user.setDeptId(105L);
//        Long[] postIds = {4L};
//        user.setPostIds(postIds);
//        Long[] roleIds = {2L};
//        user.setRoleIds(roleIds);
//        // 新增用户信息
//        int rows = sysStruMapper.insertSysStru(user);
//        //新增角色及其岗位关联信息
////        在这调用
//        common2.insertUserPostAndRole(user.getPostIds(),user.getUserId(),user.getRoleIds());
//        return rows;
//    }


}
