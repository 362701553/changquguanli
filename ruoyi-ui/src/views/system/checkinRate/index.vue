<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
      <el-form-item label="预约日期" prop="appointmentDate">
        <el-date-picker
          v-model="queryParams.appointmentDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择预约日期"
          clearable
          style="width: 200px;"
        />
      </el-form-item>
      <el-form-item label="司机名称" prop="driverName">
        <el-input
          v-model="queryParams.driverName"
          placeholder="请输入司机名称"
          clearable
          @keyup.enter.native="handleQuery"
          style="width: 200px;"
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
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="rateList" border stripe>
      <el-table-column label="司机姓名" align="center" prop="driverName" min-width="120" />
      <el-table-column label="司机电话" align="center" prop="driverPhone" min-width="120" />
      <el-table-column label="总任务数" align="center" prop="totalCount" min-width="100">
        <template slot-scope="scope">
          <el-button type="text" @click="handleDetail(scope.row, 'total')">
            <span class="link-number">{{ scope.row.totalCount }}</span>
          </el-button>
        </template>
      </el-table-column>
      <el-table-column label="签到及时任务数" align="center" prop="onTimeCount" min-width="130">
        <template slot-scope="scope">
          <el-button type="text" @click="handleDetail(scope.row, 'onTime')">
            <span class="link-number success-text">{{ scope.row.onTimeCount }}</span>
          </el-button>
        </template>
      </el-table-column>
      <el-table-column label="签到不及时任务数" align="center" prop="lateCount" min-width="140">
        <template slot-scope="scope">
          <el-button type="text" @click="handleDetail(scope.row, 'late')">
            <span class="link-number danger-text">{{ scope.row.lateCount }}</span>
          </el-button>
        </template>
      </el-table-column>
      <el-table-column label="签到及时率" align="center" prop="onTimeRate" min-width="120">
        <template slot-scope="scope">
          <el-tag :type="getRateTagType(scope.row.onTimeRate)">{{ scope.row.onTimeRate }}%</el-tag>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 明细弹窗 -->
    <el-dialog :title="detailTitle" :visible.sync="detailOpen" width="1100px" append-to-body class="detail-dialog">
      <el-table v-loading="detailLoading" :data="detailList" border stripe max-height="500">
        <el-table-column label="任务编号" align="center" prop="taskCode" min-width="160" />
        <el-table-column label="司机姓名" align="center" prop="outDriverName" min-width="100" />
        <el-table-column label="司机电话" align="center" prop="outDriverPhone" min-width="120" />
        <el-table-column label="预约日期" align="center" prop="appointmentStart" min-width="120">
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.appointmentStart, '{y}-{m}-{d}') }}</span>
          </template>
        </el-table-column>
        <el-table-column label="预约时段" align="center" min-width="150">
          <template slot-scope="scope">
            <span v-if="scope.row.appointmentStart && scope.row.appointmentEnd">
              {{ parseTime(scope.row.appointmentStart, '{h}:{i}') }} - {{ parseTime(scope.row.appointmentEnd, '{h}:{i}') }}
            </span>
          </template>
        </el-table-column>
        <el-table-column label="签到时间" align="center" prop="checkinTime" min-width="150">
          <template slot-scope="scope">
            <span>{{ scope.row.checkinTime ? parseTime(scope.row.checkinTime, '{y}-{m}-{d} {h}:{i}') : '-' }}</span>
          </template>
        </el-table-column>
        <el-table-column label="是否及时" align="center" prop="isOnTime" min-width="100">
          <template slot-scope="scope">
            <el-tag :type="scope.row.isOnTime === '1' ? 'success' : 'danger'">
              {{ scope.row.isOnTime === '1' ? '及时' : '不及时' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="任务状态" align="center" prop="taskStatus" min-width="100">
          <template slot-scope="scope">
            <el-tag :type="statusTagType(scope.row.taskStatus)">{{ statusText(scope.row.taskStatus) }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="预约码头" align="center" prop="dockNames" min-width="120">
          <template slot-scope="scope">
            <span>{{ scope.row.dockNames || '-' }}</span>
          </template>
        </el-table-column>
      </el-table>
      <pagination
        v-show="detailTotal > 0"
        :total="detailTotal"
        :page.sync="detailParams.pageNum"
        :limit.sync="detailParams.pageSize"
        @pagination="getDetailList"
      />
      <div slot="footer" class="dialog-footer">
        <el-button @click="detailOpen = false">关 闭</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listCheckinRate, listCheckinRateDetail } from "@/api/system/checkinRate";

export default {
  name: "CheckinRate",
  data() {
    return {
      loading: true,
      showSearch: true,
      total: 0,
      rateList: [],
      detailOpen: false,
      detailTitle: "",
      detailLoading: false,
      detailList: [],
      detailTotal: 0,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        appointmentDate: this.formatDate(new Date()),
        driverName: null
      },
      detailParams: {
        pageNum: 1,
        pageSize: 10,
        driverName: null,
        appointmentDate: null,
        type: null
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    formatDate(date) {
      const y = date.getFullYear();
      const m = String(date.getMonth() + 1).padStart(2, '0');
      const d = String(date.getDate()).padStart(2, '0');
      return `${y}-${m}-${d}`;
    },
    getList() {
      this.loading = true;
      listCheckinRate(this.queryParams).then(response => {
        this.rateList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    resetQuery() {
      this.resetForm("queryForm");
      this.queryParams.appointmentDate = this.formatDate(new Date());
      this.handleQuery();
    },
    handleDetail(row, type) {
      const typeMap = {
        total: '全部任务',
        onTime: '签到及时任务',
        late: '签到不及时任务'
      };
      this.detailTitle = row.driverName + ' - ' + typeMap[type] + '明细';
      this.detailParams = {
        pageNum: 1,
        pageSize: 10,
        driverName: row.driverName,
        appointmentDate: this.queryParams.appointmentDate,
        type: type
      };
      this.detailOpen = true;
      this.getDetailList();
    },
    getDetailList() {
      this.detailLoading = true;
      listCheckinRateDetail(this.detailParams).then(response => {
        this.detailList = response.rows;
        this.detailTotal = response.total;
        this.detailLoading = false;
      });
    },
    getRateTagType(rate) {
      if (rate >= 90) return 'success';
      if (rate >= 70) return 'warning';
      return 'danger';
    },
    statusText(status) {
      const map = { '0': '待签到', '1': '待作业', '2': '作业中', '3': '已完成', '4': '待入厂', '5': '待签出', '6': '已结束' };
      return map[status] || '未知';
    },
    statusTagType(status) {
      const map = { '0': 'info', '1': 'warning', '2': '', '3': 'success', '4': 'danger', '5': 'warning', '6': 'success' };
      return map[status] || 'info';
    },
    handleExport() {
      this.download('system/checkinRate/export', {
        ...this.queryParams
      }, `checkinRate_${new Date().getTime()}.xlsx`);
    }
  }
};
</script>

<style scoped>
.link-number {
  font-size: 16px;
  font-weight: bold;
  cursor: pointer;
}
.success-text {
  color: #67c23a;
}
.danger-text {
  color: #f56c6c;
}
.detail-dialog >>> .el-dialog__body {
  padding: 15px 20px;
  max-height: 600px;
  overflow-y: auto;
}
</style>
