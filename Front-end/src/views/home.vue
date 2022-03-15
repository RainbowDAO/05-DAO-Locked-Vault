<template>
  <div class="home rainbow-panel">
    <div class="panel-title">
      Vault
      <div class="rainbow-button" @click="$router.push({name:'lockVault'})">
        CREATE
      </div>
    </div>
    <div class="sub-title-box">
      <div class="sub-icon">
        <img src="../assets/sub-icon.png" alt="">
      </div>
      <div class="name">
        My Vaults
      </div>
      <div class="number">
        {{ vaultArr.length }}
      </div>
    </div>
    <vaultList :vault-list="vaultArr" @chooseItem="toDetail"></vaultList>
    <div class="sub-title-box">
      <img class="sub-icon" src="../assets/sub-icon.png" alt="">

      <div class="name">
        All Vaults
      </div>
      <div class="number">
        {{ vaultArr.length }}
      </div>
    </div>
    <vaultList :vault-list="vaultArr"></vaultList>
  </div>
</template>

<script>
import vaultList from "../components/vaultList";
import {mapGetters} from "vuex";
export default {
  name: "home",
  components:{
    vaultList
  },
  data(){
    return{
      vaultArr:[]
    }
  },
  computed: {
    ...mapGetters([
      'isConnected',
      'account'
    ]),
  },
  watch: {
    isConnected() {
      this.getData()
    },
  },
  created() {
    this.getData()
  },
  methods:{
    getData(){
      if(this.isConnected){
        this.list2()
      }
    },

    list2(){
      this.$store.dispatch("vault/index").then(index=>{
        for (let i=0;i<index;i++){
          this.$store.dispatch("vault/list2",{param0:i}).then(res=>{
            console.log(res)
            this.vaultArr.push(res)
          })
        }

      })

    },
    toDetail(params){
      this.$router.push({name:"vaultInfo",params: {factoryInfo:params}})
    },
  }
}
</script>

<style lang="scss" scoped>
.home{
  .panel-title {
    display: flex;
    justify-content: space-between;
    .rainbow-button {
      width: 100px;
      height: 46px;
    }
  }
}
</style>
