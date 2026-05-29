package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FLocationDeviceMapper;
import com.ruoyi.system.domain.FLocationDevice;
import com.ruoyi.system.service.IFLocationDeviceService;

/**
 * 定位设备管理Service业务层处理
 *
 * @author ruoyi
 * @date 2026-05-29
 */
@Service
public class FLocationDeviceServiceImpl implements IFLocationDeviceService
{
    @Autowired
    private FLocationDeviceMapper fLocationDeviceMapper;

    @Override
    public FLocationDevice selectFLocationDeviceById(Long id)
    {
        return fLocationDeviceMapper.selectFLocationDeviceById(id);
    }

    @Override
    public List<FLocationDevice> selectFLocationDeviceList(FLocationDevice fLocationDevice)
    {
        return fLocationDeviceMapper.selectFLocationDeviceList(fLocationDevice);
    }

    @Override
    public int insertFLocationDevice(FLocationDevice fLocationDevice)
    {
        return fLocationDeviceMapper.insertFLocationDevice(fLocationDevice);
    }

    @Override
    public int updateFLocationDevice(FLocationDevice fLocationDevice)
    {
        return fLocationDeviceMapper.updateFLocationDevice(fLocationDevice);
    }

    @Override
    public int deleteFLocationDeviceByIds(Long[] ids)
    {
        return fLocationDeviceMapper.deleteFLocationDeviceByIds(ids);
    }

    @Override
    public int deleteFLocationDeviceById(Long id)
    {
        return fLocationDeviceMapper.deleteFLocationDeviceById(id);
    }

    @Override
    public List<FLocationDevice> selectAvailableDevices(FLocationDevice query)
    {
        return fLocationDeviceMapper.selectAvailableDevices(query);
    }
}
