<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
      <el-form-item label="任务编号" prop="taskCode">
        <el-input
          v-model="queryParams.taskCode"
          placeholder="请输入任务编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="司机姓名" prop="outDriverName">
        <el-input
          v-model="queryParams.outDriverName"
          placeholder="请输入司机姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="任务状态" prop="taskStatus">
        <el-select v-model="queryParams.taskStatus" placeholder="请选择状态" clearable>
          <el-option label="待签到" value="0" />
          <el-option label="已签到" value="1" />
          <el-option label="作业中" value="2" />
          <el-option label="已完成" value="3" />
        </el-select>
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
      <el-table-column label="任务编号" align="center" prop="taskCode" min-width="160" />
      <el-table-column label="司机姓名" align="center" prop="outDriverName" min-width="100" />
      <el-table-column label="司机电话" align="center" prop="outDriverPhone" min-width="120" />
      <el-table-column label="预约日期" align="center" prop="appointmentStart" min-width="160">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.appointmentStart, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="预约时段" align="center" min-width="160">
        <template slot-scope="scope">
          <span v-if="scope.row.appointmentStart && scope.row.appointmentEnd">
            {{ parseTime(scope.row.appointmentStart, '{h}:{i}') }} - {{ parseTime(scope.row.appointmentEnd, '{h}:{i}') }}
          </span>
        </template>
      </el-table-column>
      <el-table-column label="任务状态" align="center" prop="taskStatus" min-width="100">
        <template slot-scope="scope">
          <el-tag :type="statusTagType(scope.row.taskStatus)">{{ statusText(scope.row.taskStatus) }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createDate" min-width="160">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createDate, '{y}-{m}-{d} {h}:{i}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="180">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleView(scope.row)"
          >查看</el-button>
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

    <!-- 新增预约任务对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="选择司机" prop="outDriverId">
          <el-select v-model="form.outDriverId" placeholder="请选择司机" filterable style="width: 100%;" @change="handleDriverChange">
            <el-option
              v-for="driver in driverList"
              :key="driver.id"
              :label="driver.driverName + '（' + driver.phone + '）'"
              :value="driver.id"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="预约日期" prop="appointmentDate">
          <el-date-picker
            v-model="form.appointmentDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择预约日期"
            style="width: 100%;"
            :picker-options="datePickerOptions"
          />
        </el-form-item>
        <el-form-item label="预约时段" required>
          <el-col :span="11">
            <el-form-item prop="appointmentStartTime" style="margin-bottom: 0;">
              <el-time-picker
                v-model="form.appointmentStartTime"
                value-format="HH:mm"
                format="HH:mm"
                placeholder="开始时间"
                style="width: 100%;"
                :picker-options="computedStartTimeOptions"
              />
            </el-form-item>
          </el-col>
          <el-col :span="2" style="text-align: center; line-height: 36px;">-</el-col>
          <el-col :span="11">
            <el-form-item prop="appointmentEndTime" style="margin-bottom: 0;">
              <el-time-picker
                v-model="form.appointmentEndTime"
                value-format="HH:mm"
                format="HH:mm"
                placeholder="结束时间"
                style="width: 100%;"
                :picker-options="computedEndTimeOptions"
              />
            </el-form-item>
          </el-col>
        </el-form-item>
        <el-form-item label="预约码头" prop="dockIds">
          <el-select v-model="form.dockIds" multiple placeholder="请选择码头" filterable style="width: 100%;">
            <el-option
              v-for="dock in dockList"
              :key="dock.id"
              :label="dock.dockName"
              :value="dock.id"
            />
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 查看详情对话框 -->
    <el-dialog title="任务详情" :visible.sync="viewOpen" width="700px" append-to-body>
      <el-descriptions :column="2" border>
        <el-descriptions-item label="任务编号">{{ viewForm.taskCode }}</el-descriptions-item>
        <el-descriptions-item label="任务状态">
          <el-tag :type="statusTagType(viewForm.taskStatus)">{{ statusText(viewForm.taskStatus) }}</el-tag>
        </el-descriptions-item>
        <el-descriptions-item label="司机姓名">{{ viewForm.outDriverName }}</el-descriptions-item>
        <el-descriptions-item label="司机电话">{{ viewForm.outDriverPhone }}</el-descriptions-item>
        <el-descriptions-item label="预约日期">{{ parseTime(viewForm.appointmentStart, '{y}-{m}-{d}') }}</el-descriptions-item>
        <el-descriptions-item label="预约时段">
          <span v-if="viewForm.appointmentStart && viewForm.appointmentEnd">
            {{ parseTime(viewForm.appointmentStart, '{h}:{i}') }} - {{ parseTime(viewForm.appointmentEnd, '{h}:{i}') }}
          </span>
        </el-descriptions-item>
        <el-descriptions-item label="创建时间" :span="2">{{ parseTime(viewForm.createDate, '{y}-{m}-{d} {h}:{i}:{s}') }}</el-descriptions-item>
      </el-descriptions>
      <el-divider content-position="left">码头明细</el-divider>
      <el-table :data="viewDockList" border style="width: 100%;">
        <el-table-column label="序号" type="index" width="60" align="center" />
        <el-table-column label="码头名称" align="center" prop="dockName" />
        <el-table-column label="码头编码" align="center" prop="dockCode" />
        <el-table-column label="装卸任务号" align="center" prop="loadingTaskCode">
          <template slot-scope="scope">
            <span>{{ scope.row.loadingTaskCode || '-' }}</span>
          </template>
        </el-table-column>
        <el-table-column label="作业状态" align="center" prop="workStatus">
          <template slot-scope="scope">
            <el-tag :type="dockStatusTagType(scope.row.workStatus)">{{ dockStatusText(scope.row.workStatus) }}</el-tag>
          </template>
        </el-table-column>
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button @click="viewOpen = false">关 闭</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listTask, getTask, delTask, addTask } from "@/api/system/task";
import { listDock } from "@/api/system/dock";
import { listVehicle } from "@/api/system/vehicle";

