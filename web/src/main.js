import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import piniaStore from './store';

import bootstrap from './core/bootstrap';
import '/@/styles/reset.less';
import '/@/styles/index.less';
import Antd from 'ant-design-vue';
import ElementPlus from 'element-plus'
import zhCn from 'element-plus/es/locale/lang/zh-cn'
import 'element-plus/dist/index.css'

const app = createApp(App);

app.use(Antd);
app.use(router);
app.use(piniaStore);
app.use(bootstrap);
app.use(ElementPlus,{
    locale: zhCn
})
app.mount('#app');
