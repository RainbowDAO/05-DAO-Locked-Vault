import Vue from 'vue'
import App from './App.vue'
import store from './store'
import router from './router'
import "./style/index.scss"
import pageHeaderInfo from "./components/pageHeaderInfo";
Vue.config.productionTip = false
import 'animate.css';
Vue.component('pageHeaderInfo', pageHeaderInfo)
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
