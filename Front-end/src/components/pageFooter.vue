<template>
  <div class="page-footer">
    <div class="page-footer-part3">
      Copyright@2021 www.rainbowdao.io
    </div>
  </div>
</template>

<script>
export default {
  name: "pageFooter",
  methods:{

  }
}
</script>

<style lang="scss" scoped>

.page-footer {
  box-sizing: border-box;
  display: flex;
  align-items: center;
  justify-content: space-between;
  background-size: 100%  100%;
  padding: 20px 100px;
  .page-footer-part2 {
    width: 200px;
    display: flex;
    justify-content: space-between;

    .icon-box {
      cursor: pointer;
      width: 30px;
      height: 30px;
      background: rgba(255,255,255,0.12);
      border-radius: 50%;
      display: flex;
      justify-content: center;
      align-items: center;
      position: relative;
      padding: 10px;

      .icon path{
        fill: white!important;
      }
      &:hover .icon path{
        fill: #10101B!important;
      }
      span {
        width: 0%;
        transition: 0.3s;
        height: 0%;
        border-radius: 50%;
        position: absolute;
        margin: 3px;
        background: white;
      }

      &:hover span {
        width: 100%;
        height: 100%;
        margin: 0px;
      }
      .icon {
        -webkit-transition: all 0.3s;
        -moz-transition: all 0.3s;
        -o-transition: all 0.3s;
        transition: all 0.3s;
        width: 18px;
        height: 18px;
        position: relative;
      }

    }
  }

  .page-footer-part3 {
    width: 100%;
    color: #A681BA;
    text-align: center;
  }
}
</style>
