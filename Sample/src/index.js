'use strict'


// eslint-disable-next-line no-unused-vars
const app1 = new Vue({
    el: '#app',
    components: {
        'mycomponent': httpVueLoader('./components/mycomponent.vue'),
    },
    data(){
        return { };
    }, 
    computed:{
    },
    methods: {
    }, 
    mounted: function(){
        
        uibuilder.start()
        var vueApp = this
        uibuilder.onChange('msg', function(newVal) {
        });
    },
})
