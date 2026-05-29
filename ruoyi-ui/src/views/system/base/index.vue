<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="80px">
      <el-form-item label="司机姓名" prop="driverName">
        <el-input
          v-model="queryParams.driverName"
          placeholder="请输入司机姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态" prop="driverStatus">
        <el-select v-model="queryParams.driverStatus" placeholder="请选择状态" clearable>
          <el-option label="启用" value="0" />
          <el-option label="禁用" value="1" />
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
          v-hasPermi="['system:base:add']"
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
          v-hasPermi="['system:base:edit']"
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
          v-hasPermi="['system:base:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="baseList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="序号" type="index" width="60" align="center" />
      <el-table-column label="叉车司机姓名" align="center" prop="driverName" />
      <el-table-column label="状态" align="center" prop="driverStatus" width="80">
        <template slot-scope="scope">
          <span v-if="scope.row.driverStatus === '0'" style="color: #67C23A">启用</span>
          <span v-else-if="scope.row.driverStatus === '1'" style="color: #F56C6C">禁用</span>
        </template>
      </el-table-column>
      <el-table-column label="关联叉车编号" align="center" prop="forkliftCodes">
        <template slot-scope="scope">
          <span>{{ scope.row.forkliftCodes || '无' }}</span>
        </template>
      </el-table-column>
      <el-table-column label="作业状态" align="center" prop="workStatus" width="90">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.workStatus === '1'" type="danger" size="small">作业中</el-tag>
          <el-tag v-else type="success" size="small">待作业</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="200">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleDetail(scope.row)"
            v-hasPermi="['system:base:query']"
          >详情</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:base:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:base:remove']"
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

    <!-- 添加或修改叉车司机信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="司机姓名" prop="driverName">
          <el-input v-model="form.driverName" placeholder="请输入司机姓名" />
        </el-form-item>
        <el-form-item label="联系电话" prop="driverPhone">
          <el-input v-model="form.driverPhone" placeholder="请输入手机号" maxlength="11" @input="handlePhoneInput" />
        </el-form-item>
        <el-form-item label="账号" prop="account">
          <el-input v-model="form.account" placeholder="默认为联系电话，可修改" />
        </el-form-item>
        <el-form-item label="密码" prop="password" v-if="form.id == null">
          <el-input v-model="form.password" type="password" placeholder="请输入密码" show-password />
        </el-form-item>
        <el-form-item label="状态" prop="driverStatus">
          <el-select v-model="form.driverStatus" placeholder="请选择状态">
            <el-option label="启用" value="0" />
            <el-option label="禁用" value="1" />
          </el-select>
        </el-form-item>
        <el-form-item label="关联叉车" prop="forkliftIds">
          <el-select v-model="form.forkliftIds" multiple placeholder="请选择关联叉车" style="width: 100%">
            <el-option
              v-for="item in forkliftOptions"
              :key="item.id"
              :label="item.forkliftCode"
              :value="item.id"
            />
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 详情对话框 -->
    <el-dialog title="叉车司机详情" :visible.sync="detailOpen" width="650px" append-to-body>
      <el-descriptions :column="2" border size="medium">
        <el-descriptions-item label="司机姓名">{{ detailInfo.driverName }}</el-descriptions-item>
        <el-descriptions-item label="联系电话">{{ detailInfo.driverPhone }}</el-descriptions-item>
        <el-descriptions-item label="状态">
          <span v-if="detailInfo.driverStatus === '0'" style="color: #67C23A">启用</span>
          <span v-else-if="detailInfo.driverStatus === '1'" style="color: #F56C6C">禁用</span>
        </el-descriptions-item>
        <el-descriptions-item label="账号">{{ detailInfo.account }}</el-descriptions-item>
        <el-descriptions-item label="作业状态">
          <el-tag v-if="detailInfo.workStatus === '1'" type="danger" size="small">作业中</el-tag>
          <el-tag v-else type="success" size="small">待作业</el-tag>
        </el-descriptions-item>
      </el-descriptions>
      <div style="margin-top: 20px">
        <h4 style="margin-bottom: 10px">关联叉车列表</h4>
        <el-table :data="detailInfo.forkliftList" border size="small" empty-text="暂无关联叉车">
          <el-table-column label="序号" type="index" width="60" align="center" />
          <el-table-column label="叉车编号" align="center" prop="forkliftCode" />
          <el-table-column label="状态" align="center" prop="status" width="80">
            <template slot-scope="scope">
              <span v-if="scope.row.status === '0'">正常</span>
              <span v-else>停用</span>
            </template>
          </el-table-column>
        </el-table>
      </div>
      <div slot="footer" class="dialog-footer">
        <el-button @click="detailOpen = false">关 闭</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listBase, getBase, detailBase, delBase, addBase, updateBase } from "@/api/system/base";
import { listAllForklift } from "@/api/system/forklift";

export default {
  name: "Base",
  data() {
    return {
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      baseList: [],
      forkliftOptions: [],
      title: "",
      open: false,
      detailOpen: false,
      detailInfo: {},
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        driverName: null,
        driverStatus: null
      },
      form: {},
      rules: {
        driverName: [{ required: true, message: "司机姓名不能为空", trigger: "blur" }],
        driverPhone: [
          { required: true, message: "联系电话不能为空", trigger: "blur" },
          { pattern: /^\d+$/, message: "联系电话只能输入数字", trigger: "blur" },
          { pattern: /^1[3-9]\d{9}$/, message: "请输入正确的手机号格式", trigger: "blur" }
        ],
        password: [{ required: true, message: "密码不能为空", trigger: "blur" }]
      }
    };
  },
  created() {
    this.getList();
    this.getForkliftOptions();
  },
  methods: {
    getList() {
      this.loading = true;
      listBase(this.queryParams).then(response => {
        this.baseList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    getForkliftOptions() {
      listAllForklift().then(response => {
        this.forkliftOptions = response.data;
      });
    },
    cancel() {
      this.open = false;
      this.reset();
    },
    reset() {
      this.form = {
        id: null,
        driverName: null,
        driverPhone: null,
        driverStatus: "0",
        account: null,
        password: null,
        forkliftIds: []
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
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加叉车司机";
    },
    handlePhoneInput(val) {
      // 只保留数字
      this.form.driverPhone = val.replace(/\D/g, '');
      // 自动赋值到账号（如果账号为空或账号等于旧手机号）
      if (!this.form.account || this.form.account === this.form._lastPhone) {
        this.form.account = this.form.driverPhone;
      }
      this.form._lastPhone = this.form.driverPhone;
    },
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getBase(id).then(response => {
        this.form = response.data;
        this.form.password = null;
        if (!this.form.forkliftIds) {
          this.form.forkliftIds = [];
        }
        this.open = true;
        this.title = "修改叉车司机";
      });
    },
    handleDetail(row) {
      detailBase(row.id).then(response => {
        this.detailInfo = response.data;
        if (!this.detailInfo.forkliftList) {
          this.detailInfo.forkliftList = [];
        }
        this.detailOpen = true;
      });
    },
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateBase(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addBase(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除叉车司机"' + (row.driverName || ids) + '"的数据项？').then(function() {
        return delBase(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    }
  }
};
</script>
