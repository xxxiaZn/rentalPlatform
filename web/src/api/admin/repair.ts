import {get, post} from '/@/utils/http/axios';

enum URL {
  complete_repair = '/myapp/admin/repairwork/complete_repair',
  list = '/myapp/admin/repairwork/list',
}

const complete_repairApi = async (params: any) =>
  post<any>({
    url: URL.complete_repair,
    params: params,
    headers: {'Content-Type': 'multipart/form-data;charset=utf-8'}
  });

const listApi = async (params: any) =>
  get<any>({url: URL.list, params: params, data: {}, headers: {}});

export {complete_repairApi,listApi};
