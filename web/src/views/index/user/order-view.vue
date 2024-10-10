<template>
  <div class="content-list">
    <div class="list-title">我的预订</div>
   <a-tabs default-active-key="1" @change="onTabChange">
     <a-tab-pane key="1" tab="全部" />
     <a-tab-pane key="2" tab="待付款" />
     <a-tab-pane key="3" tab="已支付" />
     <a-tab-pane key="4" tab="已完成" />
   </a-tabs>
    <a-spin :spinning="loading" style="min-height: 200px">
      <div class="list-content">
        <div class="order-item-view" v-for="(item, index) in orderData" :key="index">
          <div class="header flex-view">
            <div class="left">
              <span class="text">订单号:</span>
              <span class="num mg-4">#</span>
              <span class="num">{{ item.order_number }}</span>
              <!-- <span class="time">{{ item.order_time }}</span> -->
              <span class="text" style="margin-left: 20px">租赁时间:</span>
              <span>{{ item.start_date.slice(0,10) }} 至 {{ item.end_date.slice(0,10) }} 共 {{ item.days }} 天</span>
            </div>
            <div class="left" >
            </div>
            <div class="right">
              
              <span class="text">预约状态</span>
              <span class="state">{{ item.status === '1' ? '待支付' : item.status === '2' ? '已支付' : item.status === '3' ? '已完成' :'已取消' }}</span>
            </div>
          </div>
          <div class="content flex-view">
            <div class="left-list">
              <div class="list-item flex-view">
                <img :src="item.cover" class="thing-img" />
                <div class="detail flex-between flex-view">
                  <div class="flex-between flex-top flex-view">
                    <h2 class="name">{{ item.title }}</h2>
                    <span class="count">x{{ item.count }}</span>
                  </div>
                  <div class="flex-between flex-center flex-view">
                    <span class="type"></span>
                    <span class="price">¥{{ item.price }}</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="bottom flex-view">
            <div class="left">
              <span class="text">共{{ item.count }}件</span>
              <span class="open" @click="handleDetail(item.thing)">详情</span>
            </div>
            <div class="pay">
              <a-popconfirm v-if="item.status === '1'" title="确定取消？" ok-text="是" cancel-text="否" @confirm="handleCancel(item)">
                <el-button type="info" size="small"  text>取消</el-button>
              </a-popconfirm>
              <el-button v-if="item.status !== '2' && item.status !== '7' && item.status !== '3'" type="primary" @click="handlePay(item)" >支付</el-button>
              <el-button v-if="item.status == '2'" type="primary" @click="handleReturn(item)" >归还</el-button>
              <el-popover :visible="item.visible1" :width=250>
                <div class="date-picker">
                  <div class="block">
                    <el-input
                      v-model="item.textarea"
                      style="width: 220px"
                      :rows="2"
                      type="textarea"
                      placeholder="请输入反馈"
                    />
                  </div>
                </div>
                <div style="text-align: right; margin: 0">
                  <el-button size="small" text @click="item.visible1 = false">取消</el-button>
                  <el-button type="primary" @click="item.visible1 = false; tijiaofankui(item)">提交</el-button>
                </div>
                <template #reference>
                  <el-button v-if="item.status == '2'" type="primary" @click="item.visible1 = true; item.visible2 = false; item.visible3 = false" >反馈</el-button>
                </template>
              </el-popover>
              <el-popover :visible="item.visible2" :width=250>
                <div class="date-picker">
                  <div class="block">
                    <el-date-picker
                      v-model="item.value1"
                      type="date"
                      placeholder="选择维修日期"
                    />
                  </div>
                </div>
                <div style="text-align: right; margin: 0">
                  <el-button size="small" text @click="item.visible2 = false">取消</el-button>
                  <el-button type="primary" @click="item.visible2 = false; repair(item)">预约</el-button>
                </div>
                <template #reference>
                  <el-button v-if="item.status == '2'" type="primary" @click="item.visible2 = true; item.visible1 = false; item.visible3 = false" >维修</el-button>
                </template>
              </el-popover>
              <el-popover :visible="item.visible3" :width=250>
                <div class="date-picker">
                  <div class="block">
                    <el-date-picker
                      v-model="item.value2"
                      type="date"
                      placeholder="选择保养日期"
                    />
                  </div>
                </div>
                <div style="text-align: right; margin: 0">
                  <el-button size="small" text @click="item.visible3 = false">取消</el-button>
                  <el-button type="primary" @click="item.visible3 = false; handleMaintainance(item)">预约</el-button>
                </div>
                <template #reference>
                  <el-button v-if="item.status == '2'" type="primary" @click="item.visible3 = true; item.visible1 = false; item.visible2 = false" >保养</el-button>
                </template>
              </el-popover>
            </div>
          </div>
        </div>
        <template v-if="!orderData || orderData.length <= 0">
          <a-empty style="width: 100%; margin-top: 200px" />
        </template>
      </div>
    </a-spin>
  </div>
</template>

