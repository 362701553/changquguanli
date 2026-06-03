package com.ruoyi.system.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.ruoyi.system.domain.FElectronicFence;

public interface FElectronicFenceMapper
{
    public FElectronicFence selectFElectronicFenceById(Long id);

    public List<FElectronicFence> selectFElectronicFenceList(FElectronicFence fElectronicFence);

    public int insertFElectronicFence(FElectronicFence fElectronicFence);

    public int updateFElectronicFence(FElectronicFence fElectronicFence);

    public int deleteFElectronicFenceById(Long id);

    public int deleteFElectronicFenceByIds(Long[] ids);

    public FElectronicFence selectWorkingFenceByDockId(@Param("dockId") Long dockId, @Param("excludeId") Long excludeId);
}
