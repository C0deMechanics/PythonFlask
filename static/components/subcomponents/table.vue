<template>
    <b-container fluid>
        <b-row align-h="center">
            <b-col style="margin-top:5%;">
                    <b-pagination v-model="currentPage" 
                                :total-rows="rows" 
                                :per-page="perPage" 
                                aria-controls="tb-display"
                                style="float:right;">
                                    </b-pagination>
                <b-table id="tb-display" striped hover 
                                        small
                                        :items="items" 
                                        :per-page="perPage"
                                        :fields="fields"
                                        :current-page="currentPage">
                    <template #cell(Selected)="curRow">
                        <b-form-checkbox style="float:center;" v-model="curRow.item.Selected"></b-form-checkbox>
                    </template>
                </b-table>
            </b-col>
        </b-row>
        <b-row>
            <b-col>
                   <input type="submit" style="float:right;" class="btn btn-info" @click="displaylog()">
            </b-col>
        </b-row>
    </b-container>
</template>
<style scoped>

</style>
<script>
module.exports = {
    data() {
        return {
            perPage: 5,
            currentPage: 1,
            items: [
                { Selected:false, id:1, age: 40, code: 'Emp1', name: 'Yeva Adrián',remarks: 'Lorem ipsum dolor sit amet,'},
                { Selected:false, id:2, age: 21, code: 'Emp2', name: 'Graysen Mirabelle',remarks: 'Lorem ipsum dolor sit amet,' },
                { Selected:false, id:3, age: 89, code: 'Emp3', name: 'Patritsiya Li',remarks: 'Lorem ipsum dolor sit amet,' },
                { Selected:false, id:4, age: 38, code: 'Emp4', name: 'Suriya Áki',remarks: 'Lorem ipsum dolor sit amet,' },
                { Selected:false, id:5, age: 38, code: 'Emp5', name: 'Hamisu Sandra',remarks: 'Lorem ipsum dolor sit amet,' },
                { Selected:false, id:6, age: 38, code: 'Emp6', name: 'Amondi Katla',remarks: 'Lorem ipsum dolor sit amet,' },
                { Selected:false, id:7, age: 38, code: 'Emp7', name: 'Ondina Bel',remarks: 'Lorem ipsum dolor sit amet,' },
                { Selected:false, id:8, age: 38, code: 'Emp8', name: 'Utku Demetrios',remarks: 'Lorem ipsum dolor sit amet,' },
                { Selected:false, id:9, age: 38, code: 'Emp9', name: 'Isaura Dafna',remarks: 'Lorem ipsum dolor sit amet,' },
                { Selected:false, id:10, age: 38, code: 'Emp10', name: 'Marie Olanrewaju',remarks: 'Lorem ipsum dolor sit amet,' },
                { Selected:false, id:11, age: 38, code: 'Emp11', name: 'Sigge Lana',remarks: 'Lorem ipsum dolor sit amet,' },
                { Selected:false, id:12, age: 38, code: 'Emp12', name: 'Milo Homer',remarks: 'Lorem ipsum dolor sit amet,' },
            ],
            fields: [
                {
                    key:'Selected',
                    label:'Selected',
                    thClass:'text-center',
                    tdClass:'text-center'
                },
                 {
                    key:'id',
                    label:'ID',
                    thClass:'text-center',
                    tdClass:'text-center'
                },
                 {
                    key:'age',
                    label:'Age',
                    thClass:'text-center',
                    tdClass:'text-center'
                },
                 {
                    key:'code',
                    label:'Code',
                    thClass:'text-center',
                    tdClass:'text-center'
                },
                {
                    key:'name',
                    label:'Name',
                    thClass:'text-center',
                    tdClass:'text-center'
                },
                {
                    key:'remarks',
                    label:'Remarks',
                    thClass:'text-center',
                    tdClass:'text-center'
                }
            ],
        };
    },
    computed:{
        rows() {
            return this.items.length
        },
        getitems(){
            return this.items;
        }
    },
    mounted(){
    },
    methods: {
        displaylog(){
            console.log(this.items[0].Selected);
        },
    }, 
}
</script>
