<template>
    <Header></Header>
    <!-- create page -->
    <main>
    <section>
        <h4 class="fw-bold sni">スニペットを作る</h4>
        <div class="md-3 mt-3">
            <label for="title" class="form-label fw-bold">Title</label>
            <input type="text" id="title" class="form-control form-control-lg" v-model="title">
        </div>
        <div class="md-3 mt-3">
            <label for="content" class="form-label fw-bold">Content</label>
            <textarea id="content" cols="30" rows="10" class="form-control form-control-lg" v-model="content"></textarea>
        </div>
        <button class="btn btn-outline-success fw-bold mt-3"  @click="createItem">作成</button>
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

<style>
    .sni {
        color: blueviolet;
    }
</style>