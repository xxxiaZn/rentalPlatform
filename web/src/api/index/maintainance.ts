import {get, post} from '/@/utils/http/axios';

enum URL {
    create='/myapp/index/maintainance/create',
}

const createApi = async (data: any) =>
    post<any>({url: URL.create, data: data, headers: {}});

export {createApi};
