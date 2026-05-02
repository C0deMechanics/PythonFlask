'use strict'

import router from './router.js';

// eslint-disable-next-line no-unused-vars
const app1 = new Vue({
    el: '#app',
    components: {
        'mycomponent': httpVueLoader('./components/mycomponent.vue'),
        'myheader':httpVueLoader('./components/myheader.vue'),
        'mylogin':httpVueLoader('./components/login.vue')
    },
    data(){
        return { 
            freshlogin: undefined,
            user:{
                islogged:false,
                user_id: undefined,
                isActive: undefined,
                user_code: undefined,
                user_name: undefined,
                performLogin: this.checkLogin,
                loginSuccess: this.succesfulLogin,
                performLogout: this.logoutUser
            }
        };
    }, 
    computed:{
    },
    methods: {
        checkLogin(username,password){
            if(username=="1506" && password =="321321321")
                return true;
            else
                return false;
        },
        succesfulLogin(){ this.user.islogged = true; },
        logoutUser(){ this.user.islogged = false; }
    }, 
    mounted: function(){
        
      //navigates to home page at mount
      this.$router.push('/home'); 

        uibuilder.start()
        var vueApp = this
        uibuilder.onChange('msg', function(newVal){
            //Session Expires
            //let topic = newVal.topic;
            //console.log(newVal.topic);
            // switch(topic)
            // {
            //     case 'Startup':
            //         if(newVal.session == undefined)
            //         { 
            //             // console.log('invalid session')
            //             vueApp.isLogged = false; 
            //         }
            //         else 
            //         { 
                  
            //             vueApp.user.user_id = newVal.payload.user_id
            //             vueApp.user.isActive = newVal.payload.isActive
            //             vueApp.user.user_code = newVal.payload.user_code
            //             vueApp.user.user_name = newVal.payload.user_name
            //             vueApp.user.avatar = newVal.payload.avatar
            //             //vueApp.user = true; 
            //         }
            //         break;

            //     case 'Login':
            //         // console.log(newVal.payload.userdetail.avatar)     
            //         vueApp.user.user_id = newVal.payload.userdetail.user_id
            //         vueApp.user.isActive = newVal.payload.userdetail.isActive
            //         vueApp.user.user_code = newVal.payload.userdetail.user_code
            //         vueApp.user.user_name = newVal.payload.userdetail.user_name
            //         vueApp.user.avatar = newVal.payload.userdetail.avatar
            //         //vueApp.user = true;
            //         vueApp.freshlogin = true; 
            //         break;

            //     case 'Logout':
            //         vueApp.isLogged = false;
            //         vueApp.freshlogin = false;
            //         localStorage.removeItem('token')    
            //         break;    
            // }
        });
    },
    router: new VueRouter(router),
})
