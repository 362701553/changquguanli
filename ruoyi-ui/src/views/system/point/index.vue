<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="码头ID" prop="dockId">
        <el-input
          v-model="queryParams.dockId"
          placeholder="请输入码头ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="码头编号" prop="dockCode">
        <el-input
          v-model="queryParams.dockCode"
          placeholder="请输入码头编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="码头名称" prop="dockName">
        <el-input
          v-model="queryParams.dockName"
          placeholder="请输入码头名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="装卸点编码" prop="loadingPointCode">
        <el-input
          v-model="queryParams.loadingPointCode"
          placeholder="请输入装卸点编码"
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
      <el-form-item label="业务范围" prop="businessScope">
        <el-input
          v-model="queryParams.businessScope"
          placeholder="请输入业务范围"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="业务大类编号" prop="bizMainCategoryCode">
        <el-input
          v-model="queryParams.bizMainCategoryCode"
          placeholder="请输入业务大类编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="业务大类名称" prop="bizMainCategoryName">
        <el-input
          v-model="queryParams.bizMainCategoryName"
          placeholder="请输入业务大类名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="业务子类编号" prop="bizSubCategoryCode">
        <el-input
          v-model="queryParams.bizSubCategoryCode"
          placeholder="请输入业务子类编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="业务子分类名称" prop="bizSubCategoryName">
        <el-input
          v-model="queryParams.bizSubCategoryName"
          placeholder="请输入业务子分类名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="工厂ID" prop="factoryId">
        <el-input
          v-model="queryParams.factoryId"
          placeholder="请输入工厂ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="工厂名称" prop="factoryName">
        <el-input
          v-model="queryParams.factoryName"
          placeholder="请输入工厂名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="厂区ID" prop="areaId">
        <el-input
          v-model="queryParams.areaId"
          placeholder="请输入厂区ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="厂区名称" prop="areaName">
        <el-input
          v-model="queryParams.areaName"
          placeholder="请输入厂区名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="部门ID" prop="deptId">
        <el-input
          v-model="queryParams.deptId"
          placeholder="请输入部门ID"
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
      <el-form-item label="删除状态：0-未删除，1-已删除" prop="deleted">
        <el-input
          v-model="queryParams.deleted"
          placeholder="请输入删除状态：0-未删除，1-已删除"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否占用(0-否，1-是)" prop="isOccupy">
        <el-input
          v-model="queryParams.isOccupy"
          placeholder="请输入是否占用(0-否，1-是)"
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
          v-hasPermi="['system:point:add']"
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
          v-hasPermi="['system:point:edit']"
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
          v-hasPermi="['system:point:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:point:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="pointList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键ID" align="center" prop="id" />
      <el-table-column label="码头ID" align="center" prop="dockId" />
      <el-table-column label="码头编号" align="center" prop="dockCode" />
      <el-table-column label="码头名称" align="center" prop="dockName" />
      <el-table-column label="装卸点编码" align="center" prop="loadingPointCode" />
      <el-table-column label="装卸点名称" align="center" prop="loadingPointName" />
      <el-table-column label="业务范围" align="center" prop="businessScope" />
      <el-table-column label="业务大类编号" align="center" prop="bizMainCategoryCode" />
      <el-table-column label="业务大类名称" align="center" prop="bizMainCategoryName" />
      <el-table-column label="业务子类编号" align="center" prop="bizSubCategoryCode" />
      <el-table-column label="业务子分类名称" align="center" prop="bizSubCategoryName" />
      <el-table-column label="适用车型" align="center" prop="vehicleTypes" />
      <el-table-column label="状态：1-启用，0-禁用" align="center" prop="status" />
      <el-table-column label="工厂ID" align="center" prop="factoryId" />
      <el-table-column label="工厂名称" align="center" prop="factoryName" />
      <el-table-column label="厂区ID" align="center" prop="areaId" />
      <el-table-column label="厂区名称" align="center" prop="areaName" />
      <el-table-column label="部门ID" align="center" prop="deptId" />
      <el-table-column label="描述" align="center" prop="description" />
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
      <el-table-column label="删除状态：0-未删除，1-已删除" align="center" prop="deleted" />
      <el-table-column label="是否占用(0-否，1-是)" align="center" prop="isOccupy" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:point:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:point:remove']"
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

    <!-- 添加或修改码头装卸点明细对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="码头ID" prop="dockId">
          <el-input v-model="form.dockId" placeholder="请输入码头ID" />
        </el-form-item>
        <el-form-item label="码头编号" prop="dockCode">
          <el-input v-model="form.dockCode" placeholder="请输入码头编号" />
        </el-form-item>
        <el-form-item label="码头名称" prop="dockName">
          <el-input v-model="form.dockName" placeholder="请输入码头名称" />
        </el-form-item>
        <el-form-item label="装卸点编码" prop="loadingPointCode">
          <el-input v-model="form.loadingPointCode" placeholder="请输入装卸点编码" />
        </el-form-item>
        <el-form-item label="装卸点名称" prop="loadingPointName">
          <el-input v-model="form.loadingPointName" placeholder="请输入装卸点名称" />
        </el-form-item>
        <el-form-item label="业务范围" prop="businessScope">
          <el-input v-model="form.businessScope" placeholder="请输入业务范围" />
        </el-form-item>
        <el-form-item label="业务大类编号" prop="bizMainCategoryCode">
          <el-input v-model="form.bizMainCategoryCode" placeholder="请输入业务大类编号" />
        </el-form-item>
        <el-form-item label="业务大类名称" prop="bizMainCategoryName">
          <el-input v-model="form.bizMainCategoryName" placeholder="请输入业务大类名称" />
        </el-form-item>
        <el-form-item label="业务子类编号" prop="bizSubCategoryCode">
          <el-input v-model="form.bizSubCategoryCode" placeholder="请输入业务子类编号" />
        </el-form-item>
        <el-form-item label="业务子分类名称" prop="bizSubCategoryName">
          <el-input v-model="form.bizSubCategoryName" placeholder="请输入业务子分类名称" />
        </el-form-item>
        <el-form-item label="适用车型" prop="vehicleTypes">
          <el-input v-model="form.vehicleTypes" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="工厂ID" prop="factoryId">
          <el-input v-model="form.factoryId" placeholder="请输入工厂ID" />
        </el-form-item>
        <el-form-item label="工厂名称" prop="factoryName">
          <el-input v-model="form.factoryName" placeholder="请输入工厂名称" />
        </el-form-item>
        <el-form-item label="厂区ID" prop="areaId">
          <el-input v-model="form.areaId" placeholder="请输入厂区ID" />
        </el-form-item>
        <el-form-item label="厂区名称" prop="areaName">
          <el-input v-model="form.areaName" placeholder="请输入厂区名称" />
        </el-form-item>
        <el-form-item label="部门ID" prop="deptId">
          <el-input v-model="form.deptId" placeholder="请输入部门ID" />
        </el-form-item>
        <el-form-item label="描述" prop="description">
          <el-input v-model="form.description" type="textarea" placeholder="请输入内容" />
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
        <el-form-item label="删除状态：0-未删除，1-已删除" prop="deleted">
          <el-input v-model="form.deleted" placeholder="请输入删除状态：0-未删除，1-已删除" />
        </el-form-item>
        <el-form-item label="是否占用(0-否，1-是)" prop="isOccupy">
          <el-input v-model="form.isOccupy" placeholder="请输入是否占用(0-否，1-是)" />
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
import { listPoint, getPoint, delPoint, addPoint, updatePoint } from "@/api/system/point";

