<template>
    <Header></Header>
    <main>
    <section>
        <div class="mb-3">
            <label for="email" class="form-label fw-bold">メールアドレス</label>
            <input class="form-control" type="text" id="email" v-model="email">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label fw-bold">パスワード</label>
            <input class="form-control" type="password" id="password" v-model="password">
        </div>
        <div>
            <button @click="login" type="button" class="btn btn-outline-success fw-bold">ログイン</button>
        </div>
    </section>
    </main>
    <Footer></Footer>
</template>

<script>
import Header from '../components/Header.vue'
import Footer from '../components/Footer.vue'

export default {
    name: 'LoginPage',
    components: {
        Header,
        Footer,
    },
    data() {
        return {
            email: "",
            password: "",
        }
    },
    methods: {
        login() {
            this.$store.dispatch('login',{"email":this.email,"password":this.password})
            this.$router.push('/')
        }
    }
}
</script>

<style>
    section {
        width: 20%;
        margin: 20px 40%;
    }
</style>