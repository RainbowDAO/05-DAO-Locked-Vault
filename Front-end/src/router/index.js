import Vue from 'vue'
import VueRouter from 'vue-router'


Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        name:"home",
        component: () => import('@/views/home'),
    },
    {
        path: '/deposit',
        name:"deposit",
        component: () => import('@/views/deposit'),
    },
    {
        path: '/lockVault',
        name:"lockVault",
        component: () => import('@/views/lockVault'),
    },
    {
        path: '/manager',
        name:"manager",
        component: () => import('@/views/manager'),
    },
    {
        path: '/vaultInfo',
        name:"vaultInfo",
        component: () => import('@/views/vaultInfo'),
    },
]
const router = new VueRouter({
    routes
})

export default router
