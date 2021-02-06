<template>
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <br />
        <button class="btn btn-primary" @click="selectedColor = 'appBlue'">Load Blue Template</button>
        <button class="btn btn-success" @click="selectedColor = 'appGreen'">Load Green Template</button>
        <button class="btn btn-danger" @click="selectedColor = 'appRed'">Load Red Template</button>
        <hr />
        <component :is="selectedColor">
          <h4>Content!</h4>
        </component>
      </div>
    </div>
  </div>
</template>

<script>
import Blue from './components/Blue.vue';
import Green from './components/Green.vue';
import Red from './components/Red.vue';

export default {
  data() {
    return {
      selectedColor: 'appBlue',
    };
  },
  components: {
    appBlue: Blue,
    appGreen: Green,
    appRed: Red,
  },
};
</script>

<style>
</style>
