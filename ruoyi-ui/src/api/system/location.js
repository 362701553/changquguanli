import request from '@/utils/request'

// 查询定位设备列表
export function listLocation(query) {
  return request({
    url: '/system/location/list',
    method: 'get',
    params: query
  })
}

// 查询定位设备详细
export function getLocation(id) {
  return request({
    url: '/system/location/' + id,
    method: 'get'
  })
}

// 新增定位设备
export function addLocation(data) {
  return request({
    url: '/system/location',
    method: 'post',
    data: data
  })
}

// 修改定位设备
export function updateLocation(data) {
  return request({
    url: '/system/location',
    method: 'put',
    data: data
  })
}

// 删除定位设备
export function delLocation(id) {
  return request({
    url: '/system/location/' + id,
    method: 'delete'
  })
}

// 获取可用定位设备列表
export function getAvailableDevices(query) {
  return request({
    url: '/system/location/availableDevices',
    method: 'get',
    params: query
  })
}
