<template>
  <div class="container">
    <form v-if="!isSubmitted">
      <div class="row">
        <div
          class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3"
        >
          <h1>A Form</h1>
          <hr />
          <app-full-name v-model="fullName"></app-full-name>
          <div class="row">
            <div class="form-group">
              <label for="email">Mail</label>
              <input class="form-control" id="email" v-model="email" />
            </div>
            <div class="form-group">
              <label for="password">Password</label>
              <input class="form-control" id="password" v-model="password" />
            </div>
            <div class="form-group">
              <p>Store in Db?</p>
              <label for="yes">
                <input class="form-control" id="yes" value="Yes" type="radio" v-model="storeDb" />Yes
              </label>
              <label for="no">
                <input class="form-control" id="no" value="No" type="radio" v-model="storeDb" />No
              </label>
            </div>
          </div>
          <button class="btn btn-primary" @click.prevent="handleSubmit">
            Submit
          </button>
          <!-- Exercise 1 -->
          <!-- Create a Signup Form where you retrieve the following Information -->
          <!-- Full Name (First Name + Last Name) -->
          <!-- Mail -->
          <!-- Password -->
          <!-- Store Data? Yes/No -->

          <!-- Exercise 2 -->
          <!-- Only display the Form if it has NOT been submitted -->
          <!-- Display the Data Summary ONCE the Form HAS been submitted -->

          <!-- Exercise 3 -->
          <!-- Edit the Example from above and create a custom "Full Name" Control -->
          <!-- which still holds the First Name and Last Name Input Field -->
        </div>
      </div>
    </form>
    <hr />
    <div class="row" v-if="true">
      <div class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4>Your Data</h4>
          </div>
          <div class="panel-body">
            <p>Full Name: {{ fullName }}</p>
            <p>Mail: {{ email }}</p>
            <p>Password: {{ password }}</p>
            <p>Store in Database?: {{ storeDb }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import FullName from './FullName.vue';
export default {
  data() {
    return {
      fullName: 'Chuang Yu',
      email: '',
      password: '',
      storeDb: 'Yes',
      isSubmitted: false,
    };
  },
  computed: {
    fullname() {
      return this.firstName + '' + this.lastName;
    },
  },
  methods: {
    handleSubmit() {
      this.isSubmitted = true;
    },
  },
  components: {
    appFullName: FullName,
  }
};
</script>

<style>
</style>
