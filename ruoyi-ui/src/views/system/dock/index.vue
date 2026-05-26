<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="主表id" prop="taskId">
        <el-input
          v-model="queryParams.taskId"
          placeholder="请输入主表id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="行号" prop="lineNo">
        <el-input
          v-model="queryParams.lineNo"
          placeholder="请输入行号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="预约码头ID" prop="dockId">
        <el-input
          v-model="queryParams.dockId"
          placeholder="请输入预约码头ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="预约码头名称" prop="dockName">
        <el-input
          v-model="queryParams.dockName"
          placeholder="请输入预约码头名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="预约码头编码" prop="dockCode">
        <el-input
          v-model="queryParams.dockCode"
          placeholder="请输入预约码头编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="码头预约开始" prop="dockStart">
        <el-date-picker clearable
          v-model="queryParams.dockStart"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择码头预约开始">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="码头预约结束" prop="dockEnd">
        <el-date-picker clearable
          v-model="queryParams.dockEnd"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择码头预约结束">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="装卸点ID" prop="loadingPointId">
        <el-input
          v-model="queryParams.loadingPointId"
          placeholder="请输入装卸点ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="装卸点编号" prop="loadingPointCode">
        <el-input
          v-model="queryParams.loadingPointCode"
          placeholder="请输入装卸点编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="装卸点名称" prop="loadingPointName">
        <el-input
          v-model="queryParams.loadingPointName"
          placeholder="请输入装卸点名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="叉车司机ID(主要)" prop="forkliftDriverId">
        <el-input
          v-model="queryParams.forkliftDriverId"
          placeholder="请输入叉车司机ID(主要)"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="叉车司机姓名" prop="forkliftDriverName">
        <el-input
          v-model="queryParams.forkliftDriverName"
          placeholder="请输入叉车司机姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="叉车编号" prop="forkliftNo">
        <el-input
          v-model="queryParams.forkliftNo"
          placeholder="请输入叉车编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="叉车其他人员" prop="forkliftExtra">
        <el-input
          v-model="queryParams.forkliftExtra"
          placeholder="请输入叉车其他人员"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="装卸托数" prop="loadingQty">
        <el-input
          v-model="queryParams.loadingQty"
          placeholder="请输入装卸托数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="装卸开始时间" prop="loadingStart">
        <el-date-picker clearable
          v-model="queryParams.loadingStart"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择装卸开始时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="装卸完成时间" prop="loadingFinish">
        <el-date-picker clearable
          v-model="queryParams.loadingFinish"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择装卸完成时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="装卸点释放时间" prop="pointReleaseTime">
        <el-date-picker clearable
          v-model="queryParams.pointReleaseTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择装卸点释放时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="到达码头时间(撞栏)" prop="arriveTime">
        <el-date-picker clearable
          v-model="queryParams.arriveTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择到达码头时间(撞栏)">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="驶离码头时间" prop="leaveTime">
        <el-date-picker clearable
          v-model="queryParams.leaveTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择驶离码头时间">
        </el-date-picker>
      </el-form-item>
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
      <el-form-item label="时间明细ID" prop="planTimeDetailId">
        <el-input
          v-model="queryParams.planTimeDetailId"
          placeholder="请输入时间明细ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="排队序号" prop="queueNumber">
        <el-input
          v-model="queryParams.queueNumber"
          placeholder="请输入排队序号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="预计等待时间" prop="expectWaitTime">
        <el-input
          v-model="queryParams.expectWaitTime"
          placeholder="请输入预计等待时间"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否作业完成插队" prop="isWorkedJump">
        <el-input
          v-model="queryParams.isWorkedJump"
          placeholder="请输入是否作业完成插队"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="码头顺序" prop="dockSort">
        <el-input
          v-model="queryParams.dockSort"
          placeholder="请输入码头顺序"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="停车位ID" prop="parkingId">
        <el-input
          v-model="queryParams.parkingId"
          placeholder="请输入停车位ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="车型" prop="carModel">
        <el-input
          v-model="queryParams.carModel"
          placeholder="请输入车型"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="停车位编码" prop="parkingCode">
        <el-input
          v-model="queryParams.parkingCode"
          placeholder="请输入停车位编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="装卸任务编码" prop="loadingTaskCode">
        <el-input
          v-model="queryParams.loadingTaskCode"
          placeholder="请输入装卸任务编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="厂区ID" prop="factoryAreaId">
        <el-input
          v-model="queryParams.factoryAreaId"
          placeholder="请输入厂区ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="厂区名称" prop="factoryAreaName">
        <el-input
          v-model="queryParams.factoryAreaName"
          placeholder="请输入厂区名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="厂区部门ID" prop="areaDeptId">
        <el-input
          v-model="queryParams.areaDeptId"
          placeholder="请输入厂区部门ID"
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
          v-hasPermi="['system:dock:add']"
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
          v-hasPermi="['system:dock:edit']"
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
          v-hasPermi="['system:dock:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:dock:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="dockList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="${comment}" align="center" prop="id" />
      <el-table-column label="主表id" align="center" prop="taskId" />
      <el-table-column label="行号" align="center" prop="lineNo" />
      <el-table-column label="预约码头ID" align="center" prop="dockId" />
      <el-table-column label="预约码头名称" align="center" prop="dockName" />
      <el-table-column label="预约码头编码" align="center" prop="dockCode" />
      <el-table-column label="码头预约开始" align="center" prop="dockStart" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.dockStart, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="码头预约结束" align="center" prop="dockEnd" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.dockEnd, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="装卸点ID" align="center" prop="loadingPointId" />
      <el-table-column label="装卸点编号" align="center" prop="loadingPointCode" />
      <el-table-column label="装卸点名称" align="center" prop="loadingPointName" />
      <el-table-column label="叉车司机ID(主要)" align="center" prop="forkliftDriverId" />
      <el-table-column label="叉车司机姓名" align="center" prop="forkliftDriverName" />
      <el-table-column label="叉车编号" align="center" prop="forkliftNo" />
      <el-table-column label="叉车其他人员" align="center" prop="forkliftExtra" />
      <el-table-column label="装卸托数" align="center" prop="loadingQty" />
      <el-table-column label="装卸开始时间" align="center" prop="loadingStart" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.loadingStart, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="装卸完成时间" align="center" prop="loadingFinish" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.loadingFinish, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="装卸点释放时间" align="center" prop="pointReleaseTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.pointReleaseTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="到达码头时间(撞栏)" align="center" prop="arriveTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.arriveTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="驶离码头时间" align="center" prop="leaveTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.leaveTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="作业状态" align="center" prop="workStatus" />
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
      <el-table-column label="时间明细ID" align="center" prop="planTimeDetailId" />
      <el-table-column label="排队序号" align="center" prop="queueNumber" />
      <el-table-column label="预计等待时间" align="center" prop="expectWaitTime" />
      <el-table-column label="排队状态" align="center" prop="queueStatus" />
      <el-table-column label="是否作业完成插队" align="center" prop="isWorkedJump" />
      <el-table-column label="码头顺序" align="center" prop="dockSort" />
      <el-table-column label="停车位ID" align="center" prop="parkingId" />
      <el-table-column label="车型" align="center" prop="carModel" />
      <el-table-column label="停车位编码" align="center" prop="parkingCode" />
      <el-table-column label="装卸任务编码" align="center" prop="loadingTaskCode" />
      <el-table-column label="装卸类型" align="center" prop="loadingType" />
      <el-table-column label="厂区ID" align="center" prop="factoryAreaId" />
      <el-table-column label="厂区名称" align="center" prop="factoryAreaName" />
      <el-table-column label="厂区部门ID" align="center" prop="areaDeptId" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:dock:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:dock:remove']"
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

    <!-- 添加或修改预约任务-码头明细对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="主表id" prop="taskId">
          <el-input v-model="form.taskId" placeholder="请输入主表id" />
        </el-form-item>
        <el-form-item label="行号" prop="lineNo">
          <el-input v-model="form.lineNo" placeholder="请输入行号" />
        </el-form-item>
        <el-form-item label="预约码头ID" prop="dockId">
          <el-input v-model="form.dockId" placeholder="请输入预约码头ID" />
        </el-form-item>
        <el-form-item label="预约码头名称" prop="dockName">
          <el-input v-model="form.dockName" placeholder="请输入预约码头名称" />
        </el-form-item>
        <el-form-item label="预约码头编码" prop="dockCode">
          <el-input v-model="form.dockCode" placeholder="请输入预约码头编码" />
        </el-form-item>
        <el-form-item label="码头预约开始" prop="dockStart">
          <el-date-picker clearable
            v-model="form.dockStart"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择码头预约开始">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="码头预约结束" prop="dockEnd">
          <el-date-picker clearable
            v-model="form.dockEnd"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择码头预约结束">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="装卸点ID" prop="loadingPointId">
          <el-input v-model="form.loadingPointId" placeholder="请输入装卸点ID" />
        </el-form-item>
        <el-form-item label="装卸点编号" prop="loadingPointCode">
          <el-input v-model="form.loadingPointCode" placeholder="请输入装卸点编号" />
        </el-form-item>
        <el-form-item label="装卸点名称" prop="loadingPointName">
          <el-input v-model="form.loadingPointName" placeholder="请输入装卸点名称" />
        </el-form-item>
        <el-form-item label="叉车司机ID(主要)" prop="forkliftDriverId">
          <el-input v-model="form.forkliftDriverId" placeholder="请输入叉车司机ID(主要)" />
        </el-form-item>
        <el-form-item label="叉车司机姓名" prop="forkliftDriverName">
          <el-input v-model="form.forkliftDriverName" placeholder="请输入叉车司机姓名" />
        </el-form-item>
        <el-form-item label="叉车编号" prop="forkliftNo">
          <el-input v-model="form.forkliftNo" placeholder="请输入叉车编号" />
        </el-form-item>
        <el-form-item label="叉车其他人员" prop="forkliftExtra">
          <el-input v-model="form.forkliftExtra" placeholder="请输入叉车其他人员" />
        </el-form-item>
        <el-form-item label="装卸托数" prop="loadingQty">
          <el-input v-model="form.loadingQty" placeholder="请输入装卸托数" />
        </el-form-item>
        <el-form-item label="装卸开始时间" prop="loadingStart">
          <el-date-picker clearable
            v-model="form.loadingStart"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择装卸开始时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="装卸完成时间" prop="loadingFinish">
          <el-date-picker clearable
            v-model="form.loadingFinish"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择装卸完成时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="装卸点释放时间" prop="pointReleaseTime">
          <el-date-picker clearable
            v-model="form.pointReleaseTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择装卸点释放时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="到达码头时间(撞栏)" prop="arriveTime">
          <el-date-picker clearable
            v-model="form.arriveTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择到达码头时间(撞栏)">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="驶离码头时间" prop="leaveTime">
          <el-date-picker clearable
            v-model="form.leaveTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择驶离码头时间">
          </el-date-picker>
        </el-form-item>
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
        <el-form-item label="时间明细ID" prop="planTimeDetailId">
          <el-input v-model="form.planTimeDetailId" placeholder="请输入时间明细ID" />
        </el-form-item>
        <el-form-item label="排队序号" prop="queueNumber">
          <el-input v-model="form.queueNumber" placeholder="请输入排队序号" />
        </el-form-item>
        <el-form-item label="预计等待时间" prop="expectWaitTime">
          <el-input v-model="form.expectWaitTime" placeholder="请输入预计等待时间" />
        </el-form-item>
        <el-form-item label="是否作业完成插队" prop="isWorkedJump">
          <el-input v-model="form.isWorkedJump" placeholder="请输入是否作业完成插队" />
        </el-form-item>
        <el-form-item label="码头顺序" prop="dockSort">
          <el-input v-model="form.dockSort" placeholder="请输入码头顺序" />
        </el-form-item>
        <el-form-item label="停车位ID" prop="parkingId">
          <el-input v-model="form.parkingId" placeholder="请输入停车位ID" />
        </el-form-item>
        <el-form-item label="车型" prop="carModel">
          <el-input v-model="form.carModel" placeholder="请输入车型" />
        </el-form-item>
        <el-form-item label="停车位编码" prop="parkingCode">
          <el-input v-model="form.parkingCode" placeholder="请输入停车位编码" />
        </el-form-item>
        <el-form-item label="装卸任务编码" prop="loadingTaskCode">
          <el-input v-model="form.loadingTaskCode" placeholder="请输入装卸任务编码" />
        </el-form-item>
        <el-form-item label="厂区ID" prop="factoryAreaId">
          <el-input v-model="form.factoryAreaId" placeholder="请输入厂区ID" />
        </el-form-item>
        <el-form-item label="厂区名称" prop="factoryAreaName">
          <el-input v-model="form.factoryAreaName" placeholder="请输入厂区名称" />
        </el-form-item>
        <el-form-item label="厂区部门ID" prop="areaDeptId">
          <el-input v-model="form.areaDeptId" placeholder="请输入厂区部门ID" />
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
import { listDock, getDock, delDock, addDock, updateDock } from "@/api/system/dock";

