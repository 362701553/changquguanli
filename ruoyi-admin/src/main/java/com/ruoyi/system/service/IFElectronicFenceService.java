package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.FElectronicFence;
import com.ruoyi.common.core.domain.AjaxResult;

public interface IFElectronicFenceService
{
    public FElectronicFence selectFElectronicFenceById(Long id);

    public List<FElectronicFence> selectFElectronicFenceList(FElectronicFence fElectronicFence);

    public AjaxResult insertFElectronicFence(FElectronicFence fElectronicFence);

    public AjaxResult updateFElectronicFence(FElectronicFence fElectronicFence);

    public int deleteFElectronicFenceByIds(Long[] ids);
}
