package com.ruoyi.system.service.impl;

import java.util.List;
import java.util.stream.Collectors;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.system.domain.FForklift;
import com.ruoyi.system.domain.FForkliftDriver;
import com.ruoyi.system.mapper.FForkliftMapper;
import com.ruoyi.system.mapper.FForkliftDriverMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.system.mapper.FForkliftDriverBaseMapper;
import com.ruoyi.system.domain.FForkliftDriverBase;
import com.ruoyi.system.service.IFForkliftDriverBaseService;

/**
 * 叉车司机信息Service业务层处理
 *
 * @author ruoyi
 * @date 2026-05-28
 */
@Service
public class FForkliftDriverBaseServiceImpl implements IFForkliftDriverBaseService
{
    @Autowired
    private FForkliftDriverBaseMapper fForkliftDriverBaseMapper;

    @Autowired
    private FForkliftDriverMapper fForkliftDriverMapper;

    @Autowired
    private FForkliftMapper fForkliftMapper;

    @Autowired
    private ISysUserService userService;

    private static final Long FORKLIFT_DRIVER_ROLE_ID = 4L;
    private static final Long FORKLIFT_DRIVER_DEPT_ID = 103L;

    @Override
    public FForkliftDriverBase selectFForkliftDriverBaseById(Long id)
    {
        FForkliftDriverBase base = fForkliftDriverBaseMapper.selectFForkliftDriverBaseById(id);
        if (base != null)
        {
            FForkliftDriver query = new FForkliftDriver();
            query.setDriverId(id);
            List<FForkliftDriver> driverList = fForkliftDriverMapper.selectFForkliftDriverList(query);
            base.setForkliftList(driverList);
            base.setForkliftIds(driverList.stream().map(FForkliftDriver::getForkliftId).collect(Collectors.toList()));
        }
        return base;
    }

    @Override
    public List<FForkliftDriverBase> selectFForkliftDriverBaseList(FForkliftDriverBase fForkliftDriverBase)
    {
        List<FForkliftDriverBase> list = fForkliftDriverBaseMapper.selectFForkliftDriverBaseList(fForkliftDriverBase);
        for (FForkliftDriverBase item : list)
        {
            FForkliftDriver query = new FForkliftDriver();
            query.setDriverId(item.getId());
            List<FForkliftDriver> driverList = fForkliftDriverMapper.selectFForkliftDriverList(query);
            String codes = driverList.stream()
                .map(FForkliftDriver::getForkliftCode)
                .filter(StringUtils::isNotEmpty)
                .collect(Collectors.joining(","));
            item.setForkliftCodes(codes);
        }
        return list;
    }

    @Override
    @Transactional
    public int insertFForkliftDriverBase(FForkliftDriverBase fForkliftDriverBase)
    {
        // 校验手机号唯一（叉车司机表）
        FForkliftDriverBase existDriver = fForkliftDriverBaseMapper.selectFForkliftDriverBaseByPhone(fForkliftDriverBase.getDriverPhone());
        if (existDriver != null)
        {
            throw new ServiceException("该手机号已存在叉车司机记录");
        }

        // 确定账号：优先用account，否则用手机号
        String userName = StringUtils.isNotEmpty(fForkliftDriverBase.getAccount()) ? fForkliftDriverBase.getAccount() : fForkliftDriverBase.getDriverPhone();

        // 校验用户名唯一（系统用户表）
        if (UserConstants.NOT_UNIQUE.equals(userService.checkUserNameUnique(userName)))
        {
            throw new ServiceException("账号'" + userName + "'已存在，请更换账号");
        }

        // 同步新增系统用户
        SysUser sysUser = new SysUser();
        sysUser.setUserName(userName);
        sysUser.setNickName(fForkliftDriverBase.getDriverName());
        sysUser.setPhonenumber(fForkliftDriverBase.getDriverPhone());
        sysUser.setDeptId(FORKLIFT_DRIVER_DEPT_ID);
        sysUser.setPassword(SecurityUtils.encryptPassword(fForkliftDriverBase.getPassword()));
        sysUser.setRoleIds(new Long[]{FORKLIFT_DRIVER_ROLE_ID});
        userService.insertUser(sysUser);

        fForkliftDriverBase.setUserId(sysUser.getUserId());
        fForkliftDriverBase.setAccount(userName);
        int rows = fForkliftDriverBaseMapper.insertFForkliftDriverBase(fForkliftDriverBase);

        // 保存叉车关联
        saveForkliftRelation(fForkliftDriverBase);

        return rows;
    }

