
<template>
  <div>
    <h3>New</h3>
    <button @click="counter++">Increase!</button>
    <p>{{ counter }}</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      counter: 0,
    };
  },
  destroyed() {
    console.log('Destroyeeeeeed');
  },
  deactivated() {
    console.log('Deactivated');
  },
  activated() {
    console.log('Activated');
  },
};
</script>

<style scoped>
</style>