<script setup lang="ts">
  import { message } from 'ant-design-vue';
  import { userOrderListApi } from '/@/api/index/order';
  import { cancelUserOrderApi } from '/@/api/index/order';
  import { payUserOrderApi } from '/@/api/index/order';
  import { returnUserOrderApi } from '/@/api/index/order';
  import { BASE_URL } from '/@/store/constants';
  import { useUserStore } from '/@/store';
  import { updateApi } from '/@/api/admin/thing';
  import { fankuiApi } from '/@/api/index/fankuicontent'; //反馈
  import { repairApi } from '/@/api/index/repair';        //维修
  import { createApi } from '/@/api/index/maintainance';  //保养
  import { ref } from 'vue'

  const router = useRouter();
  const route = useRoute();
  const userStore = useUserStore();

  const loading = ref(false);
  const orderData = ref([]);
  const orderStatus = ref('');

  onMounted(() => {
    getOrderList();
  });

  const onTabChange = (key) => {
    console.log(key);
    if (key === '1') {
      orderStatus.value = '';
    }
    if (key === '2') {
      orderStatus.value = '1';
    }
    if (key === '3') {
      orderStatus.value = '2';
    }
    if( key === '4') {
      orderStatus.value = '3';
    }
    getOrderList();
  };
  const getOrderList = () => {
    loading.value = true;
    let userId = userStore.user_id;
    userOrderListApi({ userId: userId, orderStatus: orderStatus.value })
      .then((res) => {
        res.data.forEach((item, index) => {
          if (item.cover) {
            item.cover = BASE_URL + item.cover;
          }
          // 为每个订单项初始化可见性和其他状态
          item.visible1 = false;
          item.visible2 = false;
          item.visible3 = false;
          item.value1 = '';
          item.value2 = '';
          item.textarea = '';
        });
        orderData.value = res.data;
        loading.value = false;
      })
      .catch((err) => {
        console.log(err);
        loading.value = false;
      });
  };
  const handleDetail = (thingId) => {
    // 跳转新页面
    let text = router.resolve({ name: 'detail', query: { id: thingId } });
    window.open(text.href, '_blank');
  };
  const handleCancel = (item) => {
    const formData = new FormData()
    formData.append('status', '0')      //取消订单时将thing状态变回0(上架)
    updateApi({id: item.thing}, formData)
    cancelUserOrderApi({
      id: item.id,
    })
      .then((res) => {
        message.success('取消成功');
        getOrderList();
      })
      .catch((err) => {
        message.error(err.msg || '取消失败');
      });
  };
  const handlePay = (item) => {
    payUserOrderApi({
      id: item.id,
    })
      .then((res) => {
        message.success('支付成功');
        getOrderList();
      })
      .catch((err) => {
        message.error(err.msg || '支付失败');
      });
  };
  const handleReturn = (item) => {
    const formData = new FormData()
    formData.append('status', '0')
    updateApi({id: item.thing}, formData)
    returnUserOrderApi({
      id: item.id,
    })
      .then((res) => {
        message.success('归还成功');
        getOrderList();
      })
      .catch((err) => {
        message.error(err.msg || '归还失败');
      });
  };
  function formatDateToBackend(date) {
    // 将日期格式化为 'YYYY-MM-DD HH:mm:ss'
    const year = date.getFullYear();
    const month = ('0' + (date.getMonth() + 1)).slice(-2);  // 补0
    const day = ('0' + date.getDate()).slice(-2);  // 补0
    const hours = ('0' + date.getHours()).slice(-2);  // 补0
    const minutes = ('0' + date.getMinutes()).slice(-2);  // 补0
    const seconds = ('0' + date.getSeconds()).slice(-2);  // 补0
    
    return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
  };
  //反馈
  const tijiaofankui = (item) => {
    if(item.textarea){
    const formData = new FormData();
    formData.append('fankuicontent', item.textarea);
    formData.append('order_number', item.order_number);
    
    fankuiApi(formData)
        .then((res) => {
          message.success('提交成功');
        })
        .catch((err) => {
          message.error(err.msg || '失败');
        });
    } else {
        message.warn('请输入反馈内容！');
      }
  }
  //维修
  const repair = (item) => {
    if (item.value1){
      const formData = new FormData();
      const repairtime = formatDateToBackend(item.value1)
      formData.append('repair_time', repairtime);
      formData.append('order_number', item.order_number)
      const formData1 = new FormData();
      formData1.append('status', '3');
      updateApi({id: item.thing}, formData1)  //将thing的状态改为3(维修中)
      repairApi(formData)
        .then((res) => {
          message.success('预约成功');
          getOrderList();
        })
        .catch((err) => {
          message.error(err.msg || '预约失败');
        });
    }else{
      message.warn('请选择维修日期')
    }
  }
  //保养
  const handleMaintainance = (item) => {
    if(item.value2){
      const maintainanceDate = formatDateToBackend(item.value2)
      const formData = new FormData();
      formData.append('order', item.id)
      formData.append('thing', item.thing)
      formData.append('order_number', item.order_number)
      formData.append('thing_title', item.title)
      formData.append('maintainance_date', maintainanceDate)
      createApi(formData)
        .then((res) => {
          message.success('预约成功');
        })
        .catch((err) => {
          message.error(err.msg || '预约失败');
        });
    }
    else
    {
      message.warn('请选择保养日期！'); 
    }
  }
