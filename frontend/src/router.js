import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'loading',
    component: () => import('./pages/Loading.vue')
  },
  {
    path: '/home',
    name: 'home',
    component: () => import('./pages/Home.vue')
  },
  {
    path: '/transition',
    name: 'transition',
    component: () => import('./pages/Transition.vue')
  },
  {
    path: '/profile',
    name: 'profile',
    component: () => import('./pages/Profile.vue')
  },
  {
    path: '/date',
    name: 'date',
    component: () => import('./pages/Date.vue')
  },
  {
    path: '/campus',
    name: 'campus',
    component: () => import('./pages/Campus.vue')
  },
  {
    path: '/moment',
    name: 'moment',
    component: () => import('./pages/Moment.vue')
  },
  {
    path: '/summary',
    name: 'summary',
    component: () => import('./pages/Summary.vue')
  },
  {
    path: '*',
    name: 'forbidden',
    component: () => import('./pages/Forbidden.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  routes
})

router.beforeEach((to, from, next) => {
  if (process.env.NODE_ENV === 'production') {
    if (!['loading', 'home', 'forbidden'].includes(to.name) && !to.params.router) {
      next('/forbidden')
    } else {
      next()
    }
  } else {
    next()
  }
})

export default router
