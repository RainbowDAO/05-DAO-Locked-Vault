<template>
  <div class="manager rainbow-panel">
    <div class="panel-title" style="display: flex;justify-content: space-between">
      Manage
      <div class="rainbow-button" style="width: 120px;height: 32px">
        TERMINATION
      </div>
    </div>
    <div class="rainbow-single-list">
      <div class="list-header">
        <div class="item">
          ID
        </div>
        <div class="item">
          Authorized address
        </div>
        <div class="item">
          Proportion
        </div>
        <div class="item">
          pause
        </div>
<!--        <div class="item">-->
<!--          termination-->
<!--        </div>-->
      </div>
      <div class="list-content">
        <div class="list-item" v-for="(item,index) in manageList" :key="index">
          <div class="id">
            {{index}}
          </div>
          <div class="owner">
            {{item.owner}}
          </div>
          <div class="amount">
            {{item.proportion}}
          </div>
          <div class="pause">
            <div class="btn" @click="cancelApprove(item)" :class="{'isPause':item.pause}" style="width: 120px ;height: 36px">
              {{item.pause?"PAUSE":"RECOVER"}}
            </div>
          </div>
<!--          <div class="amount">-->
<!--            <div class="rainbow-button" style="width: 120px ;height: 36px">-->
<!--              TERMINATION-->
<!--            </div>-->
<!--          </div>-->
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import {mapGetters} from "vuex";
import moment from "moment";

export default {
  name: "manager",
  data(){
    return{
      manageList:[]
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
    cancelApprove(item) {
      console.log(item)
      this.$store.dispatch("vault/cancelApprove", {
        to:item.owner
      }).then(()=>{
        this.getData()
      })
    },
    termination(item){
      this.$store.dispatch("", {
        to:item.owner
      }).then(()=>{
        this.getData()
      })
    },
    getData(){
      this.$store.dispatch("vault/index2").then(index=>{
        this.manageList = []
        console.log(index)

        for (let i=0;i<index;i++){
          this.$store.dispatch("vault/list3",{param0:i}).then(res=>{
            res.ttime = moment( parseInt(res.time)*1000).format('MMMM Do YYYY, h:mm:ss a');
            console.log(res)
            this.manageList.push(res)
          })
        }
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.isPause{
  background: #a4ead4;
  border: 1px solid rgba(0,153,135,0.50);
  color: #009987;
}
.pause{

  .btn{
    width: 100px;
    height: 30px;
    background: #ffe8f2;
    border: 1px solid rgba(255,31,132,0.20);
    border-radius: 5px;
    opacity: 0.6;
    font-size: 12px;
    font-weight: 700;
    color: #ff1f84;
    line-height: 36px;
    text-align: center;
  }
}
</style>
