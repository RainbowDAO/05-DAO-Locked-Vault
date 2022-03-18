<template>
  <div class="deposit rainbow-panel">
    <div class="panel-title">
      Deposit tokens
    </div>
    <div class="input-box">
      <div class="name">
        Deposit Address
      </div>
      <div class="value-box">
        {{ depositAddr }}
      </div>
    </div>
    <div class="balance-box">
      <div class="name">COIN Address</div>
      <div class="value">
        <input @input="getBalance" type="text" placeholder="address" v-model="coinAddress">
      </div>
    </div>
    <div class="balance-box">
      <div class="name">Balance</div>
      <div class="value-box" style="width: 130px">
        {{ balance }}
      </div>
    </div>
    <div class="deposit-box">
      <div class="name">
        Deposit Amount
      </div>
      <div class="value">
        <input type="text" placeholder="Enter" v-model="form.amount">
        <div class="rainbow-button">
          ALL
        </div>
      </div>
    </div>
    <div class="service-fee">
      <div class="name">
        Service Fees:
      </div>
      <div class="value">
        <div class="number">
          0.02 ETH
        </div>
      </div>
    </div>
    <div class="deposit-btn rainbow-button" @click="deposit">
      DEPOSIT
    </div>
    <div class="deposit-btn rainbow-button" @click="$router.push({name:'home'})">
      Back Home
    </div>
  </div>
</template>

<script>
import {mapGetters} from "vuex"
import abiUtil from "../abi/index"
export default {
  name: "deposit",
  data() {
    return {
      depositAddr:"",
      coinAddress:"",
      valutAddress: "",
      form: {},
      balance: 0
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
    this.depositAddr = abiUtil.getContractAddress("vault")
  },
  methods: {
    deposit(){
      this.$store.dispatch("vault/deposit",{rbd:this.coinAddress, amount:this.form.amount}).then(res=>{
        console.log(res)
      })
    },
    getBalance(){
      try{
        if(this.coinAddress)
        this.$store.dispatch("erc20/balanceOf",{account:this.account, coinAddress:this.coinAddress}).then(res=>{
          this.balance = res
        })
      }catch (e){
        console.log(e)
      }
    },
    getData() {
      if (this.isConnected) {
        this.$store.dispatch("vault/list2", {param0: 0}).then(res => {
          console.log(res)
          this.valutAddress = res.valutAddress
        })
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.deposit-box {
  input {
    width: 190px !important;
  }
}
.value-box{
  width: 400px;
  height: 36px;
  background: #f6f5fa;
  line-height: 36px;
  border: 1px solid #eaeaea;
  border-radius: 10px;
  text-align: center;
}
.balance-box, .deposit-box, .service-fee {
  display: flex;
  width: 500px;
  align-items: center;
  justify-content: space-between;
  padding: 20px 0;

  .name {
    font-size: 14px;
    font-weight: 400;
    text-align: left;
    color: #333333;
    line-height: 16px;
  }

  .value {
    display: flex;

    input {
      width: 276px;
      height: 36px;
      background: #f6f5fa;
      border: 1px solid #eaeaea;
      border-radius: 10px;
      text-align: center;
      color: #999999;
      line-height: 36px;
    }

    .rainbow-button {
      width: 90px;
      margin-left: 10px;
    }
  }

}

.deposit-btn {
  margin-top: 100px;
  width: 160px !important;
  height: 38px;
}
</style>
