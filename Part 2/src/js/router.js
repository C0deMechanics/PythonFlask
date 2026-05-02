const Home = httpVueLoader('./components/subcomponents/home.vue');
const Form = httpVueLoader('./components/subcomponents/form.vue');
const Table = httpVueLoader('./components/subcomponents/table.vue');
const Chart = httpVueLoader('./components/subcomponents/chart.vue');

export default {

    routes: [
        {
            path: '/',
            name: 'Home',
            components: Home
        },
        {
            path:'/home',
            name:'Home',
            component: Home
        },
        {
            path:'/form',
            name:'Form',
            component: Form
        },
        {
            path:'/table',
            name:'Table',
            component: Table
        },
        {
            path:'/chart',
            name:'Chart',
            component: Chart
        }
    ],
};