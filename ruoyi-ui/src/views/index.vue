<template>
  <!-- 首页显示-->
  <div class="app-container div0 imgback1">
    <div>
      <!-- logo和文字放在同一个div里面 是一组   -->
<!--      <div class="indexdiv2">-->
<!--        <img src="../assets/images/shouyelogo.png" class="image2" />-->
<!--      </div>-->
      <div class="indexdiv1">
<!--        ==<span class="indexdiv1span1">欢迎使用XXX管理系统</span>==-->
      </div>
    </div>
    <!--<div class="huandiv">-->
    <!--  <el-carousel :interval="4000" type="card" height="460px">-->
    <!--    <el-carousel-item v-for="item in dataList" :key="item.id">-->
    <!--      <h3 class="medium">-->
    <!--        <el-image :src="item.src"class="huanimg" ></el-image>-->
    <!--      </h3>-->
    <!--    </el-carousel-item>-->
    <!--  </el-carousel>-->
    <!--</div>-->
  </div>
</template>

<script>
export default {
  name: "Index",
  data() {
    return {
      // 版本号
      version: "3.8.3",
      // dataList: [
      //   { id: 1, src: require("../assets/images/huandengpian/1.jpg") },
      //   { id: 2, src: require("../assets/images/huandengpian/2.jpg") },
      //   { id: 3, src: require("../assets/images/huandengpian/3.jpg") },
      //   { id: 4, src: require("../assets/images/huandengpian/4.jpg") },
      //   { id: 5, src: require("../assets/images/huandengpian/11.png") },
      //   { id: 6, src: require("../assets/images/huandengpian/12.png") },
      // ],
    };
  },
  methods: {
    //方法
  },
};
</script>

<style scoped lang="scss">
//设置div样式
.div0 {
  /****主idv****/
  height: 680px;
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
}
//标题div
.indexdiv1 {
  /****字体样式的div****/
  //居中 设置宽度大小和居中 是设置的div的居中
  margin: auto;
  margin-top:150px;
  margin-left:520px;
  width: 800px;
  // 设置字体大小 颜色
  font-size: 30px;
  color: #000000;
  //color: #ffffff;
  //border: 0.1px solid #999999;
}
.indexdiv1span1 {
  /****字体样式的div****/
  //color: #ffffff;
  color: #000000;
  font-size:60px;
  //border: 0.1px solid #999999;
}
.indexdiv2 {
  /****首页logodiv位置设置****/
  //居中 设置宽度大小和居中 是设置的div的居中
  margin: auto;
  width: 100px;
  //设置行高
  margin-top:10px;
  //border: 0.1px solid #999999;
}
//幻灯片div
.huandiv {
  margin-top: 51px;
}
.huanimg {
  // 固定的 根据幻灯片大小来的  不用动
  width: 740px;
  height: 460px;
}

////图片的样式
.imgback1 {
  /****首页图片背景设置****/
  //background-image: url("../assets/images/4.jpg");
  background-size: cover;
  //filter:opacity(50%);
  //background-color:#2c3e50;
  width: 100%;
  height: 865px;
}

.imgback1::before {
  position: absolute;
  content: "";
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  //background: url("../assets/images/beijing2.jpg") no-repeat;
  //background-size: cover;
  z-index: 1;
  -webkit-animation: maskRotate 4s linear infinite;
  animation: maskRotate 4s linear infinite;
}

