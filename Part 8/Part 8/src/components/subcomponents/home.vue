<template>
    <b-row>
        <b-col cols="8">
            <b-jumbotron header="Home Component"  
                         style="margin-top:5%;" 
                         lead="Using Node-RED, Bootstrap Vue and Vue JS">
                <p>I've been using Node-RED for Industrial IoT works. Yes, this tool is good for data gathering but has long way to go to give neat User Interface to present data. To share my knowledge, I will be making tutorials to create presentable UI using Vue Js and Bootstrap-vue with Node-RED's UIBuilder and probobly later use Paho MQTT to display live data from a sensor to a web application.</p>
            <b-button variant="info" href="#">More Info</b-button>
        </b-jumbotron>
        </b-col>
    </b-row>
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
