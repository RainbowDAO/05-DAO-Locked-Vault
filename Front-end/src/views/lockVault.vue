<template>
  <div class="lockVault rainbow-panel">
    <div class="panel-title">
      Locked Vault System
    </div>
    <div class="sub-title">
      Create a lock-up vault
    </div>
    <div class="progress-box">
      <div class="item animate__animated animate__fadeIn" :class="{'active':activeIndex==0}">
        1
      </div>
      <div class="item animate__animated animate__fadeIn" :class="{'active':activeIndex==1}">
        2
      </div>
    </div>
    <div class="step1 animate__animated animate__fadeIn" v-show="activeIndex==0">
      <div class="sub-title">
        Locked Vault Parameters
      </div>
      <div class="value">
        Other addresses accidentally send coins to the vault address, and you must wait for the full unlock time to end
        before you can claim them
      </div>
      <div class="input-box">
        <div class="name">
          Vault Name
        </div>
        <input type="text" placeholder="Name" v-model="form._name">
      </div>
      <div class="input-box">
        <div class="name">
          Vault Logo
        </div>
        <input type="text" placeholder="Enter" v-model="form._logo">
      </div>
      <div class="input-box">
        <div class="name">
          Vault Intro
        </div>
        <input type="text" placeholder="Enter" v-model="form._intro">
      </div>
      <div class="input-box">
        <div class="name">
          Set a full closure time
        </div>
        <input type="text" placeholder="Enter" v-model="form.completeClosurePeriod">
      </div>
      <div class="value">
        During this time, no one can withdraw money
      </div>
      <div class="input-box">
        <div class="name">
          Monthly release ratio during release period
        </div>
        <input type="text" placeholder="Enter" v-model="form.monthlyReleaseRatio">
      </div>
      <div class="input-box">
        <div class="name">
          ReleasePeriod
        </div>
        <input type="text" placeholder="Enter" v-model="form.ReleasePeriod">
      </div>
      <div class="input-box">
        <div class="name">
          AlertPayDayRule
        </div>
        <input type="text" placeholder="Enter" v-model="form.AlertPayDayRule">
      </div>
      <!--      <div class="tip">-->
      <!--        <input type="checkbox"> The release period is 12 months, and the final full unlock time is 24 months-->
      <!--      </div>-->
      <!--      <div class="tip">-->
      <!--        Whether to choose to release by day every month (30 days)-->
      <!--        <div class="w-tip">-->
      <!--          The daily release ratio is 10%-->
      <!--        </div>-->
      <!--      </div>-->
      <div class="rainbow-button next-btn" @click="create">
        NEXT
      </div>
    </div>
    <div class="step2 animate__animated animate__fadeIn" v-show="activeIndex==1">
      <div class="sub-title">
        Designated recipient address
      </div>
      <div class="select-box">
        <div class="select-title">
          Receive settings
        </div>
        <select v-model="selectIndex" @change="getSelected">
          <option selected value="0"> To be collected by the depositor</option>
          <option value="1"> Depositor's Authorization to Claim</option>
        </select>
      </div>
      <div class="address-box" v-show="selectIndex==1">
        <div class="address-list">
          <div class="item">
            <div class="address">
              Address
            </div>
            <div class="ratio">
              Ratio
            </div>
          </div>
          <div class="item" v-for="i in recipientNumber" :key="i">
            <div class="address">
              <input type="text" v-model="recipientList[i-1].address">
            </div>
            <div class="ratio">
              <input type="text" v-model="recipientList[i-1].ratio">
            </div>
          </div>
          <div class="item">
            <div class="rainbow-button add-btn" @click="addAddr">
              ADD
            </div>
          </div>
        </div>
      </div>
      <div class="tip">
        <input type="checkbox">
        Whether the depositor can terminate the authorization to withdraw
      </div>
      <div class="value">
        After terminating the claim permission of an address, the unclaimed tokens cannot be claimed by the address! The
        withdrawal authority becomes the depositor itself, and can be withdrawn by the depositor after the full
        unlocking time is over
      </div>
      <div class="sub-title">
        Locked Vault Withdrawal
      </div>
      <p>
        The depositor or the authorized receiving address will receive the corresponding funds from the lock-up vault
        according to the lock-up agreement. And the payer pays a certain service fee
      </p>
      <div class="btn-box">
        <div class="rainbow-button next-btn" @click="activeIndex--">
          BACK
        </div>
        <div class="rainbow-button next-btn" @click="$router.push({name:'deposit'})">
          NEXT
        </div>
      </div>

    </div>
  </div>
