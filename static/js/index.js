'use strict'

import router from './router.js';

const app1 = new Vue({
    el: '#app',
    components: {
        'mycomponent': httpVueLoader('./static/components/mycomponent.vue'),
        'myheader': httpVueLoader('./static/components/myheader.vue')
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
         var vueApp = this
    },
    router: new VueRouter(router),
})
