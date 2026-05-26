<template>
  <el-dialog
    :title="
      type === 'add'
        ? '新增电价配置方案'
        : type === 'check'
        ? '查看电价配置方案'
        : '修改电价配置方案'
    "
    :visible.sync="reviewVisible"
    :close-on-click-modal="false"
    :destroy-on-close="true"
  >
    <el-form
      :model="addForm"
      :rules="rules"
      ref="addForm"
      :disabled="formDisabled"
    >
      <div class="title-left">
        <div class="bar-blue"></div>
        电价方案基本信息
      </div>
      <el-form-item label="方案名称：" prop="planName">
        <el-input
          v-model="addForm.planName"
          autocomplete="off"
          placeholder="请输入方案名称"
        >
        </el-input>
      </el-form-item>
      <el-form-item label="方案描述：" prop="planDescribe">
        <el-input
          v-model="addForm.planDescribe"
          autocomplete="off"
          placeholder="请输入方案描述"
          maxlength="500"
          show-word-limit
          type="textarea"
        >
        </el-input>
      </el-form-item>
      <div class="title-left">
        <div class="bar-blue"></div>
        电价方案详细配置
      </div>
      <div style="text-align: left; padding-left: 10px" v-if="style != 3">
        <span v-if="style != 3">电压等级：</span>
        <!-- <el-radio-group v-model="level" @change="radioChange">
          <el-radio :label="voltageLevel[0].value" v-if="style === 1">
            {{ voltageLevel[0].label }}</el-radio
          >
          <el-radio :label="voltageLevel[1].value" v-if="style != 3">
            {{ voltageLevel[1].label }}</el-radio
          >
          <el-radio :label="voltageLevel[2].value" v-if="style != 3">{{
            voltageLevel[2].label
          }}</el-radio>
        </el-radio-group> -->
        <el-radio-group v-model="addForm.level" @change="radioChange">
          <el-radio :label="'1'" v-if="style === 1"> 110kv</el-radio>
          <el-radio :label="'2'" v-if="style != 3"> 10kv/27.5kv</el-radio>
          <el-radio :label="'3'" v-if="style != 3"> 1kv/0.4kv </el-radio>
        </el-radio-group>
      </div>
      <el-form-item label="时间编程：" prop="repairTime" style="width: 100%">
        <el-date-picker
          v-model="addForm.repairTime"
          type="daterange"
          align="right"
          unlink-panels
          range-separator="至"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
          :picker-options="pickerOptions"
          value-format="yyyy-MM-dd"
          style="width: 100%"
        >
        </el-date-picker>
      </el-form-item>
      <el-form-item label="归属月份：" prop="month" style="width: 100%">
        <el-date-picker
          v-model="addForm.month"
          type="month"
          placeholder="请选择归属月份"
          value-format="yyyy-MM"
          style="width: 190px"
          @change="monthChange(addForm.month)"
        >
        </el-date-picker>
      </el-form-item>
      <el-form-item
        label="直读电价："
        prop="price"
        style="width: 100%"
        v-if="style === 3"
      >
        <el-input
          v-model="addForm.price"
          autocomplete="off"
          placeholder="请输入直读电价"
        >
        </el-input>
      </el-form-item>
      <div style="text-align: left; padding-left: 10px" v-if="style != 3">
        <span>计费项配置：</span>
        <div style="text-align: right">
          <span class="tab-time" @click="addTimeTab('0')"> 时段+ </span>
          <span class="tab-time" @click="addTimeTab('1')"> 时段- </span>
        </div>
      </div>
      <table
        border="0"
        cellpadding="0"
        cellspacing="0"
        class="timeTable"
        v-if="style != 3"
      >
        <tr>
          <td>计费项</td>
          <td>尖</td>
          <td>峰</td>
          <td>平</td>
          <td>谷</td>
        </tr>
        <tr v-if="addForm.timeTable">
          <td>电价(￥)</td>
          <td>
            <el-input v-model="addForm.timeTable.jian" @input.native="isNum">
            </el-input>
          </td>
          <td>
            <el-input v-model="addForm.timeTable.feng" @input.native="isNum">
            </el-input>
          </td>
          <td>
            <el-input v-model="addForm.timeTable.ping" @input.native="isNum">
            </el-input>
          </td>
          <td>
            <el-input v-model="addForm.timeTable.gu" @input.native="isNum">
            </el-input>
          </td>
          <!-- <td>￥{{ addForm.timeTable.jian }}</td> -->
        </tr>
        <tr v-for="(item, index) in addForm.timeData" :key="index">
          <td>时段</td>
          <td>
            <el-time-select
              placeholder="起始时间"
              v-model="item.startTime"
              :picker-options="{
                start: '00:00',
                step: '01:00',
                end: '24:00',
                maxTime: item.endTime,
              }"
            >
            </el-time-select>
            <el-time-select
              placeholder="结束时间"
              v-model="item.endTime"
              :picker-options="{
                start: '00:00',
                step: '01:00',
                end: '24:00',
                minTime: item.startTime,
              }"
              @change="timeChange"
            >
            </el-time-select>
          </td>
          <td>
            <el-time-select
              placeholder="起始时间"
              v-model="item.startTime1"
              :picker-options="{
                start: '00:00',
                step: '01:00',
                end: '24:00',
                maxTime: item.endTime1,
              }"
            >
            </el-time-select>
            <el-time-select
              placeholder="结束时间"
              v-model="item.endTime1"
              :picker-options="{
                start: '00:00',
                step: '01:00',
                end: '24:00',
                minTime: item.startTime1,
              }"
              @change="timeChange"
            >
            </el-time-select>
          </td>
          <td>
            <el-time-select
              placeholder="起始时间"
              v-model="item.startTime2"
              :picker-options="{
                start: '00:00',
                step: '01:00',
                end: '24:00',
                maxTime: item.endTime2,
              }"
            >
            </el-time-select>
            <el-time-select
              placeholder="结束时间"
              v-model="item.endTime2"
              :picker-options="{
                start: '00:00',
                step: '01:00',
                end: '24:00',
                minTime: item.startTime2,
              }"
              @change="timeChange"
            >
            </el-time-select>
          </td>
          <td>
            <el-time-select
              placeholder="起始时间"
              v-model="item.startTime3"
              :picker-options="{
                start: '00:00',
                step: '01:00',
                end: '24:00',
                maxTime: item.endTime3,
              }"
            >
            </el-time-select>
            <el-time-select
              placeholder="结束时间"
              v-model="item.endTime3"
              :picker-options="{
                start: '00:00',
                step: '01:00',
                end: '24:00',
                minTime: item.startTime3,
              }"
              @change="timeChange"
            >
            </el-time-select>
          </td>
        </tr>
      </table>
    </el-form>
    <div slot="footer" class="dialog-footer" v-if="type != 'check'">
      <el-button class="title-btn1" @click="addNewuser">保 存</el-button>
      <el-button class="title-btn2" @click="cancel">取 消</el-button>
    </div>
    <div slot="footer" class="dialog-footer" v-else>
      <el-button class="title-btn2" @click="cancel">关 闭</el-button>
    </div>
  </el-dialog>
