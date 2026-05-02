<template>
    <b-row style="margin-top:5%;margin-left:5%;margin-right:5%;">
        <b-container>
            <b-row>
                <b-col cols="4">
                    <canvas ref="temp" height="210"></canvas>
                </b-col>
                <b-col cols="4">
                    <canvas ref="hum" height="210"></canvas>
                </b-col>
                <b-col cols="4">
                    <canvas ref="pres" height="210"></canvas>
                </b-col>
        </b-row>
        <b-col cols="12">
            <b-pagination v-model="currentPage"
                          :total-rows="rows"
                          :per-page="perPage"
                          aria-controls="my-table"
                          style="float:right;"></b-pagination>
            <p class="mt-3">Current Page: {{ currentPage }}</p>
            <b-table id="my-table"
                        :items="items"
                        :per-page="perPage"
                        :current-page="currentPage"
                        small>
                        </b-table>
        </b-col>
    </b-row>
</template>
<style scoped>

</style>
<script>
module.exports = {
    data() {
        return {
            perPage: 5,
            currentPage: 1,
            items: [ ],
             client: undefined, //mqtt client
            isMonitoring:false, //flag for monitring
            temp:[],            //values for tem
            tempLabels:[],      //chart labels    
            tmpChart:undefined, //var to hold chart
            humidity:[],        //values for humidity 
            humLabels:[],       //labels
            humChart:undefined, //var to hold chart
            pressure:[],        //values for pressure
            presLabels:[],      //labels
            presChart:undefined, //var to hold chart
        }
    },
    mounted(){
        this.retrieveData(); //retrieve master of sensor detail
        this.monitor();      //method to start mqtt  
        this.createChart();  //display data as chart
    },
    computed: {
      rows() {
        return this.items.length
      }
    },
    methods: {
        createChart(){
            var context = this.$refs['temp'].getContext("2d")
            this.tmpChart = new Chart(context,{
                                type: 'line',
                                data: {
                                labels: this.tempLabels,
                                datasets: [
                                            {
                                                label: "Temperature (°C)",
                                                fill: true,
                                                backgroundColor: "rgba(255,99,132,0.2)",
                                                borderColor: "rgba(255,99,132,1)",
                                                borderWidth:1,
                                                lineTension: .0,
                                                pointRadius: 1,
                                                data: this. temp
                                            }
                                        ]
                                },
                                options: {
                                        plugins: {
                                        title: {
                                            display: true,
                                            text: 'Temperatures'
                                        }
                                    }
                                }
                            });

            var context2 = this.$refs['hum'].getContext("2d")
            this.humChart = new Chart(context2,{
                            type: 'line',
                            data: {
                            labels: this.humLabels,
                            datasets: [
                                        {
                                            label: "Humidity (%)",
                                            fill: true,
                                            backgroundColor: "rgba(179,181,198,0.2)",
                                            borderColor: "rgba(179,181,198,1)",
                                            borderWidth:1,
                                            lineTension: .0,
                                            pointRadius: 1,
                                            data: this.humidity
                                        }
                                    ]
                            },
                            options: {
                                    plugins: {
                                    title: {
                                        display: true,
                                        text: 'Humidity'
                                    }
                                }
                            }
                        });
                        
            var context3 = this.$refs['pres'].getContext("2d")
            this.presChart = new Chart(context3,{
                            type: 'line',
                            data: {
                            labels: this.presLabels,
                            datasets: [
                                        {
                                            label: "Pressure (ATM)",
                                            fill: true,
                                            backgroundColor: "rgba(90,181,198,0.2)",
                                            borderColor: "rgba(90,181,198,1)",
                                            borderWidth:1,
                                            lineTension: .0,
                                            pointRadius: 1,
                                            data: this.pressure
                                        }
                                    ]
                            },
                            options: {
                                    plugins: {
                                    title: {
                                        display: true,
                                        text: 'Pressure'
                                    }
                                }
                            }
                        });                  


        },
        retrieveData(){
            axios.get('/tuts/IoTParameters')
            .then((resp) => { 
                this.items = resp.data; //displays data
            })
            .catch(errors => { console.error(errors); });;
        },
        monitor(){
            this.isMonitoring = !this.isMonitoring;  
            if(this.isMonitoring){ this.connect(); }
            else{  }
        },
        connect(){

                let self = this;
                let clientid = 'iot-code-mechanic' + Math.floor(Math.random() * 8999 + 1000);
                self.client = new Paho.Client("broker.mqttdashboard.com",Number("8000"),clientid);
                self.client.onConnectionLost = onConnectionLost;
                self.client.onMessageArrived = onMessageArrived;
                self.client.connect({onSuccess:onConnect,userName:"",password:"",keepAliveInterval: 15,timeout: 15000});
               
                function onConnect(){ 
                    self.client.subscribe("/MQTT/Temp");
                    self.client.subscribe("/MQTT/Humidity");
                    self.client.subscribe("/MQTT/Pressure");
                }
               
                function onConnectionLost(responseObject){}
                function onMessageArrived(message){

                    // console.log(message);
                    var tmp = 0;
                    var d = new Date();
                    var n = d.toLocaleTimeString();

                    if(message.destinationName == "/MQTT/Temp"){
                        self.items[0].sensor_reading = Number(message.payloadString).toFixed(2)+" °C";
                        tmp = Number(message.payloadString).toFixed(2);
                        if(self.tempLabels.length < 10){
                            self.temp.push(tmp)
                            self.tempLabels.push(n)
                        } else {
                            self.temp.shift();
                            self.tempLabels.shift();
                            self.temp.push(tmp);
                            self.tempLabels.push(n);
                        }
                       
                     
                        if(self.tmpChart!=null)
                            self.tmpChart.update('none')
                    }
                    
                    if (message.destinationName == "/MQTT/Humidity"){
                        self.items[1].sensor_reading = Number(message.payloadString).toFixed(2)+" %";
                        tmp = Number(message.payloadString).toFixed(2);
                        if(self.humLabels.length < 10){
                           self.humidity.push(tmp)
                           self.humLabels.push(n)
                        } else {
                           self.humidity.shift();
                           self.humLabels.shift();
                           self.humidity.push(tmp);
                           self.humLabels.push(n);
                        }
                       
                        if(self.humChart!=null)
                            self.humChart.update('none')
                    }

                    if (message.destinationName == "/MQTT/Pressure"){
                        self.items[2].sensor_reading = message.payloadString+"  ATM";
                        tmp = Number(message.payloadString).toFixed(2);
                        if(self.presLabels.length < 10){
                           self.pressure.push(tmp)
                           self.presLabels.push(n)
                        } else {
                           self.pressure.shift();
                           self.presLabels.shift();
                           self.pressure.push(tmp);
                           self.presLabels.push(n);
                        }
                       
                        if(self.presChart!=null)
                            self.presChart.update('none')
                    }
            }

        },
    },
    beforeDestroy(){
        if(this.client!=undefined){
            this.client.disconnect();
            console.log("Terminate MQTT")
        }
    },
    disconnect(){
        if(this.client!=undefined){ this.client.disconnect(); }
    },
}
</script>
