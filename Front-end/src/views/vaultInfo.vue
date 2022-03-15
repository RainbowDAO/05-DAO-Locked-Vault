<template>
<div class="vaultInfo">
    <pageHeaderInfo :daoInfo="vaultObj" @joinVault="joinVault"></pageHeaderInfo>
  <div class="rainbow-panel" style="margin-top: 20px">
    <div class="sub-title-box">
      <img class="sub-icon" src="../assets/sub-icon.png"/>
      <div class="name">
        VAULT FUNDS
      </div>
    </div>
    <div class="vault-balance">
      <div class="balance">
        {{ vaultObj.amount }}
      </div>
      <div style="display: flex">
        <div class="rainbow-button" @click="$router.push({name:'manager'})">
          MANAGER
        </div>
        <div style="margin-left: 20px" class="rainbow-button" @click="isShowDialog= true">
          WITHDRAW
        </div>
      </div>
    </div>
    <div class="sub-title-box">
      <img class="sub-icon" src="../assets/sub-icon.png"/>
      <div class="name">
        DEPOSIT INFO
      </div>
    </div>
    <div class="deposit-info-list">

      <div class="item">
        <div class="name">
          Creator's Address:
        </div>
        <div class="value">
          {{ vaultObj.user }}
        </div>
      </div>
      <div class="item">
        <div class="name">
          Deposit Amount：
        </div>
        <div class="value">
          {{ vaultObj.amount }}
        </div>
      </div>
      <div class="item">
        <div class="name">
          Vault Address：
        </div>
        <div class="value">
          {{ vaultObj.valutAddress }}
        </div>
      </div>
      <div class="item">
        <div class="name">
          Deposit Time：
        </div>
        <div class="value">
          {{ vaultInfo.AlertPayDayRule }} Months
        </div>
      </div>
      <div class="item">
        <div class="name">
          Full Closure Period：
        </div>
        <div class="value">
          {{ vaultInfo.ReleasePeriod }} Months
        </div>
      </div>
      <div class="item">
        <div class="name">
          Release Period:
        </div>
        <div class="value">
          {{ vaultInfo.completeClosurePeriod }} Months
        </div>
      </div>
      <div class="item">
        <div class="name">
          Full Unlock Period:
        </div>
        <div class="value">
          {{ vaultInfo.monthlyReleaseRatio }} Months
        </div>
      </div>
    </div>
    <div class="withdrawal-title">
      Withdrawal Records
    </div>
    <div class="rainbow-single-list">
      <div class="list-header">
        <div class="item">
          ID
        </div>
        <div class="item">
          Withdrawal address
        </div>
        <div class="item">
          Withdrawal time
        </div>
        <div class="item">
          Withdrawal amount
        </div>
      </div>
      <div class="list-content">
        <div class="list-item" v-for="(item,index) in withdrawalList" :key="index">
          <div class="id">
            {{index}}
          </div>
          <div class="owner">
            {{item.owner}}
          </div>
          <div class="amount">
            {{item.ttime}}
          </div>
          <div class="amount">
            {{item.amount}}
          </div>
        </div>
      </div>
      <div class="no-data" v-show="withdrawalList.length==0">
        <img src="../assets/no-data.png" alt="">
      </div>
    </div>
  </div>
  <div class="rainbow-dialog-box" v-show="isShowDialog">
    <div class="mask" @click="isShowDialog=false"></div>
    <div class="rainbow-dialog">
      <div class="dialog-title">
        Withdraw
      </div>
      <div class="input-box">
        <div class="name">
          Withdrawal Address
        </div>
        <input type="text" v-model="withdrawAddress">
      </div>
      <div class="input-box">
        <div class="name">
          Extractable quantity
        </div>
        <div class="input-box">
          {{ vaultObj.amount }}
        </div>
      </div>
      <div class="input-box">
        <div class="name">
          Extract quantity
        </div>
        <div class="right">
          <input type="text" placeholder="Enter" v-model="amount">
          <div class="rainbow-button">
            ALL
          </div>
        </div>
      </div>
      <div class="rainbow-button withdraw-btn" @click="withdraw">
        WITHDRAW
      </div>
    </div>
  </div>
</div>
</template>

<script>
import {mapGetters} from "vuex";
import moment from "moment"
export default {
  name: "vaultInfo",
  data(){
    return{
      amount:0,
      withdrawAddress:"",
      isShowDialog:false,
      vaultBalance:0,
      daoInfo:{},
      withdrawalList:[],
      vaultInfo:{},
      vaultObj:{}
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
      this.getInfo()
    },

  },
  created() {
    if(this.$route.params){
      this.vaultObj = this.$route.params.factoryInfo
    }
    console.log(this.vaultObj)
    this.getInfo()
  },
  methods:{
    list(){
      this.$store.dispatch("vault/index1").then(index=>{
        for (let i=0;i<index;i++){
          this.$store.dispatch("vault/list",{param0:i}).then(res=>{
            res.ttime = moment( parseInt(res.time)*1000).format('MMMM Do YYYY, h:mm:ss a');
            this.withdrawalList.push(res)
          })
        }
      })
    },
    withdraw(){
      this.vaultObj.rbd = "0x8408d82B9A7FB70F314A85ba444b0e0ECeCe482E"
      this.$store.dispatch("vault/withdraw", {rbd:this.vaultObj.rbd, to:this.withdrawAddress, amount:this.amount, number:1}).then(()=>{
        this.getInfo()
        this.isShowDialog=false
      })
    },
    getInfo(){
      this.$store.dispatch("vault/getAlertPayRule").then(res=>{
        this.vaultInfo = res
        console.log(res)
      })
      this.list()
    },
    joinVault(){

    }
  }
}
</script>

<style lang="scss" scoped>
.rainbow-dialog{
  .dialog-title{
    font-size: 26px;
    font-weight: 700;
    color: #333333;
    padding-bottom: 20px;
  }
  .value{
    width: 640px;
    height: 38px;
    background: #f6f5fa;
    border: 1px solid #eaeaea;
    border-radius: 10px;
    color: #FF1F84;
    line-height: 38px;
    padding: 0 10px;
    margin-top: 10px;
  }
  .input-box{
    width: 100% !important;
    padding: 10px 0;
    display: flex;
    align-items: center;
    justify-content: space-between;
    .name{

    }
    .right{
      display: flex;
      .rainbow-button{
        width: 60px;
      }
    }
  }
  .withdraw-btn{
    margin: 60px auto 0;
    width: 300px;
    height: 50px;
  }
}
.withdrawal-title{
  font-size: 24px;
  font-weight: 700;
  color: #333333;
  line-height: 60px;
}

.vaultInfo{
  .vault-balance{
    padding: 10px 0;
    display: flex;
    justify-content: space-between;
    .balance{
      font-size: 30px;
      font-weight: 700;
      text-align: left;
      color: #ec1676;
      line-height: 35px;
    }
    .rainbow-button{
      width: 120px;
    }
  }
  .deposit-info-list{
    padding: 20px 0;
    .item{
      display: flex;
      margin-top: 10px;
      align-items: center;
      .name{
        min-width: 160px;
      }
      .value{
        width: 430px;
        height: 34px;
        padding: 0 10px;
        background: #f6f5fa;
        border-radius: 10px;
        color: #F96AAF;
        line-height: 34px;


      }
    }
  }
}
</style>
