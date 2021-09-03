<template>
    <Header></Header>
    <main>
    <section>
        <div>
            <label for="username">ユーザーネーム</label>
            <input type="text" id="username" v-model="username">
        </div>
        <div>
            <label for="email">メールアドレス</label>
            <input type="email" id="email" v-model="email">
        </div>
        <div>
            <label for="password">パスワード</label>
            <input type="password" id="password" v-model="password">
        </div>
        <div>
            <button @click="signUp">サインアップ</button>
        </div>
    </section>
    </main>
    <Footer></Footer>
</template>

<script>
import Header from '../components/Header.vue'
import Footer from '../componentsFooter.vue'

export default {
    name: 'SignupPage',
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
        signUp() {
            
        }
    }
}
</script>