<template>
  <div id="app">
    <daoNav></daoNav>
    <router-view class="content-box"/>
    <pageFooter></pageFooter>
  </div>
</template>

<script>

import pageFooter from "./components/pageFooter";
import daoNav from "./components/pageNav";

export default {
  name: 'App',
  components: {
    daoNav,
    pageFooter
  }
}
</script>

<style lang="scss">
#app {
  overflow: auto;
  background-size: 100% 100%;

  .content-box {
    width: 1200px;
    min-height: calc(100vh - 200px);
    border-radius: 20px;
    margin: -100px auto 30px;
    position: relative;
    z-index: 1;
  }
  .no-data{
    display: flex;
    justify-content: center;
    img{
      width: 300px;
    }
  }
  .nodata {
    text-align: center;
    padding: 50px;
    font-weight: bold;
    font-size: 26px;

    .rainbow-button {
      margin: 10px auto;
      width: 200px;
      height: 50px;
    }
  }
  .rainbow-single-list{
    .list-header{
      padding: 0 20px;

      width: 100%;
      height: 50px;
      background: #f7f3ff;
      border-radius: 10px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      .item{
        padding: 0 10px;
        font-size: 16px;
        font-weight: 500;
        color: #891e99;
        line-height: 19px;
      }
    }
    .list-content{
      padding: 0 20px 30px;

      width: 100%;
      border-radius: 10px;
      .list-item{
        padding: 20px 10px;
        font-size: 16px;
        font-weight: 500;
        line-height: 19px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        text-align: center;
      }
    }
  }
  .rainbow-panel {
    padding: 60px;
    background: #ffffff;
    border-radius: 8px;
    box-shadow: 0px 20px 20px 3px rgba(156, 156, 156, 0.10);
  }
  .panel-title {
    font-size: 34px;
    font-weight: 700;
    color: #333333;
    line-height: 30px;
    padding-bottom: 20px;
  }
  .input-box,.input-box-full,.radio-box{
    width: 50%;
    .name{
      padding: 10px 0;
    }
    input{
      width: 310px;
      height: 50px;
      background: #f6f5fa;
      border: 1px solid #eaeaea;
      border-radius: 10px;
      padding: 0 10px;
    }
    .input-detail{
      padding: 10px 0;
      color: #bcbcbc;
    }
  }
  .select-box{
    width: 100%;
    .select-title{
      font-size: 16px;
      font-weight: bold;
      text-align: left;
      color: #333333;
      line-height: 50px;
    }
    select {
      appearance: none;
      border: 0;
      outline: 0;
      font: inherit;
      /* Personalize */
      height: 3em;
      padding: 0 4em 0 1em;
      background: #f6f5fa;
      color: #333!important;
      border-radius: 0.25em;
      cursor: pointer;
      /* <option> colors */
      option {
        color: inherit;
        background-color: #fff;
      }

      /* Remove focus outline */
      &:focus {
        outline: none;
      }

      /* Remove IE arrow */
      &::-ms-expand {
        display: none;
      }
    }
  }
  .sub-title-box {
    display: flex;
    align-items: center;
    margin: 10px 0;

    .sub-icon {
      width: 20px;
      height: 20px;
    }

    .name {
      color: #333333;
      margin: 0 10px;
      font-size: 16px;
    }

    .number {
      padding: 6px 16px;
      background: #f4dcf2;
      border: 1px solid rgba(255, 31, 132, 0.30);
      border-radius: 5px;
      color: #f96aaf;
    }
  }

  ::v-deep .rainbow-dialog-box {
    position: fixed;
    width: 100vw;
    height: 100vh;
    top: 0;
    z-index: 101;
    display: flex;
    justify-content: center;
    align-items: center;

    .mask {
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.50);
    }

    .rainbow-dialog {
      position: absolute;
      z-index: 102;
      background: #fff;
      border-radius: 20px;
      padding: 40px;
    }
  }
}

.rainbow-dialog-box {
  position: fixed;
  width: 100vw;
  height: 100vh;
  top: 0;
  left: 0;
  z-index: 101;
  display: flex;
  justify-content: center;
  align-items: center;

  .mask {
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.50);
  }

  .rainbow-dialog {
    position: absolute;
    z-index: 102;
    background: #fff;
    border-radius: 20px;
    padding: 40px;
  }
}
</style>
