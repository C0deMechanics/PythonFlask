<template>
    <b-container fluid>
        <b-row>
            <b-col>
                <b-jumbotron bg-variant="info" text-variant="white" border-variant="dark">
                    <template #header>UIBuilder Tutorial</template>

                    <template #lead>
                    This is a simple hero unit, a simple jumbotron-style component for calling extra attention to
                    featured content or information.
                    </template>
                    <hr class="my-4">
                    <p>
                        It uses utility classes for typography and spacing to space content out within the larger
                        container.
                    </p>
                 </b-jumbotron>
            </b-col>
        </b-row>
    </b-container>
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
