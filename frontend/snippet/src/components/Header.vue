<template>
    <header>
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <h2 class="navbar-brand"><router-link class="nav-link active fs-2 fw-bold" to="/">Happy Snippets</router-link></h2>
                <ul class="navbar-nav" v-if="$store.state.isAuthenticated">
                    <li class="nav-item"><router-link class="nav-link active fw-bold fs-5" to="/mypage">MyPage</router-link></li>
                    <li class="nav-item"><router-link class="nav-link active fw-bold fs-5" to="/" @click="logout">Logout</router-link></li>
                </ul>

                <ul class="navbar-nav" v-else>
                    <li class="nav-item"><router-link class="nav-link active fw-bold fs-5" to="/signup">SignUp</router-link></li>
                    <li class="nav-item"><router-link class="nav-link active fw-bold fs-5" to="/login">Login</router-link></li>
                </ul>
            </div>
            
        </nav>
    </header>
</template>

<script>
export default {
    name: 'Header',
    methods: {
        logout() {
            this.$store.dispatch('logout')
        }
    }
}
</script>
<style>
    header {
        background-color: rgb(181, 142, 218);
    }
</style>