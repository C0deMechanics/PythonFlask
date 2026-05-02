<template>
    <b-row style="margin-top:5%;margin-left:5%;margin-right:5%;">
        <b-col cols="9">
            <canvas ref="mycanvas" width="850" height="450"></canvas>
        </b-col>
        <b-col cols="3">
            <canvas ref="mycanvas2"></canvas>
        </b-col>
    </b-row>
</template>
<style scoped>

</style>
<script>
module.exports = {
    data() {
        return {
            itemslist:[]  //Holds items retrieved from database
        };
    },
    mounted(){
        this.getItems();
    },
    methods: {

        //Gets items from database
        getItems(){
            
            //creates the get request 
            axios.get('/tuts/report')
            .then((resp) => { 
                
                var grandTotal = 0; //Total expenses of the year 2019
                
                var monthTotal = {  //Used for monthly total
                    '1':0,
                    '2':0,
                    '3':0,
                    '4':0,
                    '5':0,
                    '6':0,
                    '7':0,
                    '8':0,
                    '9':0,
                    '10':0,
                    '11':0,
                    '12':0
                };

                //Used to create the datasets
                var Internet = {
                    items:[],
                    sum:0,
                    percent:0
                };
                
                var electric = {
                    items:[],
                    sum:0,
                    percent:0

                };

                var water = {
                    items:[],
                    sum:0,
                    percent:0
                };
                //Used to create the datasets


                this.itemslist = resp.data;
                
                //Loop on each row and compute sum
                this.itemslist.forEach(elem=>{
                    switch(elem.Entry_Name){
                        case 'Electricity':
                            electric.items.push(elem.Entry_Amount);
                            electric.sum += elem.Entry_Amount;
                            break;
                        case 'Water':
                            water.items.push(elem.Entry_Amount);
                            water.sum += elem.Entry_Amount;
                            break;
                        case 'Internet':
                            Internet.items.push(elem.Entry_Amount);
                            Internet.sum += elem.Entry_Amount;
                            break;       
                    }

                    //Sum per month
                    switch(elem.Entry_Month){
                        case 'Jan':
                            monthTotal['1'] += elem.Entry_Amount;
                            break;
                        case 'Feb':
                            monthTotal['2'] += elem.Entry_Amount;
                            break;
                        case 'Mar':
                            monthTotal['3'] += elem.Entry_Amount;
                            break;
                        case 'Apr':
                            monthTotal['4'] += elem.Entry_Amount;
                            break;
                        case 'May':
                            monthTotal['5'] += elem.Entry_Amount;
                            break;
                        case 'Jun':
                            monthTotal['6'] += elem.Entry_Amount;
                            break;
                        case 'Jul':
                            monthTotal['7'] += elem.Entry_Amount;
                            break;
                        case 'Aug':
                            monthTotal['8'] += elem.Entry_Amount;
                            break;
                        case 'Sep':
                            monthTotal['9'] += elem.Entry_Amount;
                            break;
                        case 'Oct':
                            monthTotal['10'] += elem.Entry_Amount;
                            break;
                        case 'Nov':
                            monthTotal['11'] += elem.Entry_Amount;
                            break;
                        case 'Dec':
                            monthTotal['12'] += elem.Entry_Amount;
                            break;                                
                    }    


                    //Grand total
                    grandTotal+= elem.Entry_Amount;
                });
                
                //Format to 2 decimal places
                grandTotal = grandTotal.toFixed(2);  

                electric.sum = electric.sum.toFixed(2);
                water.sum = water.sum.toFixed(2);
                Internet.sum = Internet.sum.toFixed(2);

                electric.percent = ((electric.sum/grandTotal)*100).toFixed(2);
                water.percent = ((water.sum/grandTotal)*100).toFixed(2);
                Internet.percent = ((Internet.sum/grandTotal)*100).toFixed(2);

                //Format to 2 decimal places

                //Format to more readable json
                var formatted = {
                    'elec':electric,
                    'water':water,
                    'net':Internet,
                    'monthly':monthTotal
                }

                //Call the method create chart inside axios
                this.createChart(formatted)

            }).catch(errors => { console.error(errors); });;
        },
        createChart(param){

                var monthly = [];

                //Loop each key inside the object
                Object.keys(param.monthly).forEach(key=>{ 
                    monthly.push(param.monthly[key]);
                });

                //Access canvas anc create chart line + bar chart
                //Displays monthly expense
                var context = this.$refs['mycanvas'].getContext("2d")
                new Chart(context, {
                type: 'bar',
                data: {
                labels: ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],
                datasets: [
                        {
                            label: "Monthly",
                            type: 'line',
                            backgroundColor: "#FF0000",
                            borderColor:"#FF0000",
                            borderWidth:1,
                            data: monthly
                        },
                        {
                            label: "Electric",
                            type: 'bar',
                            backgroundColor: "#004c6d",
                            data: param.elec.items
                        }, 
                        {
                            label: "Water",
                            type: 'bar',
                            backgroundColor: "#346888",
                            data: param.water.items
                        },
                        {
                            label: "Internet",
                            type: 'bar',
                            backgroundColor: "#5886a5",
                            data: param.net.items
                        },
                    ]
                },
                options: {
                     plugins: {
                        title: {
                            display: true,
                            text: 'Utility Bills 2019'
                        }
                    }
                }
            });

            //Access the 2nd canvas
            //Displays the percentage of electric, water and internet expense year 2019
            var context2 = this.$refs['mycanvas2'].getContext("2d")
            new Chart(context2, {
                type: 'pie',
                data: {
                labels: ["Electric", "Water", "Internet"],
                datasets: [{
                    label: "Expenses 2019",
                    backgroundColor: ["#004c6d", "#346888","#5886a5"],
                    data: [param.elec.percent,param.water.percent,param.net.percent]
                }]
                },
                options: {
                    plugins: {
                        title: {
                            display: true,
                            text: 'Utility Bills 2019'
                        },
                        tooltip: {
                            //Call back during display of tool tip
                            callbacks: {
                                label: function(data) {
                                    let label = `${data.label} ${data.raw} %`
                                    console.log(data);
                                    return label;
                                }
                            }
                        }
                    }
                }
            });
        }
    }, 
}
</script>
