<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="叉车编号" prop="forkliftCode">
        <el-input
          v-model="queryParams.forkliftCode"
          placeholder="请输入叉车编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="叉车名称" prop="forkliftName">
        <el-input
          v-model="queryParams.forkliftName"
          placeholder="请输入叉车名称"
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
          v-hasPermi="['system:forklift:add']"
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
          v-hasPermi="['system:forklift:edit']"
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
          v-hasPermi="['system:forklift:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:forklift:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="forkliftList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="叉车编号" align="center" prop="forkliftCode" />
      <el-table-column label="叉车名称" align="center" prop="forkliftName" />
      <el-table-column label="叉车类型" align="center" prop="forkliftType" />
      <el-table-column label="运营状态" align="center" prop="workStatus">
        <template slot-scope="scope">
          <span v-if="scope.row.workStatus === '0'">空闲</span>
          <span v-else-if="scope.row.workStatus === '1'">占用</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:forklift:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:forklift:remove']"
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

    <!-- 添加或修改叉车对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="叉车编号" prop="forkliftCode">
          <el-input v-model="form.forkliftCode" placeholder="请输入叉车编号" />
        </el-form-item>
        <el-form-item label="叉车名称" prop="forkliftName">
          <el-input v-model="form.forkliftName" placeholder="请输入叉车名称" />
        </el-form-item>
        <el-form-item label="叉车类型" prop="forkliftType">
          <el-input v-model="form.forkliftType" placeholder="请输入叉车类型" />
        </el-form-item>
        <el-form-item label="运营状态" prop="workStatus">
          <el-select v-model="form.workStatus" placeholder="请选择运营状态">
            <el-option label="空闲" value="0" />
            <el-option label="占用" value="1" />
          </el-select>
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
import { listForklift, getForklift, delForklift, addForklift, updateForklift } from "@/api/system/forklift";

export default {
  name: "Forklift",
  data() {
    return {
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      forkliftList: [],
      title: "",
      open: false,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        forkliftCode: null,
        forkliftName: null
      },
      form: {},
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    getList() {
      this.loading = true;
      listForklift(this.queryParams).then(response => {
        this.forkliftList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    cancel() {
      this.open = false;
      this.reset();
    },
    reset() {
      this.form = {
        id: null,
        forkliftCode: null,
        forkliftName: null,
        forkliftType: null,
        workStatus: "0"
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
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加叉车";
    },
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getForklift(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改叉车";
      });
    },
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateForklift(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addForklift(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除叉车编号为"' + ids + '"的数据项？').then(function() {
        return delForklift(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    handleExport() {
      this.download('system/forklift/export', {
        ...this.queryParams
      }, `forklift_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
