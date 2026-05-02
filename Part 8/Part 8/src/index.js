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
                avatar:'',
                user_id: undefined,
                isActive: undefined,
                user_code: undefined,
                user_name: undefined,
                loginSuccess: this.succesfulLogin,
                performLogout: this.logoutUser,
                setUser: this.setUser,
                setToken: this.setToken,
            }
        };
    }, 
    computed:{
    },
    methods: {
        succesfulLogin(){ this.user.islogged = true; },
        logoutUser(){ 
            var id = localStorage.getItem('token');
            this.user.islogged = false; 
            if(id!=null){ uibuilder.send( {'topic':'Logout', 'token':id, 'payload':{}}); }
        },
        setUser(param){
           this.user.islogged = true;
           this.user.user_id = param.user_id;
           this.user.user_code = param.user_code;
           this.user.avatar = param.avatar;
           this.user.isActive = param.isActive; 
        },
        setToken(user){

            //Gets the unique session identifier
            var sessionID = user.password;
            //Store session identifier to local browser 
            localStorage.setItem('token',sessionID) 

            //Notify index.js that a session is created
            uibuilder.send({
                'topic': 'Login',
                'token': sessionID,
                'payload': {
                   'user':{
                      'user_id': user.user_id,
                      'isActive': user.isActive,
                      'user_code': user.user_code,
                      'user_name': user.user_name,
                      'avatar': user.avatar,
                   },
                   'session':{
                      'uniqueid': sessionID,
                      'user_id': user.user_id,
                      'user_code': user.user_code,
                      'user_name': user.user_name,
                      'startTime': undefined
                   }
                }
             });
        },
    }, 
    mounted: function(){
        
        //navigates to home page at mount
        this.$router.push('/home'); 

        uibuilder.start()
        var vueApp = this
        uibuilder.onChange('msg',function(msg){
 
            switch(msg.topic)
            {
                case 'Startup':
                
                    if(msg.session == undefined)
                    { 
                        vueApp.user.islogged = false; 
                    }
                    else 
                    { 
                        vueApp.user.user_id = msg.payload.user_id
                        vueApp.user.isActive = msg.payload.isActive
                        vueApp.user.user_code = msg.payload.user_code
                        vueApp.user.user_name = msg.payload.user_name
                        vueApp.user.avatar = msg.payload.avatar
                        vueApp.user.islogged = true;
                    }
                    break;

                case 'Login':     
                    vueApp.user.user_id = msg.payload.user.user_id
                    vueApp.user.isActive = msg.payload.user.isActive
                    vueApp.user.user_code = msg.payload.user.user_code
                    vueApp.user.user_name = msg.payload.user.user_name
                    vueApp.user.avatar = msg.payload.user.avatar
                    vueApp.user.islogged = true;
                    vueApp.freshlogin = true; 
                    break;

                case 'Logout':
                    vueApp.user.islogged = false;
                    vueApp.freshlogin = false;
                    localStorage.removeItem('token')    
                    break;    
            }
        });
    },
    router: new VueRouter(router),
})
