import request from '@/utils/request'

// 查询预约任务列表
export function listTask(query) {
  return request({
    url: '/system/task/list',
    method: 'get',
    params: query
  })
}

// 查询预约任务详细
export function getTask(id) {
  return request({
    url: '/system/task/' + id,
    method: 'get'
  })
}

// 新增预约任务
export function addTask(data) {
  return request({
    url: '/system/task',
    method: 'post',
    data: data
  })
}

// 修改预约任务
export function updateTask(data) {
  return request({
    url: '/system/task',
    method: 'put',
    data: data
  })
}

// 删除预约任务
export function delTask(id) {
  return request({
    url: '/system/task/' + id,
    method: 'delete'
  })
}

// 签到排队
export function checkinTask(id) {
  return request({
    url: '/system/task/checkin/' + id,
    method: 'post'
  })
}

// 新增装卸任务(码头明细)
export function addTaskDock(data) {
  return request({
    url: '/system/TaskDock',
    method: 'post',
    data: data
  })
}

// 开始作业
export function startWork(dockTaskId) {
  return request({
    url: '/system/task/startWork/' + dockTaskId,
    method: 'post'
  })
}

// 点位释放
export function releasePoint(dockTaskId) {
  return request({
    url: '/system/task/releasePoint/' + dockTaskId,
    method: 'post'
  })
}

// 签出
export function checkoutTask(id) {
  return request({
    url: '/system/task/checkout/' + id,
    method: 'post'
  })
}

// 获取可用叉车司机列表
export function getAvailableDrivers() {
  return request({
    url: '/system/task/availableDrivers',
    method: 'get'
  })
}

// 指派叉车司机
export function assignDriver(dockTaskId, driverId) {
  return request({
    url: '/system/task/assignDriver/' + dockTaskId + '/' + driverId,
    method: 'post'
  })
}
