import request from '@/utils/request'

// 查询码头等待停车位明细列表
export function listSpace(query) {
  return request({
    url: '/system/space/list',
    method: 'get',
    params: query
  })
}

// 查询码头等待停车位明细详细
export function getSpace(id) {
  return request({
    url: '/system/space/' + id,
    method: 'get'
  })
}

// 新增码头等待停车位明细
export function addSpace(data) {
  return request({
    url: '/system/space',
    method: 'post',
    data: data
  })
}

// 修改码头等待停车位明细
export function updateSpace(data) {
  return request({
    url: '/system/space',
    method: 'put',
    data: data
  })
}

// 删除码头等待停车位明细
export function delSpace(id) {
  return request({
    url: '/system/space/' + id,
    method: 'delete'
  })
}
