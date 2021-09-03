<template>
    <header>
        <router-link>Happy Snippets</router-link>
        <nav>
            <ul v-if="$store.state.isAuthenticated">
                <li><router-link>MyPage</router-link></li>
                <li><router-link>Logout</router-link></li>
            </ul>

            <ul v-else>
                <li><router-link>SignUp</router-link></li>
                <li><router-link>Login</router-link></li>
            </ul>
        </nav>
    </header>
</template>

<script>
export default {
    name: 'Header',
    data() {
        return {
            
        }
    },
}
</script>