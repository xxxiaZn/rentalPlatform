// 路由表
const constantRouterMap = [
  // ************* 前台路由 **************
  {
    path: '/',
    redirect: '/index',
  },
  {
    path: '/index',
    name: 'index',
    redirect: '/index/portal',
    component: () => import('/@/views/index/index.vue'),
    children: [
      {
        path: 'login',
        name: 'login',
        component: () => import('/@/views/index/login.vue'),
      },
      {
        path: 'register',
        name: 'register',
        component: () => import('/@/views/index/register.vue'),
      },
      {
        path: 'portal',
        name: 'portal',
        component: () => import('/@/views/index/portal.vue'),
      },
      {
        path: 'detail',
        name: 'detail',
        component: () => import('/@/views/index/detail.vue'),
      },
      {
        path: 'confirm',
        name: 'confirm',
        component: () => import('/@/views/index/confirm.vue'),
      },
      {
        path: 'pay',
        name: 'pay',
        component: () => import('/@/views/index/pay.vue'),
      },
      {
        path: 'search',
        name: 'search',
        component: () => import('/@/views/index/search.vue'),
      },
      {
        path: 'usercenter',
        name: 'usercenter',
        redirect: '/index/usercenter/orderView',
        component: () => import('/@/views/index/usercenter.vue'),
        children: [
          {
            path: 'wishThingView',
            name: 'wishThingView',
            component: () => import('/@/views/index/user/wish-thing-view.vue'),
          },
          {
            path: 'collectThingView',
            name: 'collectThingView',
            component: () => import('/@/views/index/user/collect-thing-view.vue'),
          },
          {
            path: 'orderView',
            name: 'orderView',
            component: () => import('/@/views/index/user/order-view.vue'),
          },
          {
            path: 'userInfoEditView',
            name: 'userInfoEditView',
            component: () => import('/@/views/index/user/userinfo-edit-view.vue'),
          },
          {
            path: 'commentView',
            name: 'commentView',
            component: () => import('/@/views/index/user/comment-view.vue'),
          },
          {
            path: 'securityView',
            name: 'securityView',
            component: () => import('/@/views/index/user/security-view.vue'),
          },
          {
            path: 'pushView',
            name: 'pushView',
            component: () => import('/@/views/index/user/push-view.vue'),
          },
          {
            path: 'messageView',
            name: 'messageView',
            component: () => import('/@/views/index/user/message-view.vue'),
          },
        ],
      },
    ],
  },
  {
    path: '/adminLogin',
    name: 'adminLogin',
    component: () => import('/@/views/admin/admin-login.vue'),
  },
  {
    path: '/admin',
    name: 'admin',
    redirect: '/admin/thing',
    component: () => import('/@/views/admin/main.vue'),
    children: [
      { path: 'overview', name: 'overview', component: () => import('/@/views/admin/overview.vue') },
      { path: 'order', name: 'order', component: () => import('/@/views/admin/order.vue') },
      { path: 'thing', name: 'thing', component: () => import('/@/views/admin/thing.vue') },
      { path: 'comment', name: 'comment', component: () => import('/@/views/admin/comment.vue') },
      { path: 'user', name: 'user', component: () => import('/@/views/admin/user.vue') },
      { path: 'classification', name: 'classification', component: () => import('/@/views/admin/classification.vue') },
      { path: 'fankuicontent', name: 'fankuicontent', component: () => import('/@/views/admin/fankuicontent.vue') },
      { path: 'repair', name: 'repair', component: () => import('/@/views/admin/repair.vue') },
      { path: 'maintainance', name: 'maintainance', component: () => import('/@/views/admin/maintainance.vue') },
      { path: 'tag', name: 'tag', component: () => import('/@/views/admin/tag.vue') },
      { path: 'ad', name: 'ad', component: () => import('/@/views/admin/ad.vue') },
      { path: 'notice', name: 'notice', component: () => import('/@/views/admin/notice.vue') },
      { path: 'loginLog', name: 'loginLog', component: () => import('/@/views/admin/login-log.vue') },
      { path: 'opLog', name: 'opLog', component: () => import('/@/views/admin/op-log.vue') },
      { path: 'errorLog', name: 'errorLog', component: () => import('/@/views/admin/error-log.vue') },
      { path: 'sysInfo', name: 'sysInfo', component: () => import('/@/views/admin/sys-info.vue') },
    ],
  },
];

export default constantRouterMap;
