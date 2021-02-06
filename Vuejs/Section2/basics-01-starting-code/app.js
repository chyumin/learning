const app = Vue.createApp({
  data() {
    return {
      courseGoalA: 'GOOOOOOOOOOOOOOOAAAAL VAI CURINTIA',
      courseGoalB: 'Finish the course and learn Vue!!! hu3hu333',
      vueLink: 'https://vuejs.org/hueeeee'
    };
  },
  methods: {
    outputGoal() {
      const randomNumber = Math.random();
      if (randomNumber < 0.5) {
        return this.courseGoalA;
      } else {
        return this.courseGoalB;
      }
    }
  }
});

app.mount('#user-goal')
