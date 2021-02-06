<template>
  <div class="container">
    <div class="row">
      <div class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">
        <h1>Vuex</h1>
        <app-result></app-result>
        <hr />
        <app-another-result></app-another-result>
        <hr />
        <app-counter></app-counter>
        <hr />
        <app-another-counter></app-another-counter>
        <hr />
        <input type="text" v-model="value" />
        <p>{{ value }}</p>
      </div>
    </div>
  </div>
</template>

<script>
import Counter from './components/Counter.vue';
import AnotherCounter from './components/AnotherCounter.vue';
import Result from './components/Result.vue';
import AnotherResult from './components/AnotherResult.vue';

export default {
  computed: {
    value: {
      get() {
        return this.$store.getters.value;
      },
      set(value) {
        this.$store.dispatch('updateValue', value);
      }
    },
  },
  methods: {
    updateValue(event) {
      this.$store.dispatch('updateValue', event.target.value);
    },
  },
  components: {
    appCounter: Counter,
    appAnotherCounter: AnotherCounter,
    appResult: Result,
    appAnotherResult: AnotherResult,
  },
};
</script>

