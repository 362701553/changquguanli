import request from '@/utils/request'

// 查询叉车主列表
export function listForklift(query) {
  return request({
    url: '/system/forklift/list',
    method: 'get',
    params: query
  })
}

// 查询叉车主详细
export function getForklift(id) {
  return request({
    url: '/system/forklift/' + id,
    method: 'get'
  })
}

// 新增叉车主
export function addForklift(data) {
  return request({
    url: '/system/forklift',
    method: 'post',
    data: data
  })
}

// 修改叉车主
export function updateForklift(data) {
  return request({
    url: '/system/forklift',
    method: 'put',
    data: data
  })
}

// 删除叉车主
export function delForklift(id) {
  return request({
    url: '/system/forklift/' + id,
    method: 'delete'
  })
}
