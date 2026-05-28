package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.FAppointmentTaskCompanion;

public interface FAppointmentTaskCompanionMapper
{
    public int insertFAppointmentTaskCompanion(FAppointmentTaskCompanion companion);

    public List<FAppointmentTaskCompanion> selectByTaskId(Long taskId);

    public int deleteByTaskId(Long taskId);
}