export default {
  name: "Dock",
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
      // 预约任务-码头明细表格数据
      dockList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        taskId: null,
        lineNo: null,
        dockId: null,
        dockName: null,
        dockCode: null,
        dockStart: null,
        dockEnd: null,
        loadingPointId: null,
        loadingPointCode: null,
        loadingPointName: null,
        forkliftDriverId: null,
        forkliftDriverName: null,
        forkliftNo: null,
        forkliftExtra: null,
        loadingQty: null,
        loadingStart: null,
        loadingFinish: null,
        pointReleaseTime: null,
        arriveTime: null,
        leaveTime: null,
        workStatus: null,
        factoryId: null,
        factoryName: null,
        deptId: null,
        deleted: null,
        createDate: null,
        updateDate: null,
        planTimeDetailId: null,
        queueNumber: null,
        expectWaitTime: null,
        queueStatus: null,
        isWorkedJump: null,
        dockSort: null,
        parkingId: null,
        carModel: null,
        parkingCode: null,
        loadingTaskCode: null,
        loadingType: null,
        factoryAreaId: null,
        factoryAreaName: null,
        areaDeptId: null
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
    /** 查询预约任务-码头明细列表 */
    getList() {
      this.loading = true;
      listDock(this.queryParams).then(response => {
        this.dockList = response.rows;
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
        taskId: null,
        lineNo: null,
        dockId: null,
        dockName: null,
        dockCode: null,
        dockStart: null,
        dockEnd: null,
        loadingPointId: null,
        loadingPointCode: null,
        loadingPointName: null,
        forkliftDriverId: null,
        forkliftDriverName: null,
        forkliftNo: null,
        forkliftExtra: null,
        loadingQty: null,
        loadingStart: null,
        loadingFinish: null,
        pointReleaseTime: null,
        arriveTime: null,
        leaveTime: null,
        workStatus: "0",
        factoryId: null,
        factoryName: null,
        deptId: null,
        deleted: null,
        createBy: null,
        createDate: null,
        updateBy: null,
        updateDate: null,
        planTimeDetailId: null,
        queueNumber: null,
        expectWaitTime: null,
        queueStatus: "0",
        isWorkedJump: null,
        dockSort: null,
        parkingId: null,
        carModel: null,
        parkingCode: null,
        loadingTaskCode: null,
        loadingType: null,
        factoryAreaId: null,
        factoryAreaName: null,
        areaDeptId: null
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
      this.title = "添加预约任务-码头明细";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getDock(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改预约任务-码头明细";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateDock(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addDock(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除预约任务-码头明细编号为"' + ids + '"的数据项？').then(function() {
        return delDock(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/dock/export', {
        ...this.queryParams
      }, `dock_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
