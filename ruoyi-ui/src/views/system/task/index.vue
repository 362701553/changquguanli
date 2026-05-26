<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="所属公司ID" prop="factoryId">
        <el-input
          v-model="queryParams.factoryId"
          placeholder="请输入所属公司ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所属公司名称" prop="factoryName">
        <el-input
          v-model="queryParams.factoryName"
          placeholder="请输入所属公司名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="部门id" prop="deptId">
        <el-input
          v-model="queryParams.deptId"
          placeholder="请输入部门id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="删除状态" prop="deleted">
        <el-input
          v-model="queryParams.deleted"
          placeholder="请输入删除状态"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间" prop="createDate">
        <el-date-picker clearable
          v-model="queryParams.createDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择创建时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="修改时间" prop="updateDate">
        <el-date-picker clearable
          v-model="queryParams.updateDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择修改时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="预约任务编号" prop="taskCode">
        <el-input
          v-model="queryParams.taskCode"
          placeholder="请输入预约任务编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="预约厂区" prop="factoryAreaId">
        <el-input
          v-model="queryParams.factoryAreaId"
          placeholder="请输入预约厂区"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="预约厂区名称" prop="factoryAreaName">
        <el-input
          v-model="queryParams.factoryAreaName"
          placeholder="请输入预约厂区名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="业务大类编号" prop="categoryMainCode">
        <el-input
          v-model="queryParams.categoryMainCode"
          placeholder="请输入业务大类编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="业务子类编号" prop="categorySubCode">
        <el-input
          v-model="queryParams.categorySubCode"
          placeholder="请输入业务子类编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="业务大类名称" prop="categoryName">
        <el-input
          v-model="queryParams.categoryName"
          placeholder="请输入业务大类名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="业务子类名称" prop="categorySubName">
        <el-input
          v-model="queryParams.categorySubName"
          placeholder="请输入业务子类名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="业务对接人ID" prop="businessLiaisonById">
        <el-input
          v-model="queryParams.businessLiaisonById"
          placeholder="请输入业务对接人ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="业务对接人名称" prop="businessLiaisonByRel">
        <el-input
          v-model="queryParams.businessLiaisonByRel"
          placeholder="请输入业务对接人名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="业务对接人" prop="businessLiaisonBy">
        <el-input
          v-model="queryParams.businessLiaisonBy"
          placeholder="请输入业务对接人"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="服务商ID" prop="serviceProviderId">
        <el-input
          v-model="queryParams.serviceProviderId"
          placeholder="请输入服务商ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="服务商名称" prop="serviceProviderName">
        <el-input
          v-model="queryParams.serviceProviderName"
          placeholder="请输入服务商名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="车辆ID" prop="carId">
        <el-input
          v-model="queryParams.carId"
          placeholder="请输入车辆ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="车牌号" prop="carNo">
        <el-input
          v-model="queryParams.carNo"
          placeholder="请输入车牌号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="运输托数" prop="transportPallets">
        <el-input
          v-model="queryParams.transportPallets"
          placeholder="请输入运输托数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="外来车辆司机ID" prop="outDriverId">
        <el-input
          v-model="queryParams.outDriverId"
          placeholder="请输入外来车辆司机ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="外来车辆司机姓名" prop="outDriverName">
        <el-input
          v-model="queryParams.outDriverName"
          placeholder="请输入外来车辆司机姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="外来车辆司机电话" prop="outDriverPhone">
        <el-input
          v-model="queryParams.outDriverPhone"
          placeholder="请输入外来车辆司机电话"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="预计排队等待时间" prop="expectWaitTime">
        <el-input
          v-model="queryParams.expectWaitTime"
          placeholder="请输入预计排队等待时间"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="签到大门ID" prop="checkinGateId">
        <el-input
          v-model="queryParams.checkinGateId"
          placeholder="请输入签到大门ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="签到大门名称" prop="checkinGateName">
        <el-input
          v-model="queryParams.checkinGateName"
          placeholder="请输入签到大门名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="计划签入时间" prop="planCheckinTime">
        <el-date-picker clearable
          v-model="queryParams.planCheckinTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择计划签入时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="实际签入时间" prop="actualCheckinTime">
        <el-date-picker clearable
          v-model="queryParams.actualCheckinTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择实际签入时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="计划签出时间" prop="planCheckoutTime">
        <el-date-picker clearable
          v-model="queryParams.planCheckoutTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择计划签出时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="实际签出时间" prop="actualCheckoutTime">
        <el-date-picker clearable
          v-model="queryParams.actualCheckoutTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择实际签出时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="签出大门ID" prop="checkoutGateId">
        <el-input
          v-model="queryParams.checkoutGateId"
          placeholder="请输入签出大门ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="签出大门名称" prop="checkoutGateName">
        <el-input
          v-model="queryParams.checkoutGateName"
          placeholder="请输入签出大门名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="预约时段开始" prop="appointmentStart">
        <el-date-picker clearable
          v-model="queryParams.appointmentStart"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择预约时段开始">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="预约时段结束" prop="appointmentEnd">
        <el-date-picker clearable
          v-model="queryParams.appointmentEnd"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择预约时段结束">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="预约提交时间" prop="appointmentTime">
        <el-date-picker clearable
          v-model="queryParams.appointmentTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择预约提交时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="审核人" prop="auditor">
        <el-input
          v-model="queryParams.auditor"
          placeholder="请输入审核人"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="审核时间" prop="auditTime">
        <el-date-picker clearable
          v-model="queryParams.auditTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择审核时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="驳回原因" prop="auditRejectReason">
        <el-input
          v-model="queryParams.auditRejectReason"
          placeholder="请输入驳回原因"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否允许插队" prop="allowJump">
        <el-input
          v-model="queryParams.allowJump"
          placeholder="请输入是否允许插队"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="插队原因" prop="jumpReason">
        <el-input
          v-model="queryParams.jumpReason"
          placeholder="请输入插队原因"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="插队操作人" prop="jumpOperator">
        <el-input
          v-model="queryParams.jumpOperator"
          placeholder="请输入插队操作人"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="插队操作时间" prop="jumpTime">
        <el-date-picker clearable
          v-model="queryParams.jumpTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择插队操作时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="出门证编号" prop="exitNo">
        <el-input
          v-model="queryParams.exitNo"
          placeholder="请输入出门证编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="预约大门ID" prop="gateId">
        <el-input
          v-model="queryParams.gateId"
          placeholder="请输入预约大门ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="预约大门名称" prop="gateName">
        <el-input
          v-model="queryParams.gateName"
          placeholder="请输入预约大门名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="预计到厂时间" prop="expectDriverArriveTime">
        <el-date-picker clearable
          v-model="queryParams.expectDriverArriveTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择预计到厂时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="定位设备ID" prop="deviceId">
        <el-input
          v-model="queryParams.deviceId"
          placeholder="请输入定位设备ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="设备序列号" prop="deviceSn">
        <el-input
          v-model="queryParams.deviceSn"
          placeholder="请输入设备序列号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="起始点" prop="startPoint">
        <el-input
          v-model="queryParams.startPoint"
          placeholder="请输入起始点"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="目的地" prop="destinationPoint">
        <el-input
          v-model="queryParams.destinationPoint"
          placeholder="请输入目的地"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="时间明细ID" prop="planTimeDetailId">
        <el-input
          v-model="queryParams.planTimeDetailId"
          placeholder="请输入时间明细ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="当前排队码头ID" prop="currentDockId">
        <el-input
          v-model="queryParams.currentDockId"
          placeholder="请输入当前排队码头ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="当前排队码头名称" prop="currentDockName">
        <el-input
          v-model="queryParams.currentDockName"
          placeholder="请输入当前排队码头名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="绑定时间" prop="bindTime">
        <el-date-picker clearable
          v-model="queryParams.bindTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择绑定时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="是否应急" prop="isEmergency">
        <el-input
          v-model="queryParams.isEmergency"
          placeholder="请输入是否应急"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否强制结束" prop="isForceStop">
        <el-input
          v-model="queryParams.isForceStop"
          placeholder="请输入是否强制结束"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="审核备注" prop="reviewNotes">
        <el-input
          v-model="queryParams.reviewNotes"
          placeholder="请输入审核备注"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:task:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:task:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:task:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:task:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="taskList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键ID" align="center" prop="id" />
      <el-table-column label="所属公司ID" align="center" prop="factoryId" />
      <el-table-column label="所属公司名称" align="center" prop="factoryName" />
      <el-table-column label="部门id" align="center" prop="deptId" />
      <el-table-column label="删除状态" align="center" prop="deleted" />
      <el-table-column label="创建时间" align="center" prop="createDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="修改时间" align="center" prop="updateDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="预约任务编号" align="center" prop="taskCode" />
      <el-table-column label="预约厂区" align="center" prop="factoryAreaId" />
      <el-table-column label="预约厂区名称" align="center" prop="factoryAreaName" />
      <el-table-column label="业务大类编号" align="center" prop="categoryMainCode" />
      <el-table-column label="业务子类编号" align="center" prop="categorySubCode" />
      <el-table-column label="业务大类名称" align="center" prop="categoryName" />
      <el-table-column label="业务子类名称" align="center" prop="categorySubName" />
      <el-table-column label="业务对接人ID" align="center" prop="businessLiaisonById" />
      <el-table-column label="业务对接人名称" align="center" prop="businessLiaisonByRel" />
      <el-table-column label="业务对接人" align="center" prop="businessLiaisonBy" />
      <el-table-column label="服务商ID" align="center" prop="serviceProviderId" />
      <el-table-column label="服务商名称" align="center" prop="serviceProviderName" />
      <el-table-column label="车辆ID" align="center" prop="carId" />
      <el-table-column label="车牌号" align="center" prop="carNo" />
      <el-table-column label="运输托数" align="center" prop="transportPallets" />
      <el-table-column label="外来车辆司机ID" align="center" prop="outDriverId" />
      <el-table-column label="外来车辆司机姓名" align="center" prop="outDriverName" />
      <el-table-column label="外来车辆司机电话" align="center" prop="outDriverPhone" />
      <el-table-column label="任务状态" align="center" prop="taskStatus" />
      <el-table-column label="预计排队等待时间" align="center" prop="expectWaitTime" />
      <el-table-column label="签到大门ID" align="center" prop="checkinGateId" />
      <el-table-column label="签到大门名称" align="center" prop="checkinGateName" />
      <el-table-column label="计划签入时间" align="center" prop="planCheckinTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.planCheckinTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="实际签入时间" align="center" prop="actualCheckinTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.actualCheckinTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="计划签出时间" align="center" prop="planCheckoutTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.planCheckoutTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="实际签出时间" align="center" prop="actualCheckoutTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.actualCheckoutTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="签出大门ID" align="center" prop="checkoutGateId" />
      <el-table-column label="签出大门名称" align="center" prop="checkoutGateName" />
      <el-table-column label="预约时段开始" align="center" prop="appointmentStart" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.appointmentStart, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="预约时段结束" align="center" prop="appointmentEnd" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.appointmentEnd, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="预约提交时间" align="center" prop="appointmentTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.appointmentTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="审核状态" align="center" prop="auditStatus" />
      <el-table-column label="审核人" align="center" prop="auditor" />
      <el-table-column label="审核时间" align="center" prop="auditTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.auditTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="驳回原因" align="center" prop="auditRejectReason" />
      <el-table-column label="是否允许插队" align="center" prop="allowJump" />
      <el-table-column label="插队原因" align="center" prop="jumpReason" />
      <el-table-column label="插队操作人" align="center" prop="jumpOperator" />
      <el-table-column label="插队操作时间" align="center" prop="jumpTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.jumpTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="出门证编号" align="center" prop="exitNo" />
      <el-table-column label="预约大门ID" align="center" prop="gateId" />
      <el-table-column label="预约大门名称" align="center" prop="gateName" />
      <el-table-column label="预计到厂时间" align="center" prop="expectDriverArriveTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.expectDriverArriveTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="定位设备ID" align="center" prop="deviceId" />
      <el-table-column label="设备序列号" align="center" prop="deviceSn" />
      <el-table-column label="绑定状态" align="center" prop="bindDeviceStatus" />
      <el-table-column label="起始点" align="center" prop="startPoint" />
      <el-table-column label="目的地" align="center" prop="destinationPoint" />
      <el-table-column label="时间明细ID" align="center" prop="planTimeDetailId" />
      <el-table-column label="当前排队码头ID" align="center" prop="currentDockId" />
      <el-table-column label="当前排队码头名称" align="center" prop="currentDockName" />
      <el-table-column label="绑定时间" align="center" prop="bindTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.bindTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="是否应急" align="center" prop="isEmergency" />
      <el-table-column label="是否强制结束" align="center" prop="isForceStop" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="审核备注" align="center" prop="reviewNotes" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:task:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:task:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改预约任务对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="所属公司ID" prop="factoryId">
          <el-input v-model="form.factoryId" placeholder="请输入所属公司ID" />
        </el-form-item>
        <el-form-item label="所属公司名称" prop="factoryName">
          <el-input v-model="form.factoryName" placeholder="请输入所属公司名称" />
        </el-form-item>
        <el-form-item label="部门id" prop="deptId">
          <el-input v-model="form.deptId" placeholder="请输入部门id" />
        </el-form-item>
        <el-form-item label="删除状态" prop="deleted">
          <el-input v-model="form.deleted" placeholder="请输入删除状态" />
        </el-form-item>
        <el-form-item label="创建时间" prop="createDate">
          <el-date-picker clearable
            v-model="form.createDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择创建时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="修改时间" prop="updateDate">
          <el-date-picker clearable
            v-model="form.updateDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择修改时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="预约任务编号" prop="taskCode">
          <el-input v-model="form.taskCode" placeholder="请输入预约任务编号" />
        </el-form-item>
        <el-form-item label="预约厂区" prop="factoryAreaId">
          <el-input v-model="form.factoryAreaId" placeholder="请输入预约厂区" />
        </el-form-item>
        <el-form-item label="预约厂区名称" prop="factoryAreaName">
          <el-input v-model="form.factoryAreaName" placeholder="请输入预约厂区名称" />
        </el-form-item>
        <el-form-item label="业务大类编号" prop="categoryMainCode">
          <el-input v-model="form.categoryMainCode" placeholder="请输入业务大类编号" />
        </el-form-item>
        <el-form-item label="业务子类编号" prop="categorySubCode">
          <el-input v-model="form.categorySubCode" placeholder="请输入业务子类编号" />
        </el-form-item>
        <el-form-item label="业务大类名称" prop="categoryName">
          <el-input v-model="form.categoryName" placeholder="请输入业务大类名称" />
        </el-form-item>
        <el-form-item label="业务子类名称" prop="categorySubName">
          <el-input v-model="form.categorySubName" placeholder="请输入业务子类名称" />
        </el-form-item>
        <el-form-item label="业务对接人ID" prop="businessLiaisonById">
          <el-input v-model="form.businessLiaisonById" placeholder="请输入业务对接人ID" />
        </el-form-item>
        <el-form-item label="业务对接人名称" prop="businessLiaisonByRel">
          <el-input v-model="form.businessLiaisonByRel" placeholder="请输入业务对接人名称" />
        </el-form-item>
        <el-form-item label="业务对接人" prop="businessLiaisonBy">
          <el-input v-model="form.businessLiaisonBy" placeholder="请输入业务对接人" />
        </el-form-item>
        <el-form-item label="服务商ID" prop="serviceProviderId">
          <el-input v-model="form.serviceProviderId" placeholder="请输入服务商ID" />
        </el-form-item>
        <el-form-item label="服务商名称" prop="serviceProviderName">
          <el-input v-model="form.serviceProviderName" placeholder="请输入服务商名称" />
        </el-form-item>
        <el-form-item label="车辆ID" prop="carId">
          <el-input v-model="form.carId" placeholder="请输入车辆ID" />
        </el-form-item>
        <el-form-item label="车牌号" prop="carNo">
          <el-input v-model="form.carNo" placeholder="请输入车牌号" />
        </el-form-item>
        <el-form-item label="运输托数" prop="transportPallets">
          <el-input v-model="form.transportPallets" placeholder="请输入运输托数" />
        </el-form-item>
        <el-form-item label="外来车辆司机ID" prop="outDriverId">
          <el-input v-model="form.outDriverId" placeholder="请输入外来车辆司机ID" />
        </el-form-item>
        <el-form-item label="外来车辆司机姓名" prop="outDriverName">
          <el-input v-model="form.outDriverName" placeholder="请输入外来车辆司机姓名" />
        </el-form-item>
        <el-form-item label="外来车辆司机电话" prop="outDriverPhone">
          <el-input v-model="form.outDriverPhone" placeholder="请输入外来车辆司机电话" />
        </el-form-item>
        <el-form-item label="预计排队等待时间" prop="expectWaitTime">
          <el-input v-model="form.expectWaitTime" placeholder="请输入预计排队等待时间" />
        </el-form-item>
        <el-form-item label="签到大门ID" prop="checkinGateId">
          <el-input v-model="form.checkinGateId" placeholder="请输入签到大门ID" />
        </el-form-item>
        <el-form-item label="签到大门名称" prop="checkinGateName">
          <el-input v-model="form.checkinGateName" placeholder="请输入签到大门名称" />
        </el-form-item>
        <el-form-item label="计划签入时间" prop="planCheckinTime">
          <el-date-picker clearable
            v-model="form.planCheckinTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择计划签入时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="实际签入时间" prop="actualCheckinTime">
          <el-date-picker clearable
            v-model="form.actualCheckinTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择实际签入时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="计划签出时间" prop="planCheckoutTime">
          <el-date-picker clearable
            v-model="form.planCheckoutTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择计划签出时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="实际签出时间" prop="actualCheckoutTime">
          <el-date-picker clearable
            v-model="form.actualCheckoutTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择实际签出时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="签出大门ID" prop="checkoutGateId">
          <el-input v-model="form.checkoutGateId" placeholder="请输入签出大门ID" />
        </el-form-item>
        <el-form-item label="签出大门名称" prop="checkoutGateName">
          <el-input v-model="form.checkoutGateName" placeholder="请输入签出大门名称" />
        </el-form-item>
        <el-form-item label="预约时段开始" prop="appointmentStart">
          <el-date-picker clearable
            v-model="form.appointmentStart"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择预约时段开始">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="预约时段结束" prop="appointmentEnd">
          <el-date-picker clearable
            v-model="form.appointmentEnd"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择预约时段结束">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="预约提交时间" prop="appointmentTime">
          <el-date-picker clearable
            v-model="form.appointmentTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择预约提交时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="审核人" prop="auditor">
          <el-input v-model="form.auditor" placeholder="请输入审核人" />
        </el-form-item>
        <el-form-item label="审核时间" prop="auditTime">
          <el-date-picker clearable
            v-model="form.auditTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择审核时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="驳回原因" prop="auditRejectReason">
          <el-input v-model="form.auditRejectReason" placeholder="请输入驳回原因" />
        </el-form-item>
        <el-form-item label="是否允许插队" prop="allowJump">
          <el-input v-model="form.allowJump" placeholder="请输入是否允许插队" />
        </el-form-item>
        <el-form-item label="插队原因" prop="jumpReason">
          <el-input v-model="form.jumpReason" placeholder="请输入插队原因" />
        </el-form-item>
        <el-form-item label="插队操作人" prop="jumpOperator">
          <el-input v-model="form.jumpOperator" placeholder="请输入插队操作人" />
        </el-form-item>
        <el-form-item label="插队操作时间" prop="jumpTime">
          <el-date-picker clearable
            v-model="form.jumpTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择插队操作时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="出门证编号" prop="exitNo">
          <el-input v-model="form.exitNo" placeholder="请输入出门证编号" />
        </el-form-item>
        <el-form-item label="预约大门ID" prop="gateId">
          <el-input v-model="form.gateId" placeholder="请输入预约大门ID" />
        </el-form-item>
        <el-form-item label="预约大门名称" prop="gateName">
          <el-input v-model="form.gateName" placeholder="请输入预约大门名称" />
        </el-form-item>
        <el-form-item label="预计到厂时间" prop="expectDriverArriveTime">
          <el-date-picker clearable
            v-model="form.expectDriverArriveTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择预计到厂时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="定位设备ID" prop="deviceId">
          <el-input v-model="form.deviceId" placeholder="请输入定位设备ID" />
        </el-form-item>
        <el-form-item label="设备序列号" prop="deviceSn">
          <el-input v-model="form.deviceSn" placeholder="请输入设备序列号" />
        </el-form-item>
        <el-form-item label="起始点" prop="startPoint">
          <el-input v-model="form.startPoint" placeholder="请输入起始点" />
        </el-form-item>
        <el-form-item label="目的地" prop="destinationPoint">
          <el-input v-model="form.destinationPoint" placeholder="请输入目的地" />
        </el-form-item>
        <el-form-item label="时间明细ID" prop="planTimeDetailId">
          <el-input v-model="form.planTimeDetailId" placeholder="请输入时间明细ID" />
        </el-form-item>
        <el-form-item label="当前排队码头ID" prop="currentDockId">
          <el-input v-model="form.currentDockId" placeholder="请输入当前排队码头ID" />
        </el-form-item>
        <el-form-item label="当前排队码头名称" prop="currentDockName">
          <el-input v-model="form.currentDockName" placeholder="请输入当前排队码头名称" />
        </el-form-item>
        <el-form-item label="绑定时间" prop="bindTime">
          <el-date-picker clearable
            v-model="form.bindTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择绑定时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="是否应急" prop="isEmergency">
          <el-input v-model="form.isEmergency" placeholder="请输入是否应急" />
        </el-form-item>
        <el-form-item label="是否强制结束" prop="isForceStop">
          <el-input v-model="form.isForceStop" placeholder="请输入是否强制结束" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" />
        </el-form-item>
        <el-form-item label="审核备注" prop="reviewNotes">
          <el-input v-model="form.reviewNotes" placeholder="请输入审核备注" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listTask, getTask, delTask, addTask, updateTask } from "@/api/system/task";

