package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FForkliftDockMapper;
import com.ruoyi.system.domain.FForkliftDock;
import com.ruoyi.system.service.IFForkliftDockService;

/**
 * 叉车-码头关联Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-05-28
 */
@Service
public class FForkliftDockServiceImpl implements IFForkliftDockService 
{
    @Autowired
    private FForkliftDockMapper fForkliftDockMapper;

    /**
     * 查询叉车-码头关联
     * 
     * @param myRowId 叉车-码头关联主键
     * @return 叉车-码头关联
     */
    @Override
    public FForkliftDock selectFForkliftDockByMyRowId(String myRowId)
    {
        return fForkliftDockMapper.selectFForkliftDockByMyRowId(myRowId);
    }

    /**
     * 查询叉车-码头关联列表
     * 
     * @param fForkliftDock 叉车-码头关联
     * @return 叉车-码头关联
     */
    @Override
    public List<FForkliftDock> selectFForkliftDockList(FForkliftDock fForkliftDock)
    {
        return fForkliftDockMapper.selectFForkliftDockList(fForkliftDock);
    }

    /**
     * 新增叉车-码头关联
     * 
     * @param fForkliftDock 叉车-码头关联
     * @return 结果
     */
    @Override
    public int insertFForkliftDock(FForkliftDock fForkliftDock)
    {
        return fForkliftDockMapper.insertFForkliftDock(fForkliftDock);
    }

    /**
     * 修改叉车-码头关联
     * 
     * @param fForkliftDock 叉车-码头关联
     * @return 结果
     */
    @Override
    public int updateFForkliftDock(FForkliftDock fForkliftDock)
    {
        return fForkliftDockMapper.updateFForkliftDock(fForkliftDock);
    }

    /**
     * 批量删除叉车-码头关联
     * 
     * @param myRowIds 需要删除的叉车-码头关联主键
     * @return 结果
     */
    @Override
    public int deleteFForkliftDockByMyRowIds(String[] myRowIds)
    {
        return fForkliftDockMapper.deleteFForkliftDockByMyRowIds(myRowIds);
    }

    /**
     * 删除叉车-码头关联信息
     * 
     * @param myRowId 叉车-码头关联主键
     * @return 结果
     */
    @Override
    public int deleteFForkliftDockByMyRowId(String myRowId)
    {
        return fForkliftDockMapper.deleteFForkliftDockByMyRowId(myRowId);
    }
}
