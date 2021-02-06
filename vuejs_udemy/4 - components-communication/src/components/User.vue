<template>
  <div class="component">
    <h1>The User Component</h1>
    <p>I'm an awesome User!</p>
    <button @click="changeName">Change my Name</button>
    <p>Name is {{ name }}</p>
    <p>Age is {{ age }}</p>
    <hr />
    <div class="row">
      <div class="col-xs-12 col-sm-6">
        <app-user-detail
          :myName="name"
          @nameWasReset="name = $event"
          :resetFn="resetName"
          :userAge="age"
        ></app-user-detail>
      </div>
      <div class="col-xs-12 col-sm-6">
        <app-user-edit @ageEdited="age = $event" :userAge="age"></app-user-edit>
      </div>
    </div>
  </div>
</template>

<script>
import UserDetail from './UserDetail.vue';
import UserEdit from './UserEdit.vue';

export default {
  data: function () {
    return {
      name: 'Yu',
      age: 28,
    };
  },
  components: {
    appUserDetail: UserDetail,
    appUserEdit: UserEdit,
  },
  methods: {
    changeName() {
      this.name = 'Ana';
    },
    resetName() {
      this.name = 'Yu';
    },
  },
};
</script>

<style scoped>
div {
  background-color: lightblue;
}
</style>
