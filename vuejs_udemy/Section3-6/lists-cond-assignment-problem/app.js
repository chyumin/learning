const app = Vue.createApp({
  data() {
    return {
      taskText: '',
      tasks: [],
      showList: true
    }
  },
  computed: {
    toggleButton () {
      return this.showList ? 'Hide List' : 'Show List';
    }
  },
  methods: {
    addTask() {
      this.tasks.push(this.taskText);
    },
    toggleTask() {
      this.showList = !this.showList;
    }
  }
});

app.mount('#assignment');