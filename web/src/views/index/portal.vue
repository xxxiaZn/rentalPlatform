<template>
  <div class="portal">
    <Header />
    <Content />
  </div>
</template>
<script>
  import Header from '/@/views/index/components/header.vue';
  import Content from '/@/views/index/components/content.vue';

  export default {
    components: {
      Header,
      Content,
    },
    data() {
      return {};
    },
  };
</script>
<style scoped lang="less"></style>
