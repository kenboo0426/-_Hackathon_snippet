<template>
    <Header></Header>
    <!-- detail page -->
    <main>
    <section>
        <h1>{{$store.state.snippet.title}}</h1>
        <p>{{$store.state.snippet.content}}</p>
        <p>{{$store.state.snippet.user}}</p>
        <p>{{$store.state.snippet.created_at}}</p>
        <button v-if="$store.state.loginUser == $store.state.snippet.user" @click="editItem">Edit</button>
    </section>
    </main>
    
    <Footer></Footer>
</template>

<script>
import Header from '../components/Header.vue'
import Footer from '../components/Footer.vue'

export default {
    name: 'DetailPage',
    components: {
        Header,
        Footer,
    },
    props: {
        id: Number
    },
    data() {
        return {
        }
    },
    methods: {
        editItem() {
            this.$router.push({name: 'edit', params:{id:this.id}})
        }
    },
    created() {
        this.$store.commit({type:'getItem', id:this.id})
    }
}
</script>