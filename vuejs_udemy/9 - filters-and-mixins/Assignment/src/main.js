import Vue from 'vue'
import App from './App.vue'

Vue.filter('to-lowercase', function (value) {
  return value.toLowerCase();
});

Vue.filter('appendLength', function (value) {
  return value ? value + ' (' + value.length + ')' : '';
});

Vue.mixin({
  created() {
    console.log('Global Mixin - Created Hook');
  }
});

new Vue({
  el: '#app',
  render: h => h(App)
})