export default {
  name: "Task",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 预约任务表格数据
      taskList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        factoryId: null,
        factoryName: null,
        deptId: null,
        deleted: null,
        createDate: null,
        updateDate: null,
        taskCode: null,
        factoryAreaId: null,
        factoryAreaName: null,
        categoryMainCode: null,
        categorySubCode: null,
        categoryName: null,
        categorySubName: null,
        businessLiaisonById: null,
        businessLiaisonByRel: null,
        businessLiaisonBy: null,
        serviceProviderId: null,
        serviceProviderName: null,
        carId: null,
        carNo: null,
        transportPallets: null,
        outDriverId: null,
        outDriverName: null,
        outDriverPhone: null,
        taskStatus: null,
        expectWaitTime: null,
        checkinGateId: null,
        checkinGateName: null,
        planCheckinTime: null,
        actualCheckinTime: null,
        planCheckoutTime: null,
        actualCheckoutTime: null,
        checkoutGateId: null,
        checkoutGateName: null,
        appointmentStart: null,
        appointmentEnd: null,
        appointmentTime: null,
        auditStatus: null,
        auditor: null,
        auditTime: null,
        auditRejectReason: null,
        allowJump: null,
        jumpReason: null,
        jumpOperator: null,
        jumpTime: null,
        exitNo: null,
        gateId: null,
        gateName: null,
        expectDriverArriveTime: null,
        deviceId: null,
        deviceSn: null,
        bindDeviceStatus: null,
        startPoint: null,
        destinationPoint: null,
        planTimeDetailId: null,
        currentDockId: null,
        currentDockName: null,
        bindTime: null,
        isEmergency: null,
        isForceStop: null,
        reviewNotes: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询预约任务列表 */
    getList() {
      this.loading = true;
      listTask(this.queryParams).then(response => {
        this.taskList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        factoryId: null,
        factoryName: null,
        deptId: null,
        deleted: null,
        createBy: null,
        createDate: null,
        updateBy: null,
        updateDate: null,
        taskCode: null,
        factoryAreaId: null,
        factoryAreaName: null,
        categoryMainCode: null,
        categorySubCode: null,
        categoryName: null,
        categorySubName: null,
        businessLiaisonById: null,
        businessLiaisonByRel: null,
        businessLiaisonBy: null,
        serviceProviderId: null,
        serviceProviderName: null,
        carId: null,
        carNo: null,
        transportPallets: null,
        outDriverId: null,
        outDriverName: null,
        outDriverPhone: null,
        taskStatus: "0",
        expectWaitTime: null,
        checkinGateId: null,
        checkinGateName: null,
        planCheckinTime: null,
        actualCheckinTime: null,
        planCheckoutTime: null,
        actualCheckoutTime: null,
        checkoutGateId: null,
        checkoutGateName: null,
        appointmentStart: null,
        appointmentEnd: null,
        appointmentTime: null,
        auditStatus: "0",
        auditor: null,
        auditTime: null,
        auditRejectReason: null,
        allowJump: null,
        jumpReason: null,
        jumpOperator: null,
        jumpTime: null,
        exitNo: null,
        gateId: null,
        gateName: null,
        expectDriverArriveTime: null,
        deviceId: null,
        deviceSn: null,
        bindDeviceStatus: "0",
        startPoint: null,
        destinationPoint: null,
        planTimeDetailId: null,
        currentDockId: null,
        currentDockName: null,
        bindTime: null,
        isEmergency: null,
        isForceStop: null,
        remark: null,
        reviewNotes: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加预约任务";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getTask(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改预约任务";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateTask(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTask(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除预约任务编号为"' + ids + '"的数据项？').then(function() {
        return delTask(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/task/export', {
        ...this.queryParams
      }, `task_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
