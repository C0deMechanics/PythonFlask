<template>
      <b-row style="margin-top:5%;margin-left:5%;margin-right:5%;">
        <b-col cols="12">
         <b-pagination
                    v-model="currentPage"
                    :total-rows="rows"
                    :per-page="perPage"
                    aria-controls="my-table"
                    style="float:right;"
                    ></b-pagination>

                    <p class="mt-3">Current Page: {{ currentPage }}</p>

                <b-table
                id="my-table"
                :items="items"
                :per-page="perPage"
                :current-page="currentPage"
                small
                ></b-table>
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
            items: [ ]
        }
    },
    mounted(){
        this.retrieveData();
    },
    computed: {
      rows() {
        return this.items.length
      }
    },
    methods: {
        retrieveData(){
            axios.get('/tuts/expenses')
            .then((resp) => { 
                this.items = resp.data;
            })
            .catch(errors => { console.error(errors); });;
        }
    }, 
}
</script>
