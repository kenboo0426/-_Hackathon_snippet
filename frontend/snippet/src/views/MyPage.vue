<template>
    <Header></Header>
    <main>
    <section>
        <h1>マイページ</h1>
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
        <div>
            <router-link>スニペットを作る</router-link>
        </div>
    </section>
    </main>
    <Header></Header>
</template>

<script>
import Header from '../components/Header.vue'
import Footer from '../componentsFooter.vue'

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