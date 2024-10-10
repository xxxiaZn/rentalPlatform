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
        <template #bodyCell="{ text, record, index, column }">
          <template v-if="column.key === 'operation'">
            <span>
              <a v-if="!record.complete_time" @click="handleEdit(record)">维修</a>
              <span v-else class="repaired-text">已维修</span>
            </span>
          </template>
        </template>
      </a-table>
    </div>

    <!--弹窗区域-->
    <div>
      <a-modal :forceRender="true">
        <div>
          <a-form ref="myform" :model="modal.form"></a-form>
        </div>
      </a-modal>
    </div>
  </div>
</template>

<script setup lang="ts">
  import { FormInstance, message } from 'ant-design-vue';
  import { listApi, complete_repairApi } from '/@/api/admin/repair';
  import { updateApi } from '/@/api/admin/thing';

  const columns = reactive([
    {
      title: '序号',
      dataIndex: 'index',
      key: 'index',
      align: 'center',
    },
    {
      title: '订单号',
      dataIndex: 'order_number',
      key: 'order_number',
      align: 'center',
    },
    {
      title: '预约维修时间',
      dataIndex: 'repair_time',
      key: 'repair_time',
      align: 'center',
    },
    {
      title: '完成维修时间',
      dataIndex: 'complete_time',
      key: 'complete_time',
      align: 'center',
    },
    {
      title: '操作',
      dataIndex: 'action',
      key: 'operation',
      align: 'center',
      fixed: 'right',
      width: 140,
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

  // 弹窗数据源
  const modal = reactive({
    visile: false,
    editFlag: false,
    title: '',
    form: {
      id: undefined,
      title: undefined,
    },
  });

  const myform = ref<FormInstance>();

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
        res.data.forEach((item: any, index: any) => {
          item.repair_time = formatDate(item.repair_time);
          if (item.complete_time) {
            item.complete_time = formatDate(item.complete_time);
          }
          item.index = index + 1;
        });
        data.tagList = res.data;
      })
      .catch((err) => {
        data.loading = false;
        console.log(err);
      });
  };

  const handleEdit = (record: any) => {
    resetModal();
    modal.editFlag = true;
    for (const key in modal.form) {
      modal.form[key] = undefined;
    }
    for (const key in record) {
      modal.form[key] = record[key];
    }
    myform.value
      ?.validate()
      .then(() => {
        if (modal.editFlag) {
          const formData = new FormData();
          formData.append('status', '2')
          complete_repairApi({ id: modal.form.id })
            .then((res) => {
              hideModal();
              getDataList();
            })
            .catch((err) => {
              message.error(err.msg || '操作失败');
            });
        }
      });
  };

  // 恢复表单初始状态
  const resetModal = () => {
    myform.value?.resetFields();
  };

  // 关闭弹窗
  const hideModal = () => {
    modal.visile = false;
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

  .repaired-text {
    color: #1890ff;
    cursor: default;
  }
</style>
