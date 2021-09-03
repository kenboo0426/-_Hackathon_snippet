<template>
    <Header></Header>
    <!-- edit page -->
    <main>
    <section>
        <h2>編集ページ</h2>
        <div>
            <label for="title">Title</label>
            <input type="text" id="title" v-model="title">
        </div>
        <div>
            <label for="content">Content</label>
            <textarea id="content" cols="30" rows="10" v-model="content"></textarea>
        </div>
        <button @click="updateItem">更新</button>
        <button @click="deleteItem">削除</button>
    </section>
    </main>
    <Footer></Footer>
</template>

<script>
import Footer from '../components/Footer.vue'
import Header from '../components/Header.vue'
import Footer from '../componentsFooter.vue'

export default {
    name: 'EditPage',
    components: {
        Header,
        Footer,
        Footer,
    },
    props: {
        id: Number
    },
    data() {
        return {
            title: "",
            content: "",
        }
    },
    methods: {
        updateItem() {
            this.$store.dispatch('update',{"id":this.id, "title":this.title, "content":this.content})
            this.$router.push({name:'detail', params:{id:this.id}})
        },
        deleteItem() {
            this.$store.dispatch('delete', this.id)
            this.$router.push('/')
        }
    },
    created() {
        this.$store.commit({type:'getItem', id:this.id})
        if (this.$store.state.loginUser != this.state.snippet.user) {
            this.$router.push('/login')
        }
        this.title = this.$store.state.snippet.title
        this.content = this.$store.state.snippet.content
    }
}
</script>