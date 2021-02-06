const app = Vue.createApp({
  data (){
    return {
      number: 0,
    }
  },
  methods: {
    addNumber(n){
      this.number = this.number + n;
      console.log(this.number)
    }
  },
  computed: {
    result (){
      if (this.number > 37){
        return "Too much!"
      }
      return "Not there yet"
    }
  },
  watch: {
    number() {
      const that = this
      setTimeout(function () {
        that.number = 0;
      }, 5000)
    }
  }
});

app.mount('#assignment');