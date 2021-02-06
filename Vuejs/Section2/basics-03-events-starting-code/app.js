const app = Vue.createApp({
  data() {
    return {
      counter: 10,
      name: '',
      confirmedName: ''
    };
  },
  methods: {
    confirmInput() {
      this.confirmedName = this.name;
    },
    submitForm(event) {
      alert('Submitted!');
    },
    setName(event, lastName) {
      this.name = event.target.value + ' ' + lastName;
    },
    addCounter(number) {
      this.counter = this.counter + number;
    },
    removeCounter(number) {
      this.counter = this.counter - number;
    }
  }
});

app.mount('#events');
