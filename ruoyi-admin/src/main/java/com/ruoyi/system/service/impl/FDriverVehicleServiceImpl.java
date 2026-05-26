package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.system.mapper.FDriverVehicleMapper;
import com.ruoyi.system.domain.FDriverVehicle;
import com.ruoyi.system.service.IFDriverVehicleService;

/**
 * 车辆司机主Service业务层处理
 *
 * @author ruoyi
 * @date 2026-05-26
 */
@Service
public class FDriverVehicleServiceImpl implements IFDriverVehicleService
{
    @Autowired
    private FDriverVehicleMapper fDriverVehicleMapper;

    @Autowired
    private ISysUserService userService;

    private static final Long DRIVER_ROLE_ID = 3L;
    private static final Long DRIVER_DEPT_ID = 105L;

    /**
     * 查询车辆司机主
     *
     * @param id 车辆司机主主键
     * @return 车辆司机主
     */
    @Override
    public FDriverVehicle selectFDriverVehicleById(Long id)
    {
        return fDriverVehicleMapper.selectFDriverVehicleById(id);
    }

    /**
     * 查询车辆司机主列表
     *
     * @param fDriverVehicle 车辆司机主
     * @return 车辆司机主
     */
    @Override
    public List<FDriverVehicle> selectFDriverVehicleList(FDriverVehicle fDriverVehicle)
    {
        return fDriverVehicleMapper.selectFDriverVehicleList(fDriverVehicle);
    }

    /**
     * 新增车辆司机主
     *
     * @param fDriverVehicle 车辆司机主
     * @return 结果
     */
    @Override
    @Transactional
    public int insertFDriverVehicle(FDriverVehicle fDriverVehicle)
    {
        fDriverVehicle.setCreateTime(DateUtils.getNowDate());

        // 同步新增系统用户
        SysUser sysUser = new SysUser();
        String userName = StringUtils.isNotEmpty(fDriverVehicle.getAccount()) ? fDriverVehicle.getAccount() : fDriverVehicle.getPhone();
        sysUser.setUserName(userName);
        sysUser.setNickName(fDriverVehicle.getDriverName());
        sysUser.setPhonenumber(fDriverVehicle.getPhone());
        sysUser.setDeptId(DRIVER_DEPT_ID);
        sysUser.setPassword(SecurityUtils.encryptPassword(fDriverVehicle.getPassword()));
        sysUser.setRoleIds(new Long[]{DRIVER_ROLE_ID});
        userService.insertUser(sysUser);

        // 回写userId到司机记录
        fDriverVehicle.setUserId(sysUser.getUserId());

        return fDriverVehicleMapper.insertFDriverVehicle(fDriverVehicle);
    }

    /**
     * 修改车辆司机主
     *
     * @param fDriverVehicle 车辆司机主
     * @return 结果
     */
    @Override
    @Transactional
    public int updateFDriverVehicle(FDriverVehicle fDriverVehicle)
    {
        fDriverVehicle.setUpdateTime(DateUtils.getNowDate());

        // 同步修改关联的系统用户
        if (fDriverVehicle.getUserId() != null)
        {
            SysUser sysUser = new SysUser();
            sysUser.setUserId(fDriverVehicle.getUserId());
            String userName = StringUtils.isNotEmpty(fDriverVehicle.getAccount()) ? fDriverVehicle.getAccount() : fDriverVehicle.getPhone();
            sysUser.setUserName(userName);
            sysUser.setNickName(fDriverVehicle.getDriverName());
            sysUser.setPhonenumber(fDriverVehicle.getPhone());
            if (StringUtils.isNotEmpty(fDriverVehicle.getPassword()))
            {
                sysUser.setPassword(SecurityUtils.encryptPassword(fDriverVehicle.getPassword()));
            }
            userService.updateUser(sysUser);
        }

        return fDriverVehicleMapper.updateFDriverVehicle(fDriverVehicle);
    }

    /**
     * 批量删除车辆司机主
     *
     * @param ids 需要删除的车辆司机主主键
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteFDriverVehicleByIds(Long[] ids)
    {
        // 同步删除关联的系统用户
        for (Long id : ids)
        {
            FDriverVehicle driver = fDriverVehicleMapper.selectFDriverVehicleById(id);
            if (driver != null && driver.getUserId() != null)
            {
                userService.deleteUserById(driver.getUserId());
            }
        }
        return fDriverVehicleMapper.deleteFDriverVehicleByIds(ids);
    }

    /**
     * 删除车辆司机主信息
     *
     * @param id 车辆司机主主键
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteFDriverVehicleById(Long id)
    {
        // 同步删除关联的系统用户
        FDriverVehicle driver = fDriverVehicleMapper.selectFDriverVehicleById(id);
        if (driver != null && driver.getUserId() != null)
        {
            userService.deleteUserById(driver.getUserId());
        }
        return fDriverVehicleMapper.deleteFDriverVehicleById(id);
    }
}
