<template>
    <Header></Header>
    <main>
        <!-- search snippets -->
        <section>
            <input type="text" v-model="keywords">
            <button @click="searchItems">検索</button>
        </section>

        <!-- snippets list -->
        <section v-if="flag">
            <h2 v-if="$store.state.snippets">検索結果</h2>
            <h2 v-else>一致する検索結果はありませんでした。</h2>
            <ul>
                <li v-for="snippet in $store.state.snippets" :key="snippet.id">
                    <div key="snippet.id">
                        <router-link :to="{name:'detail', params:{id:snippet.id}}">{{snippet.title}}</router-link>
                    </div>
                </li>
            </ul>
        </section>
        
    </main>
    <Footer></Footer>
</template>

<script>
import Header from '../components/Header.vue'
import Footer from '../components/Footer.vue'

export default {
    name: 'TopPage',
    components: {
        Header,
        Footer,
    },
    data() {
        return {
            keywords: "",
            flag: false
        }
    },
    methods: {
        searchItems() {
            let array = this.keywords.split(' ')
            let params = '/?q='
            params += array.join('+')
            this.$store.commit({type:'getItems', params:params})
            this.flag = true
        },
    }

}
</script>