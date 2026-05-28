import request from '@/utils/request'

// 查询叉车-司机关联列表
export function listDriver(query) {
  return request({
    url: '/system/driver/list',
    method: 'get',
    params: query
  })
}

// 查询叉车-司机关联详细
export function getDriver(myRowId) {
  return request({
    url: '/system/driver/' + myRowId,
    method: 'get'
  })
}

// 新增叉车-司机关联
export function addDriver(data) {
  return request({
    url: '/system/driver',
    method: 'post',
    data: data
  })
}

// 修改叉车-司机关联
export function updateDriver(data) {
  return request({
    url: '/system/driver',
    method: 'put',
    data: data
  })
}

// 删除叉车-司机关联
export function delDriver(myRowId) {
  return request({
    url: '/system/driver/' + myRowId,
    method: 'delete'
  })
}
