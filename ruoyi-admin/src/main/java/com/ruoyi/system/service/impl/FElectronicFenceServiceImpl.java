package com.ruoyi.system.service.impl;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.FElectronicFence;
import com.ruoyi.system.domain.FElectronicFencePoint;
import com.ruoyi.system.mapper.FElectronicFenceMapper;
import com.ruoyi.system.mapper.FElectronicFencePointMapper;
import com.ruoyi.system.service.IFElectronicFenceService;

@Service
public class FElectronicFenceServiceImpl implements IFElectronicFenceService
{
    @Autowired
    private FElectronicFenceMapper fElectronicFenceMapper;

    @Autowired
    private FElectronicFencePointMapper fElectronicFencePointMapper;

    @Override
    public FElectronicFence selectFElectronicFenceById(Long id)
    {
        FElectronicFence fence = fElectronicFenceMapper.selectFElectronicFenceById(id);
        if (fence != null)
        {
            fence.setPoints(fElectronicFencePointMapper.selectPointsByFenceId(id));
        }
        return fence;
    }

    @Override
    public List<FElectronicFence> selectFElectronicFenceList(FElectronicFence fElectronicFence)
    {
        return fElectronicFenceMapper.selectFElectronicFenceList(fElectronicFence);
    }

    @Override
    @Transactional
    public AjaxResult insertFElectronicFence(FElectronicFence fElectronicFence)
    {
        if ("working".equals(fElectronicFence.getFenceType()))
        {
            if (fElectronicFence.getDockId() == null)
            {
                return AjaxResult.error("工作区类型必须选择码头");
            }
            FElectronicFence existing = fElectronicFenceMapper.selectWorkingFenceByDockId(fElectronicFence.getDockId(), null);
            if (existing != null)
            {
                return AjaxResult.error("该码头已存在工作区电子围栏，不可重复创建");
            }
        }

        List<FElectronicFencePoint> points = fElectronicFence.getPoints();
        if (points == null || points.size() < 3)
        {
            return AjaxResult.error("围栏点位至少需要3个点");
        }

        fElectronicFence.setCreateBy(SecurityUtils.getUsername());
        fElectronicFence.setCreateDate(new Date());
        fElectronicFence.setDeleted(0);
        fElectronicFenceMapper.insertFElectronicFence(fElectronicFence);

        for (int i = 0; i < points.size(); i++)
        {
            points.get(i).setFenceId(fElectronicFence.getId());
            points.get(i).setSortOrder(i);
        }
        fElectronicFencePointMapper.batchInsertPoints(points);

        return AjaxResult.success();
    }

    @Override
    @Transactional
    public AjaxResult updateFElectronicFence(FElectronicFence fElectronicFence)
    {
        if ("working".equals(fElectronicFence.getFenceType()))
        {
            if (fElectronicFence.getDockId() == null)
            {
                return AjaxResult.error("工作区类型必须选择码头");
            }
            FElectronicFence existing = fElectronicFenceMapper.selectWorkingFenceByDockId(fElectronicFence.getDockId(), fElectronicFence.getId());
            if (existing != null)
            {
                return AjaxResult.error("该码头已存在工作区电子围栏，不可重复创建");
            }
        }

        List<FElectronicFencePoint> points = fElectronicFence.getPoints();
        if (points == null || points.size() < 3)
        {
            return AjaxResult.error("围栏点位至少需要3个点");
        }

        fElectronicFence.setUpdateBy(SecurityUtils.getUsername());
        fElectronicFence.setUpdateDate(new Date());
        fElectronicFenceMapper.updateFElectronicFence(fElectronicFence);

        fElectronicFencePointMapper.deletePointsByFenceId(fElectronicFence.getId());
        for (int i = 0; i < points.size(); i++)
        {
            points.get(i).setFenceId(fElectronicFence.getId());
            points.get(i).setSortOrder(i);
        }
        fElectronicFencePointMapper.batchInsertPoints(points);

        return AjaxResult.success();
    }

    @Override
    @Transactional
    public int deleteFElectronicFenceByIds(Long[] ids)
    {
        return fElectronicFenceMapper.deleteFElectronicFenceByIds(ids);
    }
}
