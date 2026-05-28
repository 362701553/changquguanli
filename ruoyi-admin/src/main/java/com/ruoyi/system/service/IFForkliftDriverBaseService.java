package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.FForkliftDriverBase;

/**
 * 叉车司机信息Service接口
 * 
 * @author ruoyi
 * @date 2026-05-28
 */
public interface IFForkliftDriverBaseService 
{
    /**
     * 查询叉车司机信息
     * 
     * @param id 叉车司机信息主键
     * @return 叉车司机信息
     */
    public FForkliftDriverBase selectFForkliftDriverBaseById(Long id);

    /**
     * 查询叉车司机信息列表
     * 
     * @param fForkliftDriverBase 叉车司机信息
     * @return 叉车司机信息集合
     */
    public List<FForkliftDriverBase> selectFForkliftDriverBaseList(FForkliftDriverBase fForkliftDriverBase);

    /**
     * 新增叉车司机信息
     * 
     * @param fForkliftDriverBase 叉车司机信息
     * @return 结果
     */
    public int insertFForkliftDriverBase(FForkliftDriverBase fForkliftDriverBase);

    /**
     * 修改叉车司机信息
     * 
     * @param fForkliftDriverBase 叉车司机信息
     * @return 结果
     */
    public int updateFForkliftDriverBase(FForkliftDriverBase fForkliftDriverBase);

    /**
     * 批量删除叉车司机信息
     * 
     * @param ids 需要删除的叉车司机信息主键集合
     * @return 结果
     */
    public int deleteFForkliftDriverBaseByIds(Long[] ids);

    /**
     * 删除叉车司机信息信息
     * 
     * @param id 叉车司机信息主键
     * @return 结果
     */
    public int deleteFForkliftDriverBaseById(Long id);
}
