<template>
    <div>
      <!--页面区域-->
      <div class="page-view">
        <a-table
          size="middle"
          rowKey="id"
          :loading="data.loading"
          :columns="columns"
          :data-source="data.tagList"
          :scroll="{ x: 'max-content' }"
          :pagination="{
            size: 'default',
            current: data.page,
            pageSize: data.pageSize,
            onChange: (current) => (data.page = current),
            showSizeChanger: false,
            showTotal: (total) => `共${total}条数据`,
          }"
        >
        </a-table>
      </div>
    </div>
  </template>
  
  <script setup lang="ts">
    import { listApi } from '/@/api/admin/fankuicontent';
  
  
    const columns = reactive([
      {
        title: '序号',
        dataIndex: 'index',
        key: 'index',
        align: 'center'
      },
      {
        title: '订单号',
        dataIndex: 'order_number',
        key: 'order_number',
        align: 'center'
      },
      {
        title: '反馈内容',
        dataIndex: 'fankuicontent',
        key: 'fankuicontent',
        align: 'center'
      },
      {
        title: '反馈时间',
        dataIndex: 'fankuitime',
        key: 'fankuitime',
        align: 'center'
      },
    ]);
  
    // 页面数据
    const data = reactive({
      tagList: [],
      loading: false,
      keyword: '',
      selectedRowKeys: [] as any[],
      pageSize: 10,
      page: 1,
    });
  
    onMounted(() => {
      getDataList();
    });

    // 格式化日期函数
    const formatDate = (dateStr: string) => {
      const date = new Date(dateStr);
      return `${date.getFullYear()}年${date.getMonth() + 1}月${date.getDate()}日`;
    };
    const getDataList = () => {
      data.loading = true;
      listApi({
        keyword: data.keyword,
      })
        .then((res) => {
          data.loading = false;
          console.log(res);
          res.data.forEach((item: any, index: any) => {
            item.index = index + 1;
            item.fankuicontent = item.fankuicontent;
            item.fankuitime = formatDate(item.fankuitime);
            item.order_number = item.order_number;
          });
          data.tagList = res.data;
        })
        .catch((err) => {
          data.loading = false;
          console.log(err);
        });
    };

  


  </script>
  
  <style scoped lang="less">
    .page-view {
      min-height: 100%;
      background: #fff;
      padding: 24px;
      display: flex;
      flex-direction: column;
    }
  
    .table-operations {
      margin-bottom: 16px;
      text-align: right;
    }
  
    .table-operations > button {
      margin-right: 8px;
    }
  </style>
  