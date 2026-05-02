<template>
    <b-row>
        <b-col cols="8">
             <b-modal id="modal-sm" centered  size="sm" title="Submit Clicked">
                Sample Modal
             </b-modal>
            <b-card bg-variant="light" style="margin-top:5%;"> 
                    <b-form-group label-cols-lg="3"
                                  label="Shipping Address"
                                  label-size="lg"
                                  label-class="font-weight-bold pt-0"
                                  class="mb-0">

                    <b-form-group label="Street:"
                                  label-for="nested-street"
                                  label-cols-sm="3"
                                  label-align-sm="right"
                    >
                        <b-form-input id="nested-street"></b-form-input>
                    </b-form-group>

                    <b-form-group
                        label="City:"
                        label-for="nested-city"
                        label-cols-sm="3"
                        label-align-sm="right"
                    >
                        <b-form-input id="nested-city"></b-form-input>
                    </b-form-group>

                    <b-form-group
                        label="State:"
                        label-for="nested-state"
                        label-cols-sm="3"
                        label-align-sm="right"
                    >
                        <b-form-input id="nested-state"></b-form-input>
                    </b-form-group>

                    <b-form-group
                        label="Country:"
                        label-for="nested-country"
                        label-cols-sm="3"
                        label-align-sm="right"
                    >
                        <b-form-input id="nested-country"></b-form-input>
                    </b-form-group>

                    <b-form-group
                        label="Ship via:"
                        label-cols-sm="3"
                        label-align-sm="right"
                        class="mb-0"
                        v-slot="{ ariaDescribedby }"
                    >
                        <b-form-radio-group
                        class="pt-2"
                        :options="['Air', 'Courier', 'Mail']"
                        :aria-describedby="ariaDescribedby"
                        ></b-form-radio-group>
                    </b-form-group>
                </b-form-group>
                    <input type="submit"  v-b-modal.modal-sm style="float:right;" class="btn btn-info">
            </b-card>
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
