<template>
  <div class="container">
    <header-comp />
    <hr />
    <server-list />
    <hr />
    <footer-comp />
  </div>
</template>

<script>
import ServerList from './ServerList.vue';
import HeaderComp from './Header.vue';
import FooterComp from './Footer.vue';

export default {
  components: {
    ServerList,
    HeaderComp,
    FooterComp,
  },
};
</script>

<style>
</style>
