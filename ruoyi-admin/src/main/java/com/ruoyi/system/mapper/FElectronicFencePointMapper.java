package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.FElectronicFencePoint;

public interface FElectronicFencePointMapper
{
    public List<FElectronicFencePoint> selectPointsByFenceId(Long fenceId);

    public int batchInsertPoints(List<FElectronicFencePoint> points);

    public int deletePointsByFenceId(Long fenceId);
}