    @Override
    @Transactional
    public int updateFForkliftDriverBase(FForkliftDriverBase fForkliftDriverBase)
    {
        // 同步修改关联的系统用户
        if (fForkliftDriverBase.getUserId() != null)
        {
            SysUser sysUser = new SysUser();
            sysUser.setUserId(fForkliftDriverBase.getUserId());
            String userName = StringUtils.isNotEmpty(fForkliftDriverBase.getAccount()) ? fForkliftDriverBase.getAccount() : fForkliftDriverBase.getDriverPhone();
            sysUser.setUserName(userName);
            sysUser.setNickName(fForkliftDriverBase.getDriverName());
            sysUser.setPhonenumber(fForkliftDriverBase.getDriverPhone());
            if (StringUtils.isNotEmpty(fForkliftDriverBase.getPassword()))
            {
                sysUser.setPassword(SecurityUtils.encryptPassword(fForkliftDriverBase.getPassword()));
            }
            userService.updateUser(sysUser);
        }

        int rows = fForkliftDriverBaseMapper.updateFForkliftDriverBase(fForkliftDriverBase);

        // 先删后增叉车关联
        fForkliftDriverMapper.deleteFForkliftDriverByDriverId(fForkliftDriverBase.getId());
        saveForkliftRelation(fForkliftDriverBase);

        return rows;
    }

    @Override
    @Transactional
    public int deleteFForkliftDriverBaseByIds(Long[] ids)
    {
        for (Long id : ids)
        {
            FForkliftDriverBase driver = fForkliftDriverBaseMapper.selectFForkliftDriverBaseById(id);
            if (driver != null && driver.getUserId() != null)
            {
                userService.deleteUserById(driver.getUserId());
            }
            fForkliftDriverMapper.deleteFForkliftDriverByDriverId(id);
        }
        return fForkliftDriverBaseMapper.deleteFForkliftDriverBaseByIds(ids);
    }

    @Override
    @Transactional
    public int deleteFForkliftDriverBaseById(Long id)
    {
        FForkliftDriverBase driver = fForkliftDriverBaseMapper.selectFForkliftDriverBaseById(id);
        if (driver != null && driver.getUserId() != null)
        {
            userService.deleteUserById(driver.getUserId());
        }
        fForkliftDriverMapper.deleteFForkliftDriverByDriverId(id);
        return fForkliftDriverBaseMapper.deleteFForkliftDriverBaseById(id);
    }

    private void saveForkliftRelation(FForkliftDriverBase driverBase)
    {
        List<Long> forkliftIds = driverBase.getForkliftIds();
        if (forkliftIds != null && !forkliftIds.isEmpty())
        {
            for (Long forkliftId : forkliftIds)
            {
                FForklift forklift = fForkliftMapper.selectFForkliftById(forkliftId);
                FForkliftDriver relation = new FForkliftDriver();
                relation.setDriverId(driverBase.getId());
                relation.setForkliftId(forkliftId);
                relation.setForkliftCode(forklift != null ? forklift.getForkliftCode() : null);
                relation.setDriverName(driverBase.getDriverName());
                relation.setStatus("0");
                fForkliftDriverMapper.insertFForkliftDriver(relation);
            }
        }
    }
}