//@-webkit-keyframes maskRotate {
//  0% {
//    -webkit-mask: linear-gradient(0deg, #000 40%, transparent 60%);
//            mask: linear-gradient(0deg, #000 40%, transparent 60%);
//  }
//  1% {
//    -webkit-mask: linear-gradient(7.2deg, #000 40%, transparent 60%);
//            mask: linear-gradient(7.2deg, #000 40%, transparent 60%);
//  }
//  2% {
//    -webkit-mask: linear-gradient(14.4deg, #000 40%, transparent 60%);
//            mask: linear-gradient(14.4deg, #000 40%, transparent 60%);
//  }
//  3% {
//    -webkit-mask: linear-gradient(21.6deg, #000 40%, transparent 60%);
//            mask: linear-gradient(21.6deg, #000 40%, transparent 60%);
//  }
//  4% {
//    -webkit-mask: linear-gradient(28.8deg, #000 40%, transparent 60%);
//            mask: linear-gradient(28.8deg, #000 40%, transparent 60%);
//  }
//  5% {
//    -webkit-mask: linear-gradient(36deg, #000 40%, transparent 60%);
//            mask: linear-gradient(36deg, #000 40%, transparent 60%);
//  }
//  6% {
//    -webkit-mask: linear-gradient(43.2deg, #000 40%, transparent 60%);
//            mask: linear-gradient(43.2deg, #000 40%, transparent 60%);
//  }
//  7% {
//    -webkit-mask: linear-gradient(50.4deg, #000 40%, transparent 60%);
//            mask: linear-gradient(50.4deg, #000 40%, transparent 60%);
//  }
//  8% {
//    -webkit-mask: linear-gradient(57.6deg, #000 40%, transparent 60%);
//            mask: linear-gradient(57.6deg, #000 40%, transparent 60%);
//  }
//  9% {
//    -webkit-mask: linear-gradient(64.8deg, #000 40%, transparent 60%);
//            mask: linear-gradient(64.8deg, #000 40%, transparent 60%);
//  }
//  10% {
//    -webkit-mask: linear-gradient(72deg, #000 40%, transparent 60%);
//            mask: linear-gradient(72deg, #000 40%, transparent 60%);
//  }
//  11% {
//    -webkit-mask: linear-gradient(79.2deg, #000 40%, transparent 60%);
//            mask: linear-gradient(79.2deg, #000 40%, transparent 60%);
//  }
//  12% {
//    -webkit-mask: linear-gradient(86.4deg, #000 40%, transparent 60%);
//            mask: linear-gradient(86.4deg, #000 40%, transparent 60%);
//  }
//  13% {
//    -webkit-mask: linear-gradient(93.6deg, #000 40%, transparent 60%);
//            mask: linear-gradient(93.6deg, #000 40%, transparent 60%);
//  }
//  14% {
//    -webkit-mask: linear-gradient(100.8deg, #000 40%, transparent 60%);
//            mask: linear-gradient(100.8deg, #000 40%, transparent 60%);
//  }
//  15% {
//    -webkit-mask: linear-gradient(108deg, #000 40%, transparent 60%);
//            mask: linear-gradient(108deg, #000 40%, transparent 60%);
//  }
//  16% {
//    -webkit-mask: linear-gradient(115.2deg, #000 40%, transparent 60%);
//            mask: linear-gradient(115.2deg, #000 40%, transparent 60%);
//  }
//  17% {
//    -webkit-mask: linear-gradient(122.4deg, #000 40%, transparent 60%);
//            mask: linear-gradient(122.4deg, #000 40%, transparent 60%);
//  }
//  18% {
//    -webkit-mask: linear-gradient(129.6deg, #000 40%, transparent 60%);
//            mask: linear-gradient(129.6deg, #000 40%, transparent 60%);
//  }
//  19% {
//    -webkit-mask: linear-gradient(136.8deg, #000 40%, transparent 60%);
//            mask: linear-gradient(136.8deg, #000 40%, transparent 60%);
//  }
//  20% {
//    -webkit-mask: linear-gradient(144deg, #000 40%, transparent 60%);
//            mask: linear-gradient(144deg, #000 40%, transparent 60%);
//  }
//  21% {
//    -webkit-mask: linear-gradient(151.2deg, #000 40%, transparent 60%);
//            mask: linear-gradient(151.2deg, #000 40%, transparent 60%);
//  }
//  22% {
//    -webkit-mask: linear-gradient(158.4deg, #000 40%, transparent 60%);
//            mask: linear-gradient(158.4deg, #000 40%, transparent 60%);
//  }
//  23% {
//    -webkit-mask: linear-gradient(165.6deg, #000 40%, transparent 60%);
//            mask: linear-gradient(165.6deg, #000 40%, transparent 60%);
//  }
//  24% {
//    -webkit-mask: linear-gradient(172.8deg, #000 40%, transparent 60%);
//            mask: linear-gradient(172.8deg, #000 40%, transparent 60%);
//  }
//  25% {
//    -webkit-mask: linear-gradient(180deg, #000 40%, transparent 60%);
//            mask: linear-gradient(180deg, #000 40%, transparent 60%);
//  }
//  26% {
//    -webkit-mask: linear-gradient(187.2deg, #000 40%, transparent 60%);
//            mask: linear-gradient(187.2deg, #000 40%, transparent 60%);
//  }
//  27% {
//    -webkit-mask: linear-gradient(194.4deg, #000 40%, transparent 60%);
//            mask: linear-gradient(194.4deg, #000 40%, transparent 60%);
//  }
//  28% {
//    -webkit-mask: linear-gradient(201.6deg, #000 40%, transparent 60%);
//            mask: linear-gradient(201.6deg, #000 40%, transparent 60%);
//  }
//  29% {
//    -webkit-mask: linear-gradient(208.8deg, #000 40%, transparent 60%);
//            mask: linear-gradient(208.8deg, #000 40%, transparent 60%);
//  }
//  30% {
//    -webkit-mask: linear-gradient(216deg, #000 40%, transparent 60%);
//            mask: linear-gradient(216deg, #000 40%, transparent 60%);
//  }
//  31% {
//    -webkit-mask: linear-gradient(223.2deg, #000 40%, transparent 60%);
//            mask: linear-gradient(223.2deg, #000 40%, transparent 60%);
//  }
//  32% {
//    -webkit-mask: linear-gradient(230.4deg, #000 40%, transparent 60%);
//            mask: linear-gradient(230.4deg, #000 40%, transparent 60%);
//  }
//  33% {
//    -webkit-mask: linear-gradient(237.6deg, #000 40%, transparent 60%);
//            mask: linear-gradient(237.6deg, #000 40%, transparent 60%);
//  }
//  34% {
//    -webkit-mask: linear-gradient(244.8deg, #000 40%, transparent 60%);
//            mask: linear-gradient(244.8deg, #000 40%, transparent 60%);
//  }
//  35% {
//    -webkit-mask: linear-gradient(252deg, #000 40%, transparent 60%);
//            mask: linear-gradient(252deg, #000 40%, transparent 60%);
//  }
//  36% {
//    -webkit-mask: linear-gradient(259.2deg, #000 40%, transparent 60%);
//            mask: linear-gradient(259.2deg, #000 40%, transparent 60%);
//  }
//  37% {
//    -webkit-mask: linear-gradient(266.4deg, #000 40%, transparent 60%);
//            mask: linear-gradient(266.4deg, #000 40%, transparent 60%);
//  }
//  38% {
//    -webkit-mask: linear-gradient(273.6deg, #000 40%, transparent 60%);
//            mask: linear-gradient(273.6deg, #000 40%, transparent 60%);
//  }
//  39% {
//    -webkit-mask: linear-gradient(280.8deg, #000 40%, transparent 60%);
//            mask: linear-gradient(280.8deg, #000 40%, transparent 60%);
//  }
//  40% {
//    -webkit-mask: linear-gradient(288deg, #000 40%, transparent 60%);
//            mask: linear-gradient(288deg, #000 40%, transparent 60%);
//  }
//  41% {
//    -webkit-mask: linear-gradient(295.2deg, #000 40%, transparent 60%);
//            mask: linear-gradient(295.2deg, #000 40%, transparent 60%);
//  }
//  42% {
//    -webkit-mask: linear-gradient(302.4deg, #000 40%, transparent 60%);
//            mask: linear-gradient(302.4deg, #000 40%, transparent 60%);
//  }
//  43% {
//    -webkit-mask: linear-gradient(309.6deg, #000 40%, transparent 60%);
//            mask: linear-gradient(309.6deg, #000 40%, transparent 60%);
//  }
//  44% {
//    -webkit-mask: linear-gradient(316.8deg, #000 40%, transparent 60%);
//            mask: linear-gradient(316.8deg, #000 40%, transparent 60%);
//  }
//  45% {
//    -webkit-mask: linear-gradient(324deg, #000 40%, transparent 60%);
//            mask: linear-gradient(324deg, #000 40%, transparent 60%);
//  }
//  46% {
//    -webkit-mask: linear-gradient(331.2deg, #000 40%, transparent 60%);
//            mask: linear-gradient(331.2deg, #000 40%, transparent 60%);
//  }
//  47% {
//    -webkit-mask: linear-gradient(338.4deg, #000 40%, transparent 60%);
//            mask: linear-gradient(338.4deg, #000 40%, transparent 60%);
//  }
//  48% {
//    -webkit-mask: linear-gradient(345.6deg, #000 40%, transparent 60%);
//            mask: linear-gradient(345.6deg, #000 40%, transparent 60%);
//  }
//  49% {
//    -webkit-mask: linear-gradient(352.8deg, #000 40%, transparent 60%);
//            mask: linear-gradient(352.8deg, #000 40%, transparent 60%);
//  }
//  50% {
//    -webkit-mask: linear-gradient(360deg, #000 40%, transparent 60%);
//            mask: linear-gradient(360deg, #000 40%, transparent 60%);
//  }
//  100% {
//    -webkit-mask: linear-gradient(720deg, #000 40%, transparent 60%);
//            mask: linear-gradient(720deg, #000 40%, transparent 60%);
//  }
//}

