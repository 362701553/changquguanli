import request from '@/utils/request'

// 查询码头列表
export function listDock(query) {
  return request({
    url: '/system/dock/list',
    method: 'get',
    params: query
  })
}

// 查询码头详细
export function getDock(id) {
  return request({
    url: '/system/dock/' + id,
    method: 'get'
  })
}

// 新增码头
export function addDock(data) {
  return request({
    url: '/system/dock',
    method: 'post',
    data: data
  })
}

// 修改码头
export function updateDock(data) {
  return request({
    url: '/system/dock',
    method: 'put',
    data: data
  })
}

// 删除码头
export function delDock(id) {
  return request({
    url: '/system/dock/' + id,
    method: 'delete'
  })
}
