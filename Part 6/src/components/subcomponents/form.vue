<template>
    <b-row style="margin-top:5%;margin-left:5%;margin-right:5%;">
        <b-col cols="8">
            <b-card bg-variant="light">
                <b-form-group label-cols-lg="3" 
                              label="Add Expense" 
                              label-size="lg" 
                              label-class="font-weight-bold pt-0" 
                              class="mb-0">
                    <b-form-group label="Type:" 
                                  label-cols-sm="3"
                                  label-align-sm="right"
                                  class="mb-0">
                        <b-form-select v-model="selected" 
                                       size="md"  
                                       :options="expense_type">
                                       </b-form-select>
                    </b-form-group>
                    <b-form-group label="Amount:" 
                                  label-cols-lg="3" 
                                  label-align-sm="right"
                                  style="margin-top:3%;">
                        <b-input-group size="md" prepend="₱">
                            <b-form-input type="number"
                                          v-model="form.amount">
                            </b-form-input>
                        </b-input-group>
                    </b-form-group>
                    <b-form-group label="DateTime:" 
                                  label-cols-lg="3" 
                                  label-align-sm="right">
                        <b-form-datepicker v-model="form.date" class="mb-2"></b-form-datepicker>
                        <b-form-timepicker v-model="form.time" locale="en"></b-form-timepicker>
                    </b-form-group>
                    <b-form-group label="Remarks:" label-cols-lg="3" label-align-sm="right">
                           <b-form-textarea v-model="form.remarks"
                                            placeholder="Enter something..."
                                            rows="3"
                                            max-rows="6">
                                            </b-form-textarea>
                    </b-form-group>
                      <b-button variant="info" style="float:right;" @click="addExpense">Add Expense</b-button>
                </b-form-group>
            </b-card>
        </b-col>
    </b-row>
</template>
<style scoped>

</style>
<script>
module.exports = {
    data() {
        return {
            selected:'Electric Bill',
            expense_type:[
                'Electric Bill',
                'Water Bill',
                'Internet Bill',
                'Life Insurance',
                'Tithes',
                'Meal Allowance',
                'Transpo',
                'Snacks',
                'Hygenics',
                'Vitamins',	
                'Groceries'
            ],
            form:{
                type:'',
                amount:null,
                date:'',
                time:'08:12:00',
                remarks:''
            }
        };
    },
    mounted(){
        this.form.time = this.getCurrentTime(); //Sets default value to time upon component mounting
        this.form.date = this.getCurrentDate(); //Sets default value to date upon component mounting
    },
    methods: {
        
        //Gets current time in HH:mm:ss format
        getCurrentTime(){
            var today = new Date();
            var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
            return time;
        },
        //Gets current datetime in yyyy-MM-dd format
        getCurrentDate(){
            const date = new Date();
            let day = date.getDate();
            let month = date.getMonth() + 1;
            let year = date.getFullYear();
            let currentDate = `${year}-${month}-${day}`;
            return currentDate
        },
        addExpense(){
            var self = this;                          //Assign this to a variable         
            this.form.type = this.selected;           //Assigns selected to form.type
            var param = {                             //Create the JSon
                   "Expense_Name": this.form.type,
                   "Expense_Amount": this.form.amount,   
                   "Expense_Datetime": this.form.date+" "+this.form.time,
                   "Expense_Remarks": this.form.remarks
            }

            axios.post('/tuts/addexpense',param)
            .then(resp=>{ 
                self.showNotification(); //shows notification of successful add
            })
            .catch(e=>{ console.log(error); });
        },
        //Use to clean form upon succcessful insert
        cleanForm(){
            this.form.type = '';
            this.form.amount = '';
            this.form.date = '';
            this.form.time ='';
            this.form.remarks = '';
        },
        //Shows a dialog notification
        showNotification() {
            var self = this;  //Assign this to a variable   
            this.boxTwo = ''
            this.$bvModal.msgBoxOk('Data was submitted successfully', {
            title: 'Confirmation',
            size: 'sm',
            buttonSize: 'sm',
            okVariant: 'success',
            headerClass: 'p-2 border-bottom-0',
            footerClass: 'p-2 border-top-0',
            centered: true
          })
          .then(value => { 
                self.cleanForm(); //clears form upon confirmation of user 
           })
          .catch(err => { })
      }
    }, 
}
</script>