</template>
<script>
// import {
//   dicFront,
//   insertInfo,
//   delInfo,
//   updateInfo,
//   getOutPrice,
// } from "@/pages/index/api/electInfo/electInfo.js";
export default {
  data() {
    return {
      radio: 3,
      id: "",
      type: "",
      style: "",
      voltageLevel: [], //电压等级
      planName: "", //方案名称
      planDescribe: "", //方案描述
      level: "", //电压等级
      repairTime: "", //时间编程
      month: "", //月份
      addForm: {}, //新增数据
      // timeTable: {}, //尖峰平谷
      reviewVisible: false,
      formDisabled: false,
      rules: {
        month: [
          { required: true, message: "请选择归属月份", trigger: "change" },
        ],
        repairTime: [
          { required: true, message: "请选择时间编程", trigger: "change" },
        ],
      },
      pickerOptions: {
        shortcuts: [
          {
            text: "最近一周",
            onClick(picker) {
              const end = new Date();
              const start = new Date();
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
              picker.$emit("pick", [start, end]);
            },
          },
          {
            text: "最近一个月",
            onClick(picker) {
              const end = new Date();
              const start = new Date();
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
              picker.$emit("pick", [start, end]);
            },
          },
          {
            text: "最近三个月",
            onClick(picker) {
              const end = new Date();
              const start = new Date();
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
              picker.$emit("pick", [start, end]);
            },
          },
        ],
      },
    };
  },
  mounted() {
    this.getVoltageLevel();
  },
  methods: {
    /**
     * 数字校验
     */
    isNum(num) {
    },
    radioChange(e) {

    },
    monthChange(e) {

    },
    timeChange() {},
    /**
     * 获取电压等级 ele_vol_level
     */
    getVoltageLevel() {

    },
    /**
     * 获取付费率电价
     */
    getElectPay() {
    },
    /**
     * 新增减少时段
     */
    addTimeTab(e) {
    },
    /**
     * 查看详情
     */
    openDetail(e) {

    },
    /**
     * 获取id
     */
    addNewequip(e) {

    },
    /**
     * 新增/修改确认
     */
    addNewuser() {

    },
    resDataPro(parmas) {
    },
    cancel() {
    },
    setForm() {
    },
  },
};
</script>
<style scoped>
.title-btn {
  width: 68px;
  height: 32px;
  text-align: center;
  box-sizing: border-box;
  background: #fff;
  font-size: 14px;
  border-radius: 5px;
  cursor: pointer;
}

