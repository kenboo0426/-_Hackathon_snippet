<template>
  <router-view></router-view>
</template>

<script>
import DetailPage from './views/DetailPage.vue'
import EditPage from './views/EditPage.vue'
import CreatePage from './views/CreatePage.vue'
import MyPage from './views/MyPage.vue'
import LoginPage from './views/LoginPage.vue'
import SignupPage from './views/SignupPage.vue'
import Header from './components/Header.vue'
import Footer from './components/Footer.vue'

export default {
  name: 'App',
  components: {
    DetailPage,
    EditPage,
    CreatePage,
    MyPage,
    LoginPage,
    SignupPage,
    Header,
    Footer
  }
}
</script>