</template>

<script>
export default {
  name: "lockVault",
  data() {
    return {
      recipientList: [{}],
      activeIndex: 0,
      selectIndex: 0,
      recipientNumber: 1,
      form: {}
    }
  },
  methods: {
    next() {
      this.activeIndex++
    },
    getSelected() {

    },
    async addAddr() {
      await this.addClaimer(this.recipientNumber - 1)
      this.recipientNumber++
      this.recipientList.push({})
    },
    cancelApprove() {
      this.$store.dispatch("vault/cancelApprove", {})
    },
    addClaimer(i) {
      // for (let i=0;i<this.recipientList.length;i++){
      // }
      this.$store.dispatch("vault/approves", {to: this.recipientList[i].address, rate: this.recipientList[i].ratio})
    },
    create() {
      this.$store.dispatch("vault/creatVault", {
        _name: this.form._name,
        _intro: this.form._intro,
        _logo: this.form._logo,
        completeClosurePeriod: this.form.completeClosurePeriod,
        ReleasePeriod: this.form.ReleasePeriod,
        monthlyReleaseRatio: this.form.monthlyReleaseRatio,
        AlertPayDayRule: this.form.AlertPayDayRule,
      }).then(() => {
        this.activeIndex++
      }).catch((err) => {
        alert(err)
      })
    },
  }
}
</script>

<style lang="scss" scoped>
.btn-box {
  display: flex;

  .rainbow-button {
    margin-right: 10px;
  }
}

.address-box {

  .address-list {
    .item {
      display: flex;
      padding: 10px 0;

      input {
        width: 100%;
        height: 50px;
        background: #f6f5fa;
        border: 1px solid #eaeaea;
        border-radius: 10px;
        padding: 0 10px;
      }

      .address {
        width: 446px;
      }

      .ratio {
        margin-left: 10px;
        width: 184px;
      }

      .add-btn {
        width: 60px;
        height: 36px;
      }
    }
  }
}

.next-btn {
  margin-top: 100px;
  width: 200px;
  height: 42px;
}

.tip {
  margin: 10px 0;

  .w-tip {
    color: #BCBCBC;
  }
}

p {
  width: 640px;
}

.sub-title {
  font-size: 24px;
  font-weight: 500;
  text-align: left;
  color: #333333;
  line-height: 38px;
}

.value {
  margin-top: 10px;
  width: 640px;
  padding: 8px 10px;
  background: rgba(255, 31, 132, 0.10);
  border-radius: 10px;
  line-height: 26px;
  color: #FF1F84;
}

.progress-box {
  display: flex;
  padding: 30px 0;

  .item {
    margin-right: 66px;
    position: relative;
    width: 30px;
    height: 30px;
    background: linear-gradient(135deg, #12c2e9, #c471ed 53%, #f64f59);
    -webkit-background-clip: text;
    color: transparent;
    border: 1px solid rgba(255, 31, 132, 0.20);
    border-radius: 50%;
    text-align: center;
    line-height: 30px;
    font-weight: bold;

    &:after {
      content: '';
      width: 60px;
      height: 1px;
      background: #FF1F84;
      position: absolute;
      top: 50%;
      left: 32px;
    }

    &.active {
      background: linear-gradient(135deg, #12c2e9, #c471ed 53%, #f64f59);
      color: #fff;
    }
  }

  .item:last-child {
    margin-right: 0;

    &:after {
      visibility: hidden;
    }
  }
}
</style>