export default {
  name: "Point",
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
      // 码头装卸点明细表格数据
      pointList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        dockId: null,
        dockCode: null,
        dockName: null,
        loadingPointCode: null,
        loadingPointName: null,
        businessScope: null,
        bizMainCategoryCode: null,
        bizMainCategoryName: null,
        bizSubCategoryCode: null,
        bizSubCategoryName: null,
        vehicleTypes: null,
        status: null,
        factoryId: null,
        factoryName: null,
        areaId: null,
        areaName: null,
        deptId: null,
        description: null,
        createDate: null,
        updateDate: null,
        deleted: null,
        isOccupy: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        dockId: [
          { required: true, message: "码头ID不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询码头装卸点明细列表 */
    getList() {
      this.loading = true;
      listPoint(this.queryParams).then(response => {
        this.pointList = response.rows;
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
        dockId: null,
        dockCode: null,
        dockName: null,
        loadingPointCode: null,
        loadingPointName: null,
        businessScope: null,
        bizMainCategoryCode: null,
        bizMainCategoryName: null,
        bizSubCategoryCode: null,
        bizSubCategoryName: null,
        vehicleTypes: null,
        status: 0,
        factoryId: null,
        factoryName: null,
        areaId: null,
        areaName: null,
        deptId: null,
        description: null,
        createBy: null,
        createDate: null,
        updateBy: null,
        updateDate: null,
        deleted: null,
        isOccupy: null
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
      this.title = "添加码头装卸点明细";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getPoint(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改码头装卸点明细";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updatePoint(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPoint(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除码头装卸点明细编号为"' + ids + '"的数据项？').then(function() {
        return delPoint(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/point/export', {
        ...this.queryParams
      }, `point_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
