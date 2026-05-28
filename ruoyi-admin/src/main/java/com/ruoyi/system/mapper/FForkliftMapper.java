package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.FForklift;

/**
 * 叉车主Mapper接口
 * 
 * @author ruoyi
 * @date 2026-05-28
 */
public interface FForkliftMapper 
{
    /**
     * 查询叉车主
     * 
     * @param id 叉车主主键
     * @return 叉车主
     */
    public FForklift selectFForkliftById(Long id);

    /**
     * 查询叉车主列表
     * 
     * @param fForklift 叉车主
     * @return 叉车主集合
     */
    public List<FForklift> selectFForkliftList(FForklift fForklift);

    /**
     * 新增叉车主
     * 
     * @param fForklift 叉车主
     * @return 结果
     */
    public int insertFForklift(FForklift fForklift);

    /**
     * 修改叉车主
     * 
     * @param fForklift 叉车主
     * @return 结果
     */
    public int updateFForklift(FForklift fForklift);

    /**
     * 删除叉车主
     * 
     * @param id 叉车主主键
     * @return 结果
     */
    public int deleteFForkliftById(Long id);

    /**
     * 批量删除叉车主
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFForkliftByIds(Long[] ids);
}
