import { createStore } from 'vuex'
import api from './services/api'

export const store = createStore({
    state() {
        return {
            isAuthenticated: false,
            loginUser: null,
            snippet: null,
            snippets: [],
        }
    },
    mutations: {
        //Auth
        getUserInfo: (state, id)=> {
            api.get('users/'+id+'/').then((response)=> { 
                state.loginUser = response.data
                state.isAuthenticated = true
                console.log("getUserInfo() "+state.loginUser)
            }).catch((error)=> {
                console.log(error)
            })
        },
        resetUserInfo: (state)=> {
            state.loginUser = null
            state.isAuthenticated = false
        },
        //Snippets
        getItems: (state, params)=> {
            api.get('posts/'+params).then((response)=> {
                console.log("getItems() ",JSON.stringify(response.data))
                snippets = response.data
            }).catch((error)=> {
                console.log(error)
            })
        },
        getItem: (state, id)=> {
            api.get('posts/'+id+'/').then((response)=> {
                console.log("getItem() ",JSON.stringify(response.data))
                snippet = response.data
            }).catch((error)=> {
                console.log(error)
            })
        },
        flash: (state)=> {
            state.snippet = null
        }
    },
    actions: {
        //Auth
        login: (context, obj)=> {
            api.post('sessions/',{  //please replace appropriate url
                'email': obj.email,
                'password': obj.password,
            }).then((response)=> {
                //set JWToken in local storage
                localStorage.setItem('access', response.data.access)
                console.log("set JWT: "+response.data.access)
                context.commit({type:'getUserInfo',id:response.data.user_id})
                console.log("LOGIN successful!")
            }).catch((error)=> {
                console.log(error)
            })
        },
        logout: (context)=> {
            //remove JWToken
            localStorage.removeItem('access')
            //reset user info
            context.commit('resetUserInfo')
            console.log("LOGOUT successful!")
        },
        //Snippets
        create: (context, obj)=> {
            api.post('users/',{
                "title": obj.title,
                "content":obj.content,
                "user_id":obj.user_id
            }).then((response)=> {
                console.log("create() ",JSON.stringify(response.data))
            }).catch((error)=> {
                console.log(error)
            })
        },
        update: (context, obj)=> {
            api.post('posts/'+obj.id,{
                "title": obj.title,
                "content":obj.content
            }).then((response)=> {
                console.log("update() ",JSON.stringify(response.data))
            }).catch((error)=> {
                console.log(error)
            })
        },
        delete: (context, id)=> {
            api.delete('posts/'+id+'/').then((response)=> {
                context.commit('flash')
                console.log("delete() ",JSON.stringify(response.data))
            }).catch((error)=> {
                console.log(error)
            })
        }
    },
})