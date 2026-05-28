package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FForkliftDriverMapper;
import com.ruoyi.system.domain.FForkliftDriver;
import com.ruoyi.system.service.IFForkliftDriverService;

/**
 * 叉车-司机关联Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-05-28
 */
@Service
public class FForkliftDriverServiceImpl implements IFForkliftDriverService 
{
    @Autowired
    private FForkliftDriverMapper fForkliftDriverMapper;

    /**
     * 查询叉车-司机关联
     * 
     * @param myRowId 叉车-司机关联主键
     * @return 叉车-司机关联
     */
    @Override
    public FForkliftDriver selectFForkliftDriverByMyRowId(String myRowId)
    {
        return fForkliftDriverMapper.selectFForkliftDriverByMyRowId(myRowId);
    }

    /**
     * 查询叉车-司机关联列表
     * 
     * @param fForkliftDriver 叉车-司机关联
     * @return 叉车-司机关联
     */
    @Override
    public List<FForkliftDriver> selectFForkliftDriverList(FForkliftDriver fForkliftDriver)
    {
        return fForkliftDriverMapper.selectFForkliftDriverList(fForkliftDriver);
    }

    /**
     * 新增叉车-司机关联
     * 
     * @param fForkliftDriver 叉车-司机关联
     * @return 结果
     */
    @Override
    public int insertFForkliftDriver(FForkliftDriver fForkliftDriver)
    {
        return fForkliftDriverMapper.insertFForkliftDriver(fForkliftDriver);
    }

    /**
     * 修改叉车-司机关联
     * 
     * @param fForkliftDriver 叉车-司机关联
     * @return 结果
     */
    @Override
    public int updateFForkliftDriver(FForkliftDriver fForkliftDriver)
    {
        return fForkliftDriverMapper.updateFForkliftDriver(fForkliftDriver);
    }

    /**
     * 批量删除叉车-司机关联
     * 
     * @param myRowIds 需要删除的叉车-司机关联主键
     * @return 结果
     */
    @Override
    public int deleteFForkliftDriverByMyRowIds(String[] myRowIds)
    {
        return fForkliftDriverMapper.deleteFForkliftDriverByMyRowIds(myRowIds);
    }

    /**
     * 删除叉车-司机关联信息
     * 
     * @param myRowId 叉车-司机关联主键
     * @return 结果
     */
    @Override
    public int deleteFForkliftDriverByMyRowId(String myRowId)
    {
        return fForkliftDriverMapper.deleteFForkliftDriverByMyRowId(myRowId);
    }
}
