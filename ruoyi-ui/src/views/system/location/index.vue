<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="90px">
      <el-form-item label="设备序列号" prop="deviceSn">
        <el-input v-model="queryParams.deviceSn" placeholder="请输入设备序列号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="设备状态" prop="deviceStatus">
        <el-select v-model="queryParams.deviceStatus" placeholder="请选择" clearable>
          <el-option label="空闲中" value="idle" />
          <el-option label="使用中" value="using" />
          <el-option label="已报废" value="scrapped" />
        </el-select>
      </el-form-item>
      <el-form-item label="工厂名称" prop="factoryName">
        <el-input v-model="queryParams.factoryName" placeholder="请输入工厂名称" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['system:location:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate" v-hasPermi="['system:location:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete" v-hasPermi="['system:location:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport" v-hasPermi="['system:location:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="locationList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="设备序列号" align="center" prop="deviceSn" min-width="140" />
      <el-table-column label="RFID标签" align="center" prop="rfidTag" min-width="120" />
      <el-table-column label="设备状态" align="center" prop="deviceStatus" width="90">
        <template slot-scope="scope">
          <el-tag :type="statusTagType(scope.row.deviceStatus)">{{ statusText(scope.row.deviceStatus) }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="电量" align="center" prop="batteryLevel" width="70">
        <template slot-scope="scope">
          <span>{{ scope.row.batteryLevel != null ? scope.row.batteryLevel + '%' : '-' }}</span>
        </template>
      </el-table-column>
      <el-table-column label="产品型号" align="center" prop="productModel" min-width="100" />
      <el-table-column label="产品名称" align="center" prop="productName" min-width="120" />
      <el-table-column label="所属工厂" align="center" prop="factoryName" min-width="120" />
      <el-table-column label="厂区" align="center" prop="areaName" min-width="100" />
      <el-table-column label="占用任务" align="center" prop="taskCode" min-width="140">
        <template slot-scope="scope">
          <span>{{ scope.row.taskCode || '-' }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="180">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['system:location:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['system:location:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList" />

    <!-- 添加或修改定位设备对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="设备序列号" prop="deviceSn">
          <el-input v-model="form.deviceSn" placeholder="请输入设备序列号" />
        </el-form-item>
        <el-form-item label="RFID标签号" prop="rfidTag">
          <el-input v-model="form.rfidTag" placeholder="请输入RFID标签号" />
        </el-form-item>
        <el-form-item label="设备状态" prop="deviceStatus">
          <el-select v-model="form.deviceStatus" placeholder="请选择">
            <el-option label="空闲中" value="idle" />
            <el-option label="使用中" value="using" />
            <el-option label="已报废" value="scrapped" />
          </el-select>
        </el-form-item>
        <el-form-item label="启用状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio :label="1">启用</el-radio>
            <el-radio :label="0">禁用</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="产品序列号" prop="productSn">
          <el-input v-model="form.productSn" placeholder="请输入产品序列号" />
        </el-form-item>
        <el-form-item label="产品型号" prop="productModel">
          <el-input v-model="form.productModel" placeholder="请输入产品型号" />
        </el-form-item>
        <el-form-item label="产品名称" prop="productName">
          <el-input v-model="form.productName" placeholder="请输入产品名称" />
        </el-form-item>
        <el-form-item label="设备类别" prop="deviceCategory">
          <el-input v-model="form.deviceCategory" placeholder="请输入设备类别" />
        </el-form-item>
        <el-form-item label="所属工厂" prop="factoryName">
          <el-input v-model="form.factoryName" placeholder="请输入所属工厂" />
        </el-form-item>
        <el-form-item label="厂区名称" prop="areaName">
          <el-input v-model="form.areaName" placeholder="请输入厂区名称" />
        </el-form-item>
        <el-form-item label="频率" prop="frequency">
          <el-input v-model="form.frequency" placeholder="请输入频率" type="number" />
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
import { listLocation, getLocation, addLocation, updateLocation, delLocation } from "@/api/system/location";

export default {
  name: "Location",
  data() {
    return {
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      locationList: [],
      title: "",
      open: false,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        deviceSn: null,
        deviceStatus: null,
        factoryName: null
      },
      form: {},
      rules: {
        deviceSn: [
          { required: true, message: "设备序列号不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    getList() {
      this.loading = true;
      listLocation(this.queryParams).then(response => {
        this.locationList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    statusText(status) {
      const map = { 'idle': '空闲中', 'using': '使用中', 'scrapped': '已报废' };
      return map[status] || status;
    },
    statusTagType(status) {
      const map = { 'idle': 'success', 'using': 'warning', 'scrapped': 'danger' };
      return map[status] || 'info';
    },
    cancel() {
      this.open = false;
      this.reset();
    },
    reset() {
      this.form = {
        id: null,
        deviceSn: null,
        rfidTag: null,
        deviceStatus: 'idle',
        status: 1,
        productSn: null,
        productModel: null,
        productName: null,
        deviceCategory: null,
        factoryName: null,
        areaName: null,
        frequency: null
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
      this.title = "新增定位设备";
    },
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids[0];
      getLocation(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改定位设备";
      });
    },
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateLocation(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addLocation(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除定位设备编号为"' + ids + '"的数据项？').then(() => {
        return delLocation(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    handleExport() {
      this.download('system/location/export', {
        ...this.queryParams
      }, `location_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
