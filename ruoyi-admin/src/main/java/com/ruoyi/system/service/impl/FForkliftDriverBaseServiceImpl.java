package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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

    /**
     * 查询叉车司机信息
     * 
     * @param id 叉车司机信息主键
     * @return 叉车司机信息
     */
    @Override
    public FForkliftDriverBase selectFForkliftDriverBaseById(Long id)
    {
        return fForkliftDriverBaseMapper.selectFForkliftDriverBaseById(id);
    }

    /**
     * 查询叉车司机信息列表
     * 
     * @param fForkliftDriverBase 叉车司机信息
     * @return 叉车司机信息
     */
    @Override
    public List<FForkliftDriverBase> selectFForkliftDriverBaseList(FForkliftDriverBase fForkliftDriverBase)
    {
        return fForkliftDriverBaseMapper.selectFForkliftDriverBaseList(fForkliftDriverBase);
    }

    /**
     * 新增叉车司机信息
     * 
     * @param fForkliftDriverBase 叉车司机信息
     * @return 结果
     */
    @Override
    public int insertFForkliftDriverBase(FForkliftDriverBase fForkliftDriverBase)
    {
        return fForkliftDriverBaseMapper.insertFForkliftDriverBase(fForkliftDriverBase);
    }

    /**
     * 修改叉车司机信息
     * 
     * @param fForkliftDriverBase 叉车司机信息
     * @return 结果
     */
    @Override
    public int updateFForkliftDriverBase(FForkliftDriverBase fForkliftDriverBase)
    {
        return fForkliftDriverBaseMapper.updateFForkliftDriverBase(fForkliftDriverBase);
    }

    /**
     * 批量删除叉车司机信息
     * 
     * @param ids 需要删除的叉车司机信息主键
     * @return 结果
     */
    @Override
    public int deleteFForkliftDriverBaseByIds(Long[] ids)
    {
        return fForkliftDriverBaseMapper.deleteFForkliftDriverBaseByIds(ids);
    }

    /**
     * 删除叉车司机信息信息
     * 
     * @param id 叉车司机信息主键
     * @return 结果
     */
    @Override
    public int deleteFForkliftDriverBaseById(Long id)
    {
        return fForkliftDriverBaseMapper.deleteFForkliftDriverBaseById(id);
    }
}
