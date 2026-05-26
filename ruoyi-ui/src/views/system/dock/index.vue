<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="90px">
      <el-form-item label="码头名称" prop="dockName">
        <el-input
          v-model="queryParams.dockName"
          placeholder="请输入码头名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="有效状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择" clearable>
          <el-option label="启用" :value="1" />
          <el-option label="停用" :value="0" />
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
      <el-table-column label="码头名称" align="center" prop="dockName" />
      <el-table-column label="叉车每托货卸货时长(分钟)" align="center" prop="unloadingDuration" />
      <el-table-column label="叉车每托货装货时长(分钟)" align="center" prop="loadingDuration" />
      <el-table-column label="码头工作时间" align="center" prop="workDays">
        <template slot-scope="scope">
          <span>{{ formatWorkDays(scope.row.workDays) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="有效状态" align="center" prop="status">
        <template slot-scope="scope">
          <el-tag :type="scope.row.status === 1 ? 'success' : 'danger'">
            {{ scope.row.status === 1 ? '启用' : '停用' }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="180">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleDetail(scope.row)"
            v-hasPermi="['system:dock:query']"
          >详情</el-button>
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

    <!-- 添加或修改码头对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="180px" :disabled="isDetail">
        <el-form-item label="码头名称" prop="dockName">
          <el-input v-model="form.dockName" placeholder="请输入码头名称" />
        </el-form-item>
        <el-form-item label="叉车每托货卸货时长(分钟)" prop="unloadingDuration">
          <el-input-number v-model="form.unloadingDuration" :min="0" :precision="1" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="叉车每托货装货时长(分钟)" prop="loadingDuration">
          <el-input-number v-model="form.loadingDuration" :min="0" :precision="1" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="码头工作时间设置" prop="workDays">
          <el-select v-model="form.workDaysList" multiple placeholder="请选择工作日">
            <el-option label="周一" value="1" />
            <el-option label="周二" value="2" />
            <el-option label="周三" value="3" />
            <el-option label="周四" value="4" />
            <el-option label="周五" value="5" />
            <el-option label="周六" value="6" />
            <el-option label="周日" value="7" />
          </el-select>
        </el-form-item>
        <el-form-item label="有效状态" prop="status">
          <el-select v-model="form.status" placeholder="请选择">
            <el-option label="启用" :value="1" />
            <el-option label="停用" :value="0" />
          </el-select>
        </el-form-item>
      </el-form>

      <!-- 装卸点明细 -->
      <div style="margin: 10px 20px;">
        <el-divider content-position="left">装卸点明细</el-divider>
        <el-button
          v-if="!isDetail"
          type="primary"
          size="mini"
          icon="el-icon-plus"
          @click="addLoadingPoint"
          style="margin-bottom: 10px;"
        >新增装卸点</el-button>
        <el-table :data="form.loadingPointList" border size="small">
          <el-table-column label="编码" align="center" prop="loadingPointCode">
            <template slot-scope="scope">
              <el-input v-if="!isDetail" v-model="scope.row.loadingPointCode" size="small" placeholder="请输入编码" />
              <span v-else>{{ scope.row.loadingPointCode }}</span>
            </template>
          </el-table-column>
          <el-table-column label="有效状态" align="center" prop="status" width="150">
            <template slot-scope="scope">
              <el-select v-if="!isDetail" v-model="scope.row.status" size="small" placeholder="请选择">
                <el-option label="启用" :value="1" />
                <el-option label="停用" :value="0" />
              </el-select>
              <el-tag v-else :type="scope.row.status === 1 ? 'success' : 'danger'">
                {{ scope.row.status === 1 ? '启用' : '停用' }}
              </el-tag>
            </template>
          </el-table-column>
          <el-table-column v-if="!isDetail" label="操作" align="center" width="80">
            <template slot-scope="scope">
              <el-button type="text" size="small" icon="el-icon-delete" @click="removeLoadingPoint(scope.$index)">删除</el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>

      <!-- 停车位明细 -->
      <div style="margin: 10px 20px;">
        <el-divider content-position="left">停车位明细</el-divider>
        <el-button
          v-if="!isDetail"
          type="primary"
          size="mini"
          icon="el-icon-plus"
          @click="addParkingSpace"
          style="margin-bottom: 10px;"
        >新增停车位</el-button>
        <el-table :data="form.parkingSpaceList" border size="small">
          <el-table-column label="编码" align="center" prop="parkingSpaceCode">
            <template slot-scope="scope">
              <el-input v-if="!isDetail" v-model="scope.row.parkingSpaceCode" size="small" placeholder="请输入编码" />
              <span v-else>{{ scope.row.parkingSpaceCode }}</span>
            </template>
          </el-table-column>
          <el-table-column label="有效状态" align="center" prop="status" width="150">
            <template slot-scope="scope">
              <el-select v-if="!isDetail" v-model="scope.row.status" size="small" placeholder="请选择">
                <el-option label="启用" :value="1" />
                <el-option label="停用" :value="0" />
              </el-select>
              <el-tag v-else :type="scope.row.status === 1 ? 'success' : 'danger'">
                {{ scope.row.status === 1 ? '启用' : '停用' }}
              </el-tag>
            </template>
          </el-table-column>
          <el-table-column v-if="!isDetail" label="操作" align="center" width="80">
            <template slot-scope="scope">
              <el-button type="text" size="small" icon="el-icon-delete" @click="removeParkingSpace(scope.$index)">删除</el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>

      <div slot="footer" class="dialog-footer" v-if="!isDetail">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
      <div slot="footer" class="dialog-footer" v-else>
        <el-button @click="cancel">关 闭</el-button>
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
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      dockList: [],
      title: "",
      open: false,
      isDetail: false,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        dockName: null,
        status: null
      },
      form: {},
      rules: {
        dockName: [
          { required: true, message: "码头名称不能为空", trigger: "blur" }
        ]
      },
      workDaysMap: { '1': '周一', '2': '周二', '3': '周三', '4': '周四', '5': '周五', '6': '周六', '7': '周日' }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    getList() {
      this.loading = true;
      listDock(this.queryParams).then(response => {
        this.dockList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    formatWorkDays(workDays) {
      if (!workDays) return '';
      return workDays.split(',').map(d => this.workDaysMap[d] || d).join('、');
    },
    cancel() {
      this.open = false;
      this.reset();
    },
    reset() {
      this.form = {
        id: null,
        dockName: null,
        unloadingDuration: null,
        loadingDuration: null,
        workDays: null,
        workDaysList: [],
        status: 1,
        loadingPointList: [],
        parkingSpaceList: []
      };
      this.isDetail = false;
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
      this.title = "新增码头";
    },
    handleDetail(row) {
      this.reset();
      getDock(row.id).then(response => {
        this.form = response.data;
        this.form.workDaysList = this.form.workDays ? this.form.workDays.split(',') : [];
        if (!this.form.loadingPointList) this.form.loadingPointList = [];
        if (!this.form.parkingSpaceList) this.form.parkingSpaceList = [];
        this.isDetail = true;
        this.open = true;
        this.title = "码头详情";
      });
    },
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids[0];
      getDock(id).then(response => {
        this.form = response.data;
        this.form.workDaysList = this.form.workDays ? this.form.workDays.split(',') : [];
        if (!this.form.loadingPointList) this.form.loadingPointList = [];
        if (!this.form.parkingSpaceList) this.form.parkingSpaceList = [];
        this.open = true;
        this.title = "修改码头";
      });
    },
    addLoadingPoint() {
      this.form.loadingPointList.push({
        loadingPointCode: '',
        status: 1,
        isOccupy: '0'
      });
    },
    removeLoadingPoint(index) {
      this.form.loadingPointList.splice(index, 1);
    },
    addParkingSpace() {
      this.form.parkingSpaceList.push({
        parkingSpaceCode: '',
        status: 1,
        isOccupy: '0'
      });
    },
    removeParkingSpace(index) {
      this.form.parkingSpaceList.splice(index, 1);
    },
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          // 将workDaysList转为逗号分隔字符串
          this.form.workDays = this.form.workDaysList ? this.form.workDaysList.join(',') : '';
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
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除所选码头数据？').then(function() {
        return delDock(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    handleExport() {
      this.download('system/dock/export', {
        ...this.queryParams
      }, `dock_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