</script>
<style scoped lang="less">
  .flex-view {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
  }

  .content-list {
    -webkit-box-flex: 1;
    -ms-flex: 1;
    flex: 1;

    .list-title {
      color: #152844;
      font-weight: 600;
      font-size: 18px;
      line-height: 24px;
      height: 24px;
      margin-bottom: 4px;
    }
  }

  .order-item-view {
    background: #f7f9fb;
    border-radius: 4px;
    padding: 16px;
    margin-top: 12px;

    .header {
      border-bottom: 1px solid #cedce4;
      padding-bottom: 12px;
      -webkit-box-pack: justify;
      -ms-flex-pack: justify;
      justify-content: space-between;
      font-size: 14px;

      .text {
        color: #6f6f6f;
      }

      .mg-4 {
        margin-left: 4px;
      }

      .num {
        font-weight: 500;
        color: #152844;
      }

      .num {
        font-weight: 500;
        color: #152844;
      }

      .time {
        margin-left: 16px;
        color: #a1adc5;
      }

      .state {
        color: #ff7b31;
        font-weight: 600;
        margin-left: 10px;
      }
    }

    .content {
      padding: 12px 0;
      overflow: hidden;

      .left-list {
        overflow: hidden;
        height: 132px;
        -webkit-box-flex: 2;
        -ms-flex: 2;
        flex: 2;
        padding-right: 16px;

        .list-item {
          height: 75px;
          margin-bottom: 12px;
          overflow: hidden;
          cursor: pointer;
        }

        .thing-img {
          width: 80px;
          height: 100%;
          margin-right: 12px;
        }

        .detail {
          -webkit-box-flex: 1;
          -ms-flex: 1;
          flex: 1;
          -webkit-box-orient: vertical;
          -webkit-box-direction: normal;
          -ms-flex-direction: column;
          flex-direction: column;
        }

        .flex-between {
          -webkit-box-pack: justify;
          -ms-flex-pack: justify;
          justify-content: space-between;
        }

        .flex-between {
          -webkit-box-pack: justify;
          -ms-flex-pack: justify;
          justify-content: space-between;
        }

        .flex-top {
          -webkit-box-align: start;
          -ms-flex-align: start;
          align-items: flex-start;
        }

        .name {
          color: #152844;
          font-weight: 600;
          font-size: 14px;
          line-height: 18px;
        }

        .count {
          color: #484848;
          font-size: 12px;
        }

        .flex-between {
          -webkit-box-pack: justify;
          -ms-flex-pack: justify;
          justify-content: space-between;
        }

        .flex-center {
          -webkit-box-align: center;
          -ms-flex-align: center;
          align-items: center;
        }

        .type {
          color: #6f6f6f;
          font-size: 12px;
        }

        .price {
          color: #ff7b31;
          font-weight: 600;
          font-size: 30px;
        }
      }

      .right-info {
        -webkit-box-flex: 1;
        -ms-flex: 1;
        flex: 1;
        border-left: 1px solid #cedce4;
        padding-left: 12px;
        line-height: 22px;
        font-size: 14px;

        .title {
          color: #6f6f6f;
        }

        .name {
          color: #152844;
        }

        .text {
          color: #484848;
        }

        .mg {
          margin-bottom: 4px;
        }
      }
    }

    .bottom {
      -webkit-box-align: center;
      -ms-flex-align: center;
      align-items: center;
      border-top: 1px solid #cedce4;
      -webkit-box-pack: justify;
      -ms-flex-pack: justify;
      justify-content: space-between;
      font-size: 14px;
      padding-top: 14px;

      .text {
        color: #6f6f6f;
      }

      .open {
        color: #4684e2;
        margin-left: 8px;
        cursor: pointer;
      }

      .right {
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
      }

      .text {
        color: #6f6f6f;
      }

      .num {
        color: #152844;
        margin: 0 40px 0 8px;
      }

      .money {
        font-weight: 600;
        font-size: 18px;
        color: #ff7b31;
        margin-left: 8px;
      }
    }
  }

  .order-item-view:first-child {
    margin-top: 16px;
  }
  .date-picker {
    display: flex;
    width: 100%;
    padding: 0;
    flex-wrap: wrap;
  }

  .date-picker .block {
    padding: 30px 0;
    text-align: center;
    border-right: solid 1px var(--el-border-color);
    flex: 1;
  }

  .date-picker .block:last-child {
    border-right: none;
  }

  .date-picker .demonstration {
    display: block;
    color: var(--el-text-color-secondary);
    font-size: 14px;
    margin-bottom: 20px;
  }
</style>
