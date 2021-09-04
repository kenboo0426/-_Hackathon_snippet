<template>
    <Header></Header>
    <!-- create page -->
    <main>
    <section>
        <h2>新規作成</h2>
        <div>
            <label for="title">Title</label>
            <input type="text" id="title" v-model="title">
        </div>
        <div>
            <label for="content">Content</label>
            <textarea id="content" cols="30" rows="10" v-model="content"></textarea>
        </div>
        <button @click="createItem">作成</button>
    </section>
    </main>
    <Footer></Footer>
</template>

<script>
import Header from '../components/Header.vue'
import Footer from '../components/Footer.vue'

export default {
    name: 'CreatePage',
    components: {
        Header,
        Footer,
    },
    data() {
        return{
            title: "",
            content: "", 
            user_id: "",
        }
    },
    methods: {
        createItem() {
            this.$store.dispatch('create',{"title":this.title, "content":this.content, "user_id":this.user_id})
            this.$router.push('/')
        }
    },
    created() {
        this.user_id = this.$store.state.loginUser.id
    }
}
</script>