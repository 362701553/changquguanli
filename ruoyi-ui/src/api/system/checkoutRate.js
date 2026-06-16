import request from '@/utils/request'

// 查询签出及时率统计列表
export function listCheckoutRate(query) {
  return request({
    url: '/system/checkoutRate/list',
    method: 'get',
    params: query
  })
}

// 查询签出及时率明细列表
export function listCheckoutRateDetail(query) {
  return request({
    url: '/system/checkoutRate/detail',
    method: 'get',
    params: query
  })
}
