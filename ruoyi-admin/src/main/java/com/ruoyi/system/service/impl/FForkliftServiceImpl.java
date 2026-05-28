package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FForkliftMapper;
import com.ruoyi.system.domain.FForklift;
import com.ruoyi.system.service.IFForkliftService;

/**
 * 叉车主Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-05-28
 */
@Service
public class FForkliftServiceImpl implements IFForkliftService 
{
    @Autowired
    private FForkliftMapper fForkliftMapper;

    /**
     * 查询叉车主
     * 
     * @param id 叉车主主键
     * @return 叉车主
     */
    @Override
    public FForklift selectFForkliftById(Long id)
    {
        return fForkliftMapper.selectFForkliftById(id);
    }

    /**
     * 查询叉车主列表
     * 
     * @param fForklift 叉车主
     * @return 叉车主
     */
    @Override
    public List<FForklift> selectFForkliftList(FForklift fForklift)
    {
        return fForkliftMapper.selectFForkliftList(fForklift);
    }

    /**
     * 新增叉车主
     * 
     * @param fForklift 叉车主
     * @return 结果
     */
    @Override
    public int insertFForklift(FForklift fForklift)
    {
        return fForkliftMapper.insertFForklift(fForklift);
    }

    /**
     * 修改叉车主
     * 
     * @param fForklift 叉车主
     * @return 结果
     */
    @Override
    public int updateFForklift(FForklift fForklift)
    {
        return fForkliftMapper.updateFForklift(fForklift);
    }

    /**
     * 批量删除叉车主
     * 
     * @param ids 需要删除的叉车主主键
     * @return 结果
     */
    @Override
    public int deleteFForkliftByIds(Long[] ids)
    {
        return fForkliftMapper.deleteFForkliftByIds(ids);
    }

    /**
     * 删除叉车主信息
     * 
     * @param id 叉车主主键
     * @return 结果
     */
    @Override
    public int deleteFForkliftById(Long id)
    {
        return fForkliftMapper.deleteFForkliftById(id);
    }
}
