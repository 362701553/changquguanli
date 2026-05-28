import request from '@/utils/request'

// 查询叉车司机信息列表
export function listBase(query) {
  return request({
    url: '/system/base/list',
    method: 'get',
    params: query
  })
}

// 查询叉车司机信息详细
export function getBase(id) {
  return request({
    url: '/system/base/' + id,
    method: 'get'
  })
}

// 新增叉车司机信息
export function addBase(data) {
  return request({
    url: '/system/base',
    method: 'post',
    data: data
  })
}

// 修改叉车司机信息
export function updateBase(data) {
  return request({
    url: '/system/base',
    method: 'put',
    data: data
  })
}

// 删除叉车司机信息
export function delBase(id) {
  return request({
    url: '/system/base/' + id,
    method: 'delete'
  })
}
