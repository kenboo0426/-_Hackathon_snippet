<template>
    <Header></Header>
    <main>
    <section>
        <h4 class="uname fw-bold">{{$store.state.loginUser.name}}さんのページ</h4>
        <!-- coming soooooooooooon!
        <div>
            <h2>お気に入りのスニペット</h2>
            <ul>
                <li v-for="snippet in snippets" :key="snippet.id">
                    <div key="snippet.id">
                        <router-link>{{snippet.title}}</router-link>
                    </div>
                </li>
            </ul>
        </div>
        -->
        <div class="mt-3">
            <router-link class="btn btn-info" to="/create">スニペットを作る</router-link>
        </div>
    </section>
    </main>
    <Footer></Footer>
</template>

<script>
import Header from '../components/Header.vue'
import Footer from '../components/Footer.vue'

export default {
    name: 'MyPage',
    components: {
        Header,
        Footer,
    },
    data() {
        return {
            snippets: []
        }
    }
}
</script>

<style>
    .uname {
        color: blueviolet;
    }
</style>