.title-btn1 {
  background: #027db4;
  color: #fff;
  border: none;
}

.title-btn2 {
  color: #027db4;
  border: 1px solid #027db4;
}

::v-deep .el-dialog__body {
  height: 56vh;
  overflow-y: auto;
  overflow-x: auto;
}

::v-deep .el-dialog__header {
  width: 100%;
  margin: 0px;
  padding: 0 0 0 20px;
  background-color: #027db4;
}

::v-deep .el-dialog__headerbtn {
  position: absolute;
  top: 12px;
}

::v-deep .el-dialog__headerbtn .el-dialog__close {
  color: #fff;
}

::v-deep .el-dialog__body {
  color: #333;
  font-weight: 400;
}

.timeTable {
  width: 80%;
  text-align: center;
  margin: 0 10%;
  line-height: 32px;
  border: 1px solid #dcdfe6;
  border-collapse: collapse;
}

.timeTable td {
  width: 20%;
  border: 1px solid #dcdfe6;
}

::v-deep .el-dialog__body .timeTable .el-input__inner {
  border: none !important;
  padding-left: 46px;
}

::v-deep .el-dialog__body .timeTable .el-input__prefix {
  position: absolute;
  left: 20px;
  top: -4px;
}

::v-deep .el-dialog__body .tab-time {
  margin: 0 5px;
  font-weight: 500;
  color: #027db4;
  border: 1px #027db4 solid;
  padding: 2px 4px;
  border-radius: 2px;
  cursor: pointer;
}

::v-deep .el-cascader {
  width: 100%;
}

::v-deep .el-dialog__body .userInfo {
  line-height: 48px;
  font-size: 16px;
  display: flex;
  flex-wrap: wrap;
  text-align: left;
}

::v-deep .el-dialog__body .userInfo > p {
  width: 40%;
  margin: 0px 5%;
}

::v-deep .el-dialog__body .userInfo > p > span {
  margin-left: 10px;
  color: #666;
}

::v-deep .el-dialog__body .el-form {
  width: 100%;
  flex-wrap: wrap;
}

::v-deep .el-dialog__body .title-left {
  display: flex;
  align-items: center;
  font-size: 14px;
  color: #333;
}

::v-deep .el-dialog__body .bar-blue {
  width: 4px;
  height: 14px;
  background-color: #027db4;
  margin-right: 15px;
}

::v-deep .el-dialog__body .el-form > div {
  width: 90% !important;
  text-align: center;
  margin: 10px 5% !important;
}

::v-deep .el-dialog__body .el-form > div label {
  color: #333;
  font-weight: 400;
  text-align: center;
  padding: 0;
  width: 90px;
}

::v-deep .el-form-item__content {
  margin-left: 90px;
}

::v-deep .el-form-item__content .el-select {
  width: 100%;
}

::v-deep .el-dialog__footer {
  width: 100%;
  text-align: center;
}

::v-deep .el-dialog__title {
  color: #fff;
  line-height: 40px;
  font-size: 14px;
}

::v-deep .el-date-editor.el-input,
.el-date-editor.el-input__inner {
  width: 100% !important;
}
</style>
