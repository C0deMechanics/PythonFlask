<template>
 <b-navbar toggleable="lg" type="dark" variant="info">
    <b-navbar-brand href="#">Code Mechanic</b-navbar-brand>

    <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

    <b-collapse id="nav-collapse" is-nav>
      <b-navbar-nav>
        <b-nav-item href="#" to="/home">Home</b-nav-item>
        <b-nav-item href="#" to="/form">Form</b-nav-item>
        <b-nav-item href="#" to="/table">Table</b-nav-item>
        <b-nav-item href="#" to="/chart">Chart</b-nav-item>
      </b-navbar-nav>
      <b-navbar-nav class="ml-auto">
        <b-nav-item-dropdown right>
          <template #button-content>
             <em>
              <b-avatar src="./static/images/cookie.png" size="1.8rem"></b-avatar>&nbsp;System Administrator
            </em>
          </template>
          <b-dropdown-item href="#">Profile</b-dropdown-item>
          <b-dropdown-item href="#">Sign Out</b-dropdown-item>
        </b-nav-item-dropdown>
      </b-navbar-nav>
    </b-collapse>
  </b-navbar>
</template>
<style scoped>

</style>
<script>
module.exports = {
    data() {
        return {};
    },
    mounted(){
    },
    methods: {
    }, 
}
</script>
