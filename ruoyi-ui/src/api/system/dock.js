import request from '@/utils/request'

// 查询预约任务-码头明细列表
export function listDock(query) {
  return request({
    url: '/system/dock/list',
    method: 'get',
    params: query
  })
}

// 查询预约任务-码头明细详细
export function getDock(id) {
  return request({
    url: '/system/dock/' + id,
    method: 'get'
  })
}

// 新增预约任务-码头明细
export function addDock(data) {
  return request({
    url: '/system/dock',
    method: 'post',
    data: data
  })
}

// 修改预约任务-码头明细
export function updateDock(data) {
  return request({
    url: '/system/dock',
    method: 'put',
    data: data
  })
}

// 删除预约任务-码头明细
export function delDock(id) {
  return request({
    url: '/system/dock/' + id,
    method: 'delete'
  })
}
