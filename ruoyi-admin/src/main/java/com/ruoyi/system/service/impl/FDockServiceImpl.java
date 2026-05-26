package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FDockMapper;
import com.ruoyi.system.domain.FDock;
import com.ruoyi.system.service.IFDockService;

/**
 * 码头主Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
@Service
public class FDockServiceImpl implements IFDockService 
{
    @Autowired
    private FDockMapper fDockMapper;

    /**
     * 查询码头主
     * 
     * @param id 码头主主键
     * @return 码头主
     */
    @Override
    public FDock selectFDockById(Long id)
    {
        return fDockMapper.selectFDockById(id);
    }

    /**
     * 查询码头主列表
     * 
     * @param fDock 码头主
     * @return 码头主
     */
    @Override
    public List<FDock> selectFDockList(FDock fDock)
    {
        return fDockMapper.selectFDockList(fDock);
    }

    /**
     * 新增码头主
     * 
     * @param fDock 码头主
     * @return 结果
     */
    @Override
    public int insertFDock(FDock fDock)
    {
        return fDockMapper.insertFDock(fDock);
    }

    /**
     * 修改码头主
     * 
     * @param fDock 码头主
     * @return 结果
     */
    @Override
    public int updateFDock(FDock fDock)
    {
        return fDockMapper.updateFDock(fDock);
    }

    /**
     * 批量删除码头主
     * 
     * @param ids 需要删除的码头主主键
     * @return 结果
     */
    @Override
    public int deleteFDockByIds(Long[] ids)
    {
        return fDockMapper.deleteFDockByIds(ids);
    }

    /**
     * 删除码头主信息
     * 
     * @param id 码头主主键
     * @return 结果
     */
    @Override
    public int deleteFDockById(Long id)
    {
        return fDockMapper.deleteFDockById(id);
    }
}
