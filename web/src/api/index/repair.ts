import {get, post} from '/@/utils/http/axios';

enum URL {
  create='/myapp/index/repair/create_repair',

}

const repairApi = async (data: any) =>
  post <any>({url: URL.create, data: data, headers: {}});


export {repairApi};
