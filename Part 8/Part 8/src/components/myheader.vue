<template>
 <b-navbar toggleable="lg" type="dark" variant="info">
    <b-navbar-brand href="#">Code Mechanic</b-navbar-brand>

    <b-navbar-toggle target="nav-collapse" v-show="keys.islogged"></b-navbar-toggle>

    <b-collapse id="nav-collapse" is-nav>
      <b-navbar-nav v-show="keys.islogged">
        <b-nav-item href="#" to="/home">Home</b-nav-item>
        <b-nav-item href="#" to="/form">Form</b-nav-item>
        <b-nav-item href="#" to="/table">Table</b-nav-item>
        <b-nav-item href="#" to="/chart">Chart</b-nav-item>
        <b-nav-item href="#" to="/iot">MQTT</b-nav-item>
      </b-navbar-nav>
      <b-navbar-nav class="ml-auto" v-show="keys.islogged">
        <b-nav-item-dropdown right v-show="keys.islogged">
          <template #button-content>
             <em>
              <b-avatar :src="keys.avatar" size="1.8rem"></b-avatar>&nbsp;{{keys.user_name}}
            </em>
          </template>
          <b-dropdown-item href="#" @click="keys.performLogout()">Sign Out</b-dropdown-item>
        </b-nav-item-dropdown>
      </b-navbar-nav>
    </b-collapse>
  </b-navbar>
</template>
<style scoped>

</style>
<script>
module.exports = {
    props:['keys'],
    data() {
        return {};
    },
    mounted(){
    },
    methods: {
    }, 
}
</script>
