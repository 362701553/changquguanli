import request from '@/utils/request'

// 查询车辆司机主列表
export function listVehicle(query) {
  return request({
    url: '/system/vehicle/list',
    method: 'get',
    params: query
  })
}

// 查询车辆司机主详细
export function getVehicle(id) {
  return request({
    url: '/system/vehicle/' + id,
    method: 'get'
  })
}

// 新增车辆司机主
export function addVehicle(data) {
  return request({
    url: '/system/vehicle',
    method: 'post',
    data: data
  })
}

// 修改车辆司机主
export function updateVehicle(data) {
  return request({
    url: '/system/vehicle',
    method: 'put',
    data: data
  })
}

// 删除车辆司机主
export function delVehicle(id) {
  return request({
    url: '/system/vehicle/' + id,
    method: 'delete'
  })
}
