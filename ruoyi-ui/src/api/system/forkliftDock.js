import request from '@/utils/request'

// 查询叉车-码头关联列表
export function listDock(query) {
  return request({
    url: '/system/forkliftDock/list',
    method: 'get',
    params: query
  })
}

// 查询叉车-码头关联详细
export function getDock(myRowId) {
  return request({
    url: '/system/forkliftDock/' + myRowId,
    method: 'get'
  })
}

// 新增叉车-码头关联
export function addDock(data) {
  return request({
    url: '/system/forkliftDock',
    method: 'post',
    data: data
  })
}

// 修改叉车-码头关联
export function updateDock(data) {
  return request({
    url: '/system/forkliftDock',
    method: 'put',
    data: data
  })
}

// 删除叉车-码头关联
export function delDock(myRowId) {
  return request({
    url: '/system/forkliftDock/' + myRowId,
    method: 'delete'
  })
}
