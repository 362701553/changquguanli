import request from '@/utils/request'

// 查询签到及时率统计列表
export function listCheckinRate(query) {
  return request({
    url: '/system/checkinRate/list',
    method: 'get',
    params: query
  })
}

// 查询签到及时率明细列表
export function listCheckinRateDetail(query) {
  return request({
    url: '/system/checkinRate/detail',
    method: 'get',
    params: query
  })
}
