package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FDockParkingSpaceMapper;
import com.ruoyi.system.domain.FDockParkingSpace;
import com.ruoyi.system.service.IFDockParkingSpaceService;

/**
 * 码头等待停车位明细Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
@Service
public class FDockParkingSpaceServiceImpl implements IFDockParkingSpaceService 
{
    @Autowired
    private FDockParkingSpaceMapper fDockParkingSpaceMapper;

    /**
     * 查询码头等待停车位明细
     * 
     * @param id 码头等待停车位明细主键
     * @return 码头等待停车位明细
     */
    @Override
    public FDockParkingSpace selectFDockParkingSpaceById(Long id)
    {
        return fDockParkingSpaceMapper.selectFDockParkingSpaceById(id);
    }

    /**
     * 查询码头等待停车位明细列表
     * 
     * @param fDockParkingSpace 码头等待停车位明细
     * @return 码头等待停车位明细
     */
    @Override
    public List<FDockParkingSpace> selectFDockParkingSpaceList(FDockParkingSpace fDockParkingSpace)
    {
        return fDockParkingSpaceMapper.selectFDockParkingSpaceList(fDockParkingSpace);
    }

    /**
     * 新增码头等待停车位明细
     * 
     * @param fDockParkingSpace 码头等待停车位明细
     * @return 结果
     */
    @Override
    public int insertFDockParkingSpace(FDockParkingSpace fDockParkingSpace)
    {
        return fDockParkingSpaceMapper.insertFDockParkingSpace(fDockParkingSpace);
    }

    /**
     * 修改码头等待停车位明细
     * 
     * @param fDockParkingSpace 码头等待停车位明细
     * @return 结果
     */
    @Override
    public int updateFDockParkingSpace(FDockParkingSpace fDockParkingSpace)
    {
        return fDockParkingSpaceMapper.updateFDockParkingSpace(fDockParkingSpace);
    }

    /**
     * 批量删除码头等待停车位明细
     * 
     * @param ids 需要删除的码头等待停车位明细主键
     * @return 结果
     */
    @Override
    public int deleteFDockParkingSpaceByIds(Long[] ids)
    {
        return fDockParkingSpaceMapper.deleteFDockParkingSpaceByIds(ids);
    }

    /**
     * 删除码头等待停车位明细信息
     * 
     * @param id 码头等待停车位明细主键
     * @return 结果
     */
    @Override
    public int deleteFDockParkingSpaceById(Long id)
    {
        return fDockParkingSpaceMapper.deleteFDockParkingSpaceById(id);
    }
}
