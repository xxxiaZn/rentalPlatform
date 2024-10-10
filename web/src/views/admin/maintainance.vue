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
    import { listApi } from '/@/api/admin/maintainance';

    const columns = reactive([
      {
        title: '序号',
        dataIndex: 'index',
        key: 'index',
        align: 'center',
      },
      {
        title: '订单号',
        dataIndex: 'order_number', // Change to the new property name
        key: 'order_number',
        align: 'center',
      },
      {
        title: '轮椅型号',
        dataIndex: 'thing_title', // Change to the new property name
        key: 'thing_title',
        align: 'center',
      },
      {
        title: '保养时间',
        dataIndex: 'maintainance_date',
        key: 'maintainance_date',
        align: 'center',
      },
    ]);

    // 格式化日期函数
    const formatDate = (dateStr: string) => {
      const date = new Date(dateStr);
      return `${date.getFullYear()}年${date.getMonth() + 1}月${date.getDate()}日`;
    };

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

    const getDataList = () => {
      data.loading = true;
      listApi({
        keyword: data.keyword,
      })
        .then((res) => {
          data.loading = false;
          res.data.forEach((item: any, index: any) => {
            item.index = index + 1;
            item.order_number = item.order_number; // Use the new property name
            item.thing_title = item.thing_title;   // Use the new property name
            // Format the maintainance date
            if (item.maintainance_date) {
              item.maintainance_date = formatDate(item.maintainance_date);
            }
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
  