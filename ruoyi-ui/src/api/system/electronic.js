import request from '@/utils/request'

export function listElectronic(query) {
  return request({
    url: '/system/electronic/list',
    method: 'get',
    params: query
  })
}

export function getElectronic(id) {
  return request({
    url: '/system/electronic/' + id,
    method: 'get'
  })
}

export function addElectronic(data) {
  return request({
    url: '/system/electronic',
    method: 'post',
    data: data
  })
}

export function updateElectronic(data) {
  return request({
    url: '/system/electronic',
    method: 'put',
    data: data
  })
}

export function delElectronic(id) {
  return request({
    url: '/system/electronic/' + id,
    method: 'delete'
  })
}
