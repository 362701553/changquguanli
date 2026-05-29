package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.FLocationDevice;

/**
 * 定位设备管理Service接口
 *
 * @author ruoyi
 * @date 2026-05-29
 */
public interface IFLocationDeviceService
{
    /**
     * 查询定位设备
     *
     * @param id 定位设备主键
     * @return 定位设备
     */
    public FLocationDevice selectFLocationDeviceById(Long id);

    /**
     * 查询定位设备列表
     *
     * @param fLocationDevice 定位设备
     * @return 定位设备集合
     */
    public List<FLocationDevice> selectFLocationDeviceList(FLocationDevice fLocationDevice);

    /**
     * 新增定位设备
     *
     * @param fLocationDevice 定位设备
     * @return 结果
     */
    public int insertFLocationDevice(FLocationDevice fLocationDevice);

    /**
     * 修改定位设备
     *
     * @param fLocationDevice 定位设备
     * @return 结果
     */
    public int updateFLocationDevice(FLocationDevice fLocationDevice);

    /**
     * 批量删除定位设备
     *
     * @param ids 需要删除的定位设备主键集合
     * @return 结果
     */
    public int deleteFLocationDeviceByIds(Long[] ids);

    /**
     * 删除定位设备信息
     *
     * @param id 定位设备主键
     * @return 结果
     */
    public int deleteFLocationDeviceById(Long id);

    /**
     * 查询可用定位设备列表（支持条件过滤）
     *
     * @param query 查询条件
     * @return 可用定位设备集合
     */
    public List<FLocationDevice> selectAvailableDevices(FLocationDevice query);
}
