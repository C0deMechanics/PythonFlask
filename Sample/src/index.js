'use strict'

import router from './router.js';

// eslint-disable-next-line no-unused-vars
const app1 = new Vue({
    el: '#app',
    components: {
        'mycomponent': httpVueLoader('./components/mycomponent.vue'),
        'myheader':httpVueLoader('./components/myheader.vue'),
    },
    data(){
        return { };
    }, 
    computed:{
    },
    methods: {
    }, 
    mounted: function(){
        
      //navigates to home page at mount
      this.$router.push('/home'); 

        uibuilder.start()
        var vueApp = this
        uibuilder.onChange('msg', function(newVal) {
        });
    },
    router: new VueRouter(router),
})
