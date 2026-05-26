package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.FDock;

/**
 * 码头主Service接口
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
public interface IFDockService 
{
    /**
     * 查询码头主
     * 
     * @param id 码头主主键
     * @return 码头主
     */
    public FDock selectFDockById(Long id);

    /**
     * 查询码头主列表
     * 
     * @param fDock 码头主
     * @return 码头主集合
     */
    public List<FDock> selectFDockList(FDock fDock);

    /**
     * 新增码头主
     * 
     * @param fDock 码头主
     * @return 结果
     */
    public int insertFDock(FDock fDock);

    /**
     * 修改码头主
     * 
     * @param fDock 码头主
     * @return 结果
     */
    public int updateFDock(FDock fDock);

    /**
     * 批量删除码头主
     * 
     * @param ids 需要删除的码头主主键集合
     * @return 结果
     */
    public int deleteFDockByIds(Long[] ids);

    /**
     * 删除码头主信息
     * 
     * @param id 码头主主键
     * @return 结果
     */
    public int deleteFDockById(Long id);
}
