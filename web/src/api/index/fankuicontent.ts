import { get, post } from '/@/utils/http/axios';

enum URL {
  
  create = '/myapp/index/fankuicontent/create',

}

const fankuiApi = async (data: any) =>
  post<any>({
    url: URL.create,
    params: {},
    data: data,
    headers: { 'Content-Type': 'multipart/form-data;charset=utf-8' },
  });


export { fankuiApi };
