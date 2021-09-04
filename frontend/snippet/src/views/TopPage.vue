<template>
    <Header></Header>
    <main>
        <!-- search snippets -->
        <section class="mt-20">
            <label for="search" class="form-label fw-bold fs-4">スニペットを探す</label>
            <input id="search" type="text" class="form-control form-control-lg" v-model="keywords">
            <button type="button" class="btn btn-outline-success fw-bold mt-3" @click="searchItems">検索</button>
        </section>

        <!-- snippets list -->
        <section v-if="flag">
            <p v-if="$store.state.snippets">検索結果</p>
            <p v-else>一致する検索結果はありませんでした。</p>
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

<style>
    label {
        color: blueviolet;
    }
</style>