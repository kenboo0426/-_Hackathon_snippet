import { createRouter, createWebHistory } from "vue-router"
import store from './store'
import TopPage from './views/TopPage.vue'
import DetailPage from './views/DetailPage.vue'
import EditPage from './views/EditPage.vue'
import CreatePage from './views/CreatePage.vue'
import MyPage from './views/MyPage.vue'
import LoginPage from './views/LoginPage.vue'
import SignupPage from './views/SignupPage.vue'

export const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
        path: '/',
        redirect: '/top',
    },
    {
        path: '/top',
        name: 'top',
        component: TopPage,
    },
    {
        path: '/mypage',
        name: 'mypage',
        component: MyPage,
        meta: {requiresAuth: true},
    },
    {
        path: '/detail/:id',
        name: 'detail',
        component: DetailPage,
        props: true,
    },
    {
        path: '/edit/:id',
        name: 'edit',
        component: EditPage,
        props: true,
        meta: {requiresAuth: true},
    },
    {
        path: '/create',
        name: 'create',
        component: CreatePage,
        meta: {requiresAuth: true},
    },
    {
        path: '/login',
        name: 'login',
        component: LoginPage,
    },
    {
        path: '/signup',
        name: 'signup',
        component: SignupPage,
    }
  ],
})

router.beforeEach((to, from) => {
    const isLoggedIn = store.state.isAuthenticated
    console.log("to.path=",to.path)
    console.log("isLoggedIn=",isLoggedIn)

    if (to.meta.requiresAuth && !isLoggedIn) {
        console.log("you need login. redirect to login page")
        //redirect to login page
        return {
            path: '/login',
            // save the location we were at to come back later
            query: { redirect: to.fullPath },
        }
    }
})