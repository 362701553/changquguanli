package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.FForkliftDock;

/**
 * 叉车-码头关联Mapper接口
 * 
 * @author ruoyi
 * @date 2026-05-28
 */
public interface FForkliftDockMapper 
{
    /**
     * 查询叉车-码头关联
     * 
     * @param myRowId 叉车-码头关联主键
     * @return 叉车-码头关联
     */
    public FForkliftDock selectFForkliftDockByMyRowId(String myRowId);

    /**
     * 查询叉车-码头关联列表
     * 
     * @param fForkliftDock 叉车-码头关联
     * @return 叉车-码头关联集合
     */
    public List<FForkliftDock> selectFForkliftDockList(FForkliftDock fForkliftDock);

    /**
     * 新增叉车-码头关联
     * 
     * @param fForkliftDock 叉车-码头关联
     * @return 结果
     */
    public int insertFForkliftDock(FForkliftDock fForkliftDock);

    /**
     * 修改叉车-码头关联
     * 
     * @param fForkliftDock 叉车-码头关联
     * @return 结果
     */
    public int updateFForkliftDock(FForkliftDock fForkliftDock);

    /**
     * 删除叉车-码头关联
     * 
     * @param myRowId 叉车-码头关联主键
     * @return 结果
     */
    public int deleteFForkliftDockByMyRowId(String myRowId);

    /**
     * 批量删除叉车-码头关联
     * 
     * @param myRowIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFForkliftDockByMyRowIds(String[] myRowIds);
}