export default {
  name: "Task",
  data() {
    return {
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      taskList: [],
      title: "",
      open: false,
      viewOpen: false,
      viewForm: {},
      viewDockList: [],
      driverList: [],
      dockList: [],
      datePickerOptions: {
        disabledDate(time) {
          return time.getTime() < Date.now() - 86400000;
        }
      },
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        taskCode: null,
        outDriverName: null,
        taskStatus: null
      },
      form: {},
      rules: {
        outDriverId: [{ required: true, message: "请选择司机", trigger: "change" }],
        appointmentDate: [{ required: true, message: "请选择预约日期", trigger: "change" }],
        appointmentStartTime: [{ required: true, message: "请选择开始时间", trigger: "change" }],
        appointmentEndTime: [{ required: true, message: "请选择结束时间", trigger: "change" }],
        dockIds: [{ required: true, message: "请选择至少一个码头", trigger: "change", type: "array", min: 1 }]
      }
    };
  },
  computed: {
    computedStartTimeOptions() {
      const today = this.formatDate(new Date());
      if (this.form.appointmentDate === today) {
        const now = new Date();
        const h = String(now.getHours()).padStart(2, '0');
        const m = String(now.getMinutes()).padStart(2, '0');
        return { selectableRange: `${h}:${m}:00 - 23:59:59` };
      }
      return {};
    },
    computedEndTimeOptions() {
      if (this.form.appointmentStartTime) {
        return { selectableRange: `${this.form.appointmentStartTime}:00 - 23:59:59` };
      }
      return {};
    }
  },
  created() {
    this.getList();
    this.loadDriverList();
    this.loadDockList();
  },
  methods: {
    getList() {
      this.loading = true;
      listTask(this.queryParams).then(response => {
        this.taskList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    loadDriverList() {
      listVehicle({ pageNum: 1, pageSize: 999 }).then(response => {
        this.driverList = response.rows;
      });
    },
    loadDockList() {
      listDock({ pageNum: 1, pageSize: 999, status: 1 }).then(response => {
        this.dockList = response.rows;
      });
    },
    handleDriverChange(driverId) {
      const driver = this.driverList.find(d => d.id === driverId);
      if (driver) {
        this.form.outDriverName = driver.driverName;
        this.form.outDriverPhone = driver.phone;
      }
    },
    statusText(status) {
      const map = { '0': '待签到', '1': '已签到', '2': '作业中', '3': '已完成' };
      return map[status] || '未知';
    },
    statusTagType(status) {
      const map = { '0': 'info', '1': 'warning', '2': '', '3': 'success' };
      return map[status] || 'info';
    },
    dockStatusText(status) {
      const map = { '0': '待作业', '1': '作业中', '2': '已完成' };
      return map[status] || '未知';
    },
    dockStatusTagType(status) {
      const map = { '0': 'info', '1': '', '2': 'success' };
      return map[status] || 'info';
    },
    formatDate(date) {
      const y = date.getFullYear();
      const m = String(date.getMonth() + 1).padStart(2, '0');
      const d = String(date.getDate()).padStart(2, '0');
      return `${y}-${m}-${d}`;
    },
    cancel() {
      this.open = false;
      this.reset();
    },
    reset() {
      this.form = {
        id: null,
        outDriverId: null,
        outDriverName: null,
        outDriverPhone: null,
        appointmentDate: null,
        appointmentStartTime: null,
        appointmentEndTime: null,
        dockIds: [],
        taskStatus: "0"
      };
      this.resetForm("form");
    },
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "新增预约任务";
    },
    handleView(row) {
      getTask(row.id).then(response => {
        this.viewForm = response.data;
        this.viewDockList = response.dockList || [];
        this.viewOpen = true;
      });
    },
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          const submitData = { ...this.form };
          submitData.appointmentStart = submitData.appointmentDate + ' ' + submitData.appointmentStartTime + ':00';
          submitData.appointmentEnd = submitData.appointmentDate + ' ' + submitData.appointmentEndTime + ':00';
          addTask(submitData).then(response => {
            this.$modal.msgSuccess("新增成功");
            this.open = false;
            this.getList();
          });
        }
      });
    },
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除该预约任务数据？').then(function() {
        return delTask(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    handleExport() {
      this.download('system/task/export', {
        ...this.queryParams
      }, `task_${new Date().getTime()}.xlsx`);
    }
  }
};
</script>
