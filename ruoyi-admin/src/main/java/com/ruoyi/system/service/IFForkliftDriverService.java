package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.FForkliftDriver;

/**
 * 叉车-司机关联Service接口
 * 
 * @author ruoyi
 * @date 2026-05-28
 */
public interface IFForkliftDriverService 
{
    /**
     * 查询叉车-司机关联
     * 
     * @param myRowId 叉车-司机关联主键
     * @return 叉车-司机关联
     */
    public FForkliftDriver selectFForkliftDriverByMyRowId(String myRowId);

    /**
     * 查询叉车-司机关联列表
     * 
     * @param fForkliftDriver 叉车-司机关联
     * @return 叉车-司机关联集合
     */
    public List<FForkliftDriver> selectFForkliftDriverList(FForkliftDriver fForkliftDriver);

    /**
     * 新增叉车-司机关联
     * 
     * @param fForkliftDriver 叉车-司机关联
     * @return 结果
     */
    public int insertFForkliftDriver(FForkliftDriver fForkliftDriver);

    /**
     * 修改叉车-司机关联
     * 
     * @param fForkliftDriver 叉车-司机关联
     * @return 结果
     */
    public int updateFForkliftDriver(FForkliftDriver fForkliftDriver);

    /**
     * 批量删除叉车-司机关联
     * 
     * @param myRowIds 需要删除的叉车-司机关联主键集合
     * @return 结果
     */
    public int deleteFForkliftDriverByMyRowIds(String[] myRowIds);

    /**
     * 删除叉车-司机关联信息
     * 
     * @param myRowId 叉车-司机关联主键
     * @return 结果
     */
    public int deleteFForkliftDriverByMyRowId(String myRowId);
}
