const app = Vue.createApp({
  data() {
    return {
      inputDown: '',
      inputEnter: ''
    }
  },
  methods: {
    showAlert() {
      alert('Alert!')
    },
    keyDown(event) {
      this.inputDown = event.target.value;
    },
    keyEnter(event) {
      this.inputEnter = event.target.value;
    }
  }
});

app.mount('#assignment');