<template>
  <div class="user">
    <Header />

    <div class="user-content">
      <div class="user-content-left">
        <MineInfosView />
      </div>
      <div class="user-content-right">
        <router-view />
      </div>
    </div>
  </div>
</template>

<script>
  import Header from '/@/views/index/components/header.vue';
  import MineInfosView from '/@/views/index/user/mine-infos-view.vue';

  export default {
    components: {
      MineInfosView,
      Header,
    },
    data() {
      return {
        collapsed: false,
      };
    },
  };
</script>
<style scoped lang="less">
  .user {
    display: block;
  }

  .user-content {
    display: flex;
    flex-direction: row;
    //background-color: #2a9a44;
    max-width: 1200px;
    min-width: 800px;
    margin: 80px auto;
    .user-content-left {
    }
    .user-content-right {
      flex: 1;
      padding-right: 20px;
    }
  }
</style>
