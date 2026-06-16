import request from '@/utils/request'

// 获取全局排队队列
export function getQueueList(query) {
  return request({
    url: '/system/queue/list',
    method: 'get',
    params: query
  })
}

// 叫号
export function callNumber(data) {
  return request({
    url: '/system/queue/call',
    method: 'post',
    data: data
  })
}

// 确认入厂
export function confirmEntry(taskId) {
  return request({
    url: '/system/queue/confirmEntry/' + taskId,
    method: 'post'
  })
}

// 手动过号
export function missNumber(taskId) {
  return request({
    url: '/system/queue/miss/' + taskId,
    method: 'post'
  })
}
