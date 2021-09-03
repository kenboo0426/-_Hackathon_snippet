<template>
    <Header></Header>
    <main>
    <section>
        <div>
            <label for="username">ユーザーネーム</label>
            <input type="text" id="username" v-model="username">
        </div>
        <div>
            <label for="password">パスワード</label>
            <input type="password" id="password" v-model="password">
        </div>
        <div>
            <button @click="login">ログイン</button>
        </div>
    </section>
    </main>
    <Footer></Footer>
</template>

<script>
import Header from '../components/Header.vue'
import Footer from '../componentsFooter.vue'

export default {
    name: 'LoginPage',
    components: {
        Header,
        Footer,
    },
    data() {
        return {
            username: "",
            email: "",
            password: "",
        }
    },
    methods: {
        login() {
            this.$store.dispatch('login',{"username":this.username,"email":this.email,"password":this.password})
            this.$router.push('/')
        }
    }
}
</script>