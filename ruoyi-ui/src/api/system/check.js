import request from '@/utils/request'

// 查询预约任务-检查列表
export function listCheck(query) {
  return request({
    url: '/system/check/list',
    method: 'get',
    params: query
  })
}

// 查询预约任务-检查详细
export function getCheck(id) {
  return request({
    url: '/system/check/' + id,
    method: 'get'
  })
}

// 新增预约任务-检查
export function addCheck(data) {
  return request({
    url: '/system/check',
    method: 'post',
    data: data
  })
}

// 修改预约任务-检查
export function updateCheck(data) {
  return request({
    url: '/system/check',
    method: 'put',
    data: data
  })
}

// 删除预约任务-检查
export function delCheck(id) {
  return request({
    url: '/system/check/' + id,
    method: 'delete'
  })
}
