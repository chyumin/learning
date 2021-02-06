const app = Vue.createApp({
  data() {
    return {
      myName: '',
      myAge: 0,
      myAgePlus5: 0,
      randNumber: 0,
      imageUrl: '',
    }
  },
  methods: {
    agePlusFive() {
      this.myAgePlus5 = this.myAge + 5;
    }
  },
  mounted () {
    this.myName = 'Chuang Yu Min';
    this.myAge = 28;
    this.agePlusFive();
    this.randNumber = Math.random();
    this.imageUrl = 'https://picsum.photos/200/300';
  }
});

app.mount('#assignment')