//@keyframes maskRotate {
//  0% {
//    -webkit-mask: linear-gradient(0deg, #000 40%, transparent 60%);
//            mask: linear-gradient(0deg, #000 40%, transparent 60%);
//  }
//  1% {
//    -webkit-mask: linear-gradient(7.2deg, #000 40%, transparent 60%);
//            mask: linear-gradient(7.2deg, #000 40%, transparent 60%);
//  }
//  2% {
//    -webkit-mask: linear-gradient(14.4deg, #000 40%, transparent 60%);
//            mask: linear-gradient(14.4deg, #000 40%, transparent 60%);
//  }
//  3% {
//    -webkit-mask: linear-gradient(21.6deg, #000 40%, transparent 60%);
//            mask: linear-gradient(21.6deg, #000 40%, transparent 60%);
//  }
//  4% {
//    -webkit-mask: linear-gradient(28.8deg, #000 40%, transparent 60%);
//            mask: linear-gradient(28.8deg, #000 40%, transparent 60%);
//  }
//  5% {
//    -webkit-mask: linear-gradient(36deg, #000 40%, transparent 60%);
//            mask: linear-gradient(36deg, #000 40%, transparent 60%);
//  }
//  6% {
//    -webkit-mask: linear-gradient(43.2deg, #000 40%, transparent 60%);
//            mask: linear-gradient(43.2deg, #000 40%, transparent 60%);
//  }
//  7% {
//    -webkit-mask: linear-gradient(50.4deg, #000 40%, transparent 60%);
//            mask: linear-gradient(50.4deg, #000 40%, transparent 60%);
//  }
//  8% {
//    -webkit-mask: linear-gradient(57.6deg, #000 40%, transparent 60%);
//            mask: linear-gradient(57.6deg, #000 40%, transparent 60%);
//  }
//  9% {
//    -webkit-mask: linear-gradient(64.8deg, #000 40%, transparent 60%);
//            mask: linear-gradient(64.8deg, #000 40%, transparent 60%);
//  }
//  10% {
//    -webkit-mask: linear-gradient(72deg, #000 40%, transparent 60%);
//            mask: linear-gradient(72deg, #000 40%, transparent 60%);
//  }
//  11% {
//    -webkit-mask: linear-gradient(79.2deg, #000 40%, transparent 60%);
//            mask: linear-gradient(79.2deg, #000 40%, transparent 60%);
//  }
//  12% {
//    -webkit-mask: linear-gradient(86.4deg, #000 40%, transparent 60%);
//            mask: linear-gradient(86.4deg, #000 40%, transparent 60%);
//  }
//  13% {
//    -webkit-mask: linear-gradient(93.6deg, #000 40%, transparent 60%);
//            mask: linear-gradient(93.6deg, #000 40%, transparent 60%);
//  }
//  14% {
//    -webkit-mask: linear-gradient(100.8deg, #000 40%, transparent 60%);
//            mask: linear-gradient(100.8deg, #000 40%, transparent 60%);
//  }
//  15% {
//    -webkit-mask: linear-gradient(108deg, #000 40%, transparent 60%);
//            mask: linear-gradient(108deg, #000 40%, transparent 60%);
//  }
//  16% {
//    -webkit-mask: linear-gradient(115.2deg, #000 40%, transparent 60%);
//            mask: linear-gradient(115.2deg, #000 40%, transparent 60%);
//  }
//  17% {
//    -webkit-mask: linear-gradient(122.4deg, #000 40%, transparent 60%);
//            mask: linear-gradient(122.4deg, #000 40%, transparent 60%);
//  }
//  18% {
//    -webkit-mask: linear-gradient(129.6deg, #000 40%, transparent 60%);
//            mask: linear-gradient(129.6deg, #000 40%, transparent 60%);
//  }
//  19% {
//    -webkit-mask: linear-gradient(136.8deg, #000 40%, transparent 60%);
//            mask: linear-gradient(136.8deg, #000 40%, transparent 60%);
//  }
//  20% {
//    -webkit-mask: linear-gradient(144deg, #000 40%, transparent 60%);
//            mask: linear-gradient(144deg, #000 40%, transparent 60%);
//  }
//  21% {
//    -webkit-mask: linear-gradient(151.2deg, #000 40%, transparent 60%);
//            mask: linear-gradient(151.2deg, #000 40%, transparent 60%);
//  }
//  22% {
//    -webkit-mask: linear-gradient(158.4deg, #000 40%, transparent 60%);
//            mask: linear-gradient(158.4deg, #000 40%, transparent 60%);
//  }
//  23% {
//    -webkit-mask: linear-gradient(165.6deg, #000 40%, transparent 60%);
//            mask: linear-gradient(165.6deg, #000 40%, transparent 60%);
//  }
//  24% {
//    -webkit-mask: linear-gradient(172.8deg, #000 40%, transparent 60%);
//            mask: linear-gradient(172.8deg, #000 40%, transparent 60%);
//  }
//  25% {
//    -webkit-mask: linear-gradient(180deg, #000 40%, transparent 60%);
//            mask: linear-gradient(180deg, #000 40%, transparent 60%);
//  }
//  26% {
//    -webkit-mask: linear-gradient(187.2deg, #000 40%, transparent 60%);
//            mask: linear-gradient(187.2deg, #000 40%, transparent 60%);
//  }
//  27% {
//    -webkit-mask: linear-gradient(194.4deg, #000 40%, transparent 60%);
//            mask: linear-gradient(194.4deg, #000 40%, transparent 60%);
//  }
//  28% {
//    -webkit-mask: linear-gradient(201.6deg, #000 40%, transparent 60%);
//            mask: linear-gradient(201.6deg, #000 40%, transparent 60%);
//  }
//  29% {
//    -webkit-mask: linear-gradient(208.8deg, #000 40%, transparent 60%);
//            mask: linear-gradient(208.8deg, #000 40%, transparent 60%);
//  }
//  30% {
//    -webkit-mask: linear-gradient(216deg, #000 40%, transparent 60%);
//            mask: linear-gradient(216deg, #000 40%, transparent 60%);
//  }
//  31% {
//    -webkit-mask: linear-gradient(223.2deg, #000 40%, transparent 60%);
//            mask: linear-gradient(223.2deg, #000 40%, transparent 60%);
//  }
//  32% {
//    -webkit-mask: linear-gradient(230.4deg, #000 40%, transparent 60%);
//            mask: linear-gradient(230.4deg, #000 40%, transparent 60%);
//  }
//  33% {
//    -webkit-mask: linear-gradient(237.6deg, #000 40%, transparent 60%);
//            mask: linear-gradient(237.6deg, #000 40%, transparent 60%);
//  }
//  34% {
//    -webkit-mask: linear-gradient(244.8deg, #000 40%, transparent 60%);
//            mask: linear-gradient(244.8deg, #000 40%, transparent 60%);
//  }
//  35% {
//    -webkit-mask: linear-gradient(252deg, #000 40%, transparent 60%);
//            mask: linear-gradient(252deg, #000 40%, transparent 60%);
//  }
//  36% {
//    -webkit-mask: linear-gradient(259.2deg, #000 40%, transparent 60%);
//            mask: linear-gradient(259.2deg, #000 40%, transparent 60%);
//  }
//  37% {
//    -webkit-mask: linear-gradient(266.4deg, #000 40%, transparent 60%);
//            mask: linear-gradient(266.4deg, #000 40%, transparent 60%);
//  }
//  38% {
//    -webkit-mask: linear-gradient(273.6deg, #000 40%, transparent 60%);
//            mask: linear-gradient(273.6deg, #000 40%, transparent 60%);
//  }
//  39% {
//    -webkit-mask: linear-gradient(280.8deg, #000 40%, transparent 60%);
//            mask: linear-gradient(280.8deg, #000 40%, transparent 60%);
//  }
//  40% {
//    -webkit-mask: linear-gradient(288deg, #000 40%, transparent 60%);
//            mask: linear-gradient(288deg, #000 40%, transparent 60%);
//  }
//  41% {
//    -webkit-mask: linear-gradient(295.2deg, #000 40%, transparent 60%);
//            mask: linear-gradient(295.2deg, #000 40%, transparent 60%);
//  }
//  42% {
//    -webkit-mask: linear-gradient(302.4deg, #000 40%, transparent 60%);
//            mask: linear-gradient(302.4deg, #000 40%, transparent 60%);
//  }
//  43% {
//    -webkit-mask: linear-gradient(309.6deg, #000 40%, transparent 60%);
//            mask: linear-gradient(309.6deg, #000 40%, transparent 60%);
//  }
//  44% {
//    -webkit-mask: linear-gradient(316.8deg, #000 40%, transparent 60%);
//            mask: linear-gradient(316.8deg, #000 40%, transparent 60%);
//  }
//  45% {
//    -webkit-mask: linear-gradient(324deg, #000 40%, transparent 60%);
//            mask: linear-gradient(324deg, #000 40%, transparent 60%);
//  }
//  46% {
//    -webkit-mask: linear-gradient(331.2deg, #000 40%, transparent 60%);
//            mask: linear-gradient(331.2deg, #000 40%, transparent 60%);
//  }
//  47% {
//    -webkit-mask: linear-gradient(338.4deg, #000 40%, transparent 60%);
//            mask: linear-gradient(338.4deg, #000 40%, transparent 60%);
//  }
//  48% {
//    -webkit-mask: linear-gradient(345.6deg, #000 40%, transparent 60%);
//            mask: linear-gradient(345.6deg, #000 40%, transparent 60%);
//  }
//  49% {
//    -webkit-mask: linear-gradient(352.8deg, #000 40%, transparent 60%);
//            mask: linear-gradient(352.8deg, #000 40%, transparent 60%);
//  }
//  50% {
//    -webkit-mask: linear-gradient(360deg, #000 40%, transparent 60%);
//            mask: linear-gradient(360deg, #000 40%, transparent 60%);
//  }
//  100% {
//    -webkit-mask: linear-gradient(720deg, #000 40%, transparent 60%);
//            mask: linear-gradient(720deg, #000 40%, transparent 60%);
//  }
//}

.image2 {
  /****首页上面logo的样式****/
  width: 180px;
  height: 170px;
}

//幻灯片格式
.el-carousel__item h3 {
  color: #475669;
  font-size: 14px;
  opacity: 0.75;
  line-height: 200px;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}
</style>

