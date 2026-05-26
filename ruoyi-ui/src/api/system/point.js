import request from '@/utils/request'

// 查询码头装卸点明细列表
export function listPoint(query) {
  return request({
    url: '/system/point/list',
    method: 'get',
    params: query
  })
}

// 查询码头装卸点明细详细
export function getPoint(id) {
  return request({
    url: '/system/point/' + id,
    method: 'get'
  })
}

// 新增码头装卸点明细
export function addPoint(data) {
  return request({
    url: '/system/point',
    method: 'post',
    data: data
  })
}

// 修改码头装卸点明细
export function updatePoint(data) {
  return request({
    url: '/system/point',
    method: 'put',
    data: data
  })
}

// 删除码头装卸点明细
export function delPoint(id) {
  return request({
    url: '/system/point/' + id,
    method: 'delete'
  })
}
