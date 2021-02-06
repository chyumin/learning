const app = Vue.createApp({
  data() {
    return {
      userText: '',
      visible: true,
      bgcolor: '',
    };
  },
  computed: {
    paraClasses() {
      return {
        user1: this.userText === 'user1',
        user2: this.userText === 'user2',
        visible: this.visible,
        hidden: !this.visible
      };
    },
  },
  methods: {
    toggle () {
      this.visible = !this.visible;
    }
  }
});

app.mount('#assignment');