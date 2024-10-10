import {get, post} from '/@/utils/http/axios';

enum URL {
    create='/myapp/index/order/create',
    cancelUserOrder = '/myapp/index/order/cancel_order',
    userOrderList = '/myapp/index/order/list',
    payUserOrder = '/myapp/index/order/pay',
    returnUserOrder = '/myapp/index/order/return_',
}

const createApi = async (data: any) =>
    post<any>({url: URL.create, data: data, headers: {}});

const userOrderListApi = async (params: any) =>
    get<any>({url: URL.userOrderList, params: params, data: {}, headers: {}});

const cancelUserOrderApi = async (params: any) =>
    post<any>({url: URL.cancelUserOrder, params: params, headers: {}});

const payUserOrderApi = async(params: any) =>
    post<any>({url: URL.payUserOrder, params: params, headers: {}});

const returnUserOrderApi = async(params: any) =>
    post<any>({url: URL.returnUserOrder, params: params, headers: {}});

export {createApi, userOrderListApi, cancelUserOrderApi, payUserOrderApi, returnUserOrderApi};
