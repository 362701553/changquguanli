<template>
  <div class="app-container">
    <!-- 搜索栏 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
      <el-form-item label="装卸任务编码" prop="loadingTaskCode">
        <el-input
          v-model="queryParams.loadingTaskCode"
          placeholder="请输入装卸任务编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="时间范围" prop="dateRange">
        <el-date-picker
          v-model="dateRange"
          type="daterange"
          range-separator="至"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
          value-format="yyyy-MM-dd"
          style="width: 240px;"
        />
      </el-form-item>
      <el-form-item label="码头" prop="dockId">
        <el-select v-model="queryParams.dockId" placeholder="请选择码头" clearable filterable>
          <el-option
            v-for="dock in dockList"
            :key="dock.id"
            :label="dock.dockName"
            :value="dock.id"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="装卸类型" prop="loadingType">
        <el-select v-model="queryParams.loadingType" placeholder="请选择" clearable>
          <el-option label="装货" value="装货" />
          <el-option label="卸货" value="卸货" />
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
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 状态统计卡片 -->
    <el-row :gutter="16" style="margin-bottom: 16px;">
      <el-col :span="6">
        <el-card shadow="hover" :class="['stat-card', activeTab === 'all' ? 'active' : '']" @click.native="switchTab('all')">
          <div class="stat-content">
            <div class="stat-number">{{ statCount.all }}</div>
            <div class="stat-label">全部</div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card shadow="hover" :class="['stat-card', activeTab === '0' ? 'active' : '']" @click.native="switchTab('0')">
          <div class="stat-content">
            <div class="stat-number stat-pending">{{ statCount.pending }}</div>
            <div class="stat-label">待作业</div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card shadow="hover" :class="['stat-card', activeTab === '1' ? 'active' : '']" @click.native="switchTab('1')">
          <div class="stat-content">
            <div class="stat-number stat-working">{{ statCount.working }}</div>
            <div class="stat-label">作业中</div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card shadow="hover" :class="['stat-card', activeTab === '2' ? 'active' : '']" @click.native="switchTab('2')">
          <div class="stat-content">
            <div class="stat-number stat-done">{{ statCount.done }}</div>
            <div class="stat-label">已完成</div>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <!-- 状态Tab -->
    <el-tabs v-model="activeTab" @tab-click="handleTabClick" style="margin-bottom: 10px;">
      <el-tab-pane label="全部" name="all"></el-tab-pane>
      <el-tab-pane label="待作业" name="0"></el-tab-pane>
      <el-tab-pane label="作业中" name="1"></el-tab-pane>
      <el-tab-pane label="已完成" name="2"></el-tab-pane>
    </el-tabs>

    <!-- 列表视图 -->
    <el-table v-loading="loading" :data="dockTaskList" border>
      <el-table-column label="装卸任务编码" align="center" prop="loadingTaskCode" min-width="150" />
      <el-table-column label="所属码头" align="center" prop="dockName" min-width="120" />
      <el-table-column label="装卸类型" align="center" prop="loadingType" min-width="80">
        <template slot-scope="scope">
          <el-tag :type="scope.row.loadingType === '装货' ? '' : 'warning'" size="small">{{ scope.row.loadingType || '-' }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="码头顺序" align="center" prop="dockSort" width="90">
        <template slot-scope="scope">
          <el-tag type="info" size="small">第{{ scope.row.dockSort }}个码头</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作优先级" align="center" min-width="120">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.priorityLevel === 'current'" type="danger" size="small" effect="dark">当前操作</el-tag>
          <el-tag v-else-if="scope.row.priorityLevel === 'next'" type="warning" size="small">即将操作</el-tag>
          <el-tag v-else-if="scope.row.priorityLevel === 'waiting'" type="info" size="small">暂不操作</el-tag>
          <el-tag v-else type="success" size="small">已完成</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="排队序号" align="center" prop="queueNumber" width="80">
        <template slot-scope="scope">
          <span>{{ scope.row.queueNumber || '-' }}</span>
        </template>
      </el-table-column>
      <el-table-column label="排队状态" align="center" prop="queueStatus" min-width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.queueStatus || '-' }}</span>
        </template>
      </el-table-column>
      <el-table-column label="装卸点" align="center" min-width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.loadingPointCode || '-' }}</span>
        </template>
      </el-table-column>
      <el-table-column label="停车位" align="center" min-width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.parkingCode || '-' }}</span>
        </template>
      </el-table-column>
      <el-table-column label="装卸托数" align="center" prop="loadingQty" width="80" />
      <el-table-column label="作业状态" align="center" prop="workStatus" width="90">
        <template slot-scope="scope">
          <el-tag :type="workStatusTagType(scope.row.workStatus)">{{ workStatusText(scope.row.workStatus) }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="叉车司机" align="center" min-width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.forkliftDriverName || '-' }}</span>
        </template>
      </el-table-column>
      <el-table-column label="叉车编号" align="center" min-width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.forkliftNo || '-' }}</span>
        </template>
      </el-table-column>
      <el-table-column label="装卸开始" align="center" min-width="150">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.loadingStart, '{y}-{m}-{d} {h}:{i}') || '-' }}</span>
        </template>
      </el-table-column>
      <el-table-column label="装卸完成" align="center" min-width="150">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.loadingFinish, '{y}-{m}-{d} {h}:{i}') || '-' }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="120" fixed="right">
        <template slot-scope="scope">
          <el-button
            v-if="scope.row.workStatus === '0' && scope.row.loadingPointId"
            size="mini"
            type="text"
            icon="el-icon-user"
            @click="handleAssignDriver(scope.row)"
          >指派</el-button>
          <el-button
            v-if="scope.row.workStatus === '1'"
            size="mini"
            type="text"
            icon="el-icon-unlock"
            @click="handleReleasePoint(scope.row)"
          >点位释放</el-button>
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

    <!-- 指派叉车司机弹窗 -->
    <el-dialog title="指派叉车司机" :visible.sync="assignDialogVisible" width="600px" append-to-body>
      <el-table v-loading="driverLoading" :data="availableDriverList" border>
        <el-table-column label="司机姓名" align="center" prop="driverName" />
        <el-table-column label="联系电话" align="center" prop="driverPhone" />
        <el-table-column label="关联叉车" align="center" prop="forkliftCodes" />
        <el-table-column label="操作" align="center" width="80">
          <template slot-scope="scope">
            <el-button size="mini" type="primary" @click="confirmAssign(scope.row)">选择</el-button>
          </template>
        </el-table-column>
      </el-table>
      <div v-if="availableDriverList.length === 0 && !driverLoading" style="text-align: center; padding: 20px; color: #909399;">
        暂无可用叉车司机
      </div>
      <div slot="footer">
        <el-button @click="assignDialogVisible = false">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 码头操作顺序 -->
    <el-divider content-position="left">码头操作顺序</el-divider>

    <div v-for="(group, index) in sortedDockGroups" :key="group.dockName" class="dock-section">
      <el-card shadow="hover">
        <div slot="header" class="dock-card-header">
          <span class="dock-card-title">{{ group.dockName }}</span>
          <el-tag size="mini" type="info">{{ group.tasks.length }} 个任务</el-tag>
        </div>
        <div class="dock-task-list">
          <div
            v-for="(item, idx) in getVisibleTasks(group)"
            :key="item.id"
            class="dock-priority-item"
            :class="'priority-' + item.priorityLevel"
          >
            <div class="priority-order" :class="'order-' + item.priorityLevel">{{ idx + 1 }}</div>
            <div class="priority-info">
              <span class="priority-code">{{ item.loadingTaskCode }}</span>
              <el-tag :type="priorityTagType(item.priorityLevel)" size="mini" style="margin-left: 8px;">{{ priorityText(item.priorityLevel) }}</el-tag>
            </div>
            <div class="priority-extra">
              <span>{{ item.loadingType }}</span>
              <span>{{ item.loadingQty }}托</span>
            </div>
          </div>
        </div>
        <div v-if="group.tasks.length > 20" class="dock-expand">
          <el-button type="text" @click="toggleExpand(group.dockName)">
            {{ expandedDocks.includes(group.dockName) ? '收起' : '展开全部（共' + group.tasks.length + '条）' }}
            <i :class="expandedDocks.includes(group.dockName) ? 'el-icon-arrow-up' : 'el-icon-arrow-down'"></i>
          </el-button>
        </div>
      </el-card>
    </div>
  </div>
</template>

<script>
import { listDock } from "@/api/system/dock";
import { releasePoint, getAvailableDrivers, assignDriver } from "@/api/system/task";
import request from '@/utils/request';

export default {
  name: "DockTask",
  data() {
    return {
      loading: true,
      showSearch: true,
      total: 0,
      dockTaskList: [],
      allDockTaskList: [],
      dockList: [],
      activeTab: "all",
      dateRange: [],
      expandedDocks: [],
      assignDialogVisible: false,
      driverLoading: false,
      availableDriverList: [],
      currentAssignRow: null,
      statCount: {
        all: 0,
        pending: 0,
        working: 0,
        done: 0
      },
      queryParams: {
        pageNum: 1,
        pageSize: 20,
        loadingTaskCode: null,
        dockId: null,
        loadingType: null,
        workStatus: null
      }
    };
  },
  computed: {
    sortedDockGroups() {
      const groups = {};
      this.allDockTaskList.forEach(item => {
        const name = item.dockName || '未分配码头';
        if (!groups[name]) {
          groups[name] = [];
        }
        groups[name].push(item);
      });
      Object.keys(groups).forEach(key => {
        groups[key].sort((a, b) => (a.dockSort || 999) - (b.dockSort || 999));
      });
      return Object.keys(groups)
        .map(name => ({ dockName: name, tasks: groups[name] }))
        .sort((a, b) => b.tasks.length - a.tasks.length);
    }
  },
  created() {
    this.getList();
    this.loadDockList();
    this.loadAllForGroup();
  },
  methods: {
    getList() {
      this.loading = true;
      const params = { ...this.queryParams, hasLoadingTaskCode: '1' };
      if (this.dateRange && this.dateRange.length === 2) {
        params.beginTime = this.dateRange[0];
        params.endTime = this.dateRange[1];
      }
      request({
        url: '/system/TaskDock/list',
        method: 'get',
        params
      }).then(response => {
        const list = response.rows || [];
        this.dockTaskList = list.map(item => this.computePriority(item));
        this.total = response.total;
        this.loading = false;
      });
    },
    loadAllForGroup() {
      const params = { pageNum: 1, pageSize: 999, hasLoadingTaskCode: '1' };
      if (this.dateRange && this.dateRange.length === 2) {
        params.beginTime = this.dateRange[0];
        params.endTime = this.dateRange[1];
      }
      request({
        url: '/system/TaskDock/list',
        method: 'get',
        params
      }).then(response => {
        const list = response.rows || [];
        this.allDockTaskList = list.map(item => this.computePriority(item));
        this.statCount.all = list.length;
        this.statCount.pending = list.filter(i => i.workStatus === '0').length;
        this.statCount.working = list.filter(i => i.workStatus === '1').length;
        this.statCount.done = list.filter(i => i.workStatus === '2').length;
      });
    },
    loadDockList() {
      listDock({ pageNum: 1, pageSize: 999, status: 1 }).then(response => {
        this.dockList = response.rows;
      });
    },
    computePriority(item) {
      if (item.workStatus === '2') {
        item.priorityLevel = 'done';
      } else if (item.workStatus === '1') {
        item.priorityLevel = 'current';
      } else {
        // 在同一码头中，找到未完成(非status=2)的最小dockSort
        const sameDockTasks = this.allDockTaskList
          ? this.allDockTaskList.filter(t => t.dockId === item.dockId && t.workStatus !== '2')
          : [];
        const hasWorking = sameDockTasks.some(t => t.workStatus === '1');
        if (hasWorking) {
          // 有正在作业的，其他待作业的都是waiting
          item.priorityLevel = 'waiting';
        } else {
          // 没有正在作业的，排队号最小的是next
          if (item.queueNumber === 1 || item.dockSort === 1) {
            item.priorityLevel = 'next';
          } else {
            const minSort = Math.min(...sameDockTasks.map(t => t.dockSort || 999));
            if ((item.dockSort || 999) === minSort) {
              item.priorityLevel = 'next';
            } else {
              item.priorityLevel = 'waiting';
            }
          }
        }
      }
      return item;
    },
    workStatusText(status) {
      const map = { '0': '待作业', '1': '作业中', '2': '已完成' };
      return map[status] || '未知';
    },
    workStatusTagType(status) {
      const map = { '0': 'info', '1': '', '2': 'success' };
      return map[status] || 'info';
    },
    priorityText(level) {
      const map = { current: '当前操作', next: '即将操作', waiting: '暂不操作', done: '已完成' };
      return map[level] || '';
    },
    priorityTagType(level) {
      const map = { current: 'danger', next: 'warning', waiting: 'info', done: 'success' };
      return map[level] || 'info';
    },
    getVisibleTasks(group) {
      if (group.tasks.length <= 20 || this.expandedDocks.includes(group.dockName)) {
        return group.tasks;
      }
      return group.tasks.slice(0, 20);
    },
    toggleExpand(dockName) {
      const idx = this.expandedDocks.indexOf(dockName);
      if (idx > -1) {
        this.expandedDocks.splice(idx, 1);
      } else {
        this.expandedDocks.push(dockName);
      }
    },
    switchTab(tab) {
      this.activeTab = tab;
      this.handleTabClick({ name: tab });
    },
    handleTabClick(tab) {
      if (tab.name === 'all') {
        this.queryParams.workStatus = null;
      } else {
        this.queryParams.workStatus = tab.name;
      }
      this.queryParams.pageNum = 1;
      this.getList();
    },
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
      this.loadAllForGroup();
    },
    resetQuery() {
      this.resetForm("queryForm");
      this.dateRange = [];
      this.activeTab = 'all';
      this.queryParams.workStatus = null;
      this.handleQuery();
    },
    handleAssignDriver(row) {
      this.currentAssignRow = row;
      this.assignDialogVisible = true;
      this.driverLoading = true;
      getAvailableDrivers().then(response => {
        this.availableDriverList = response.data || [];
        this.driverLoading = false;
      }).catch(() => {
        this.driverLoading = false;
      });
    },
    confirmAssign(driver) {
      this.$modal.confirm('确认指派叉车司机 ' + driver.driverName + ' ？').then(() => {
        assignDriver(this.currentAssignRow.id, driver.id).then(response => {
          this.$modal.msgSuccess(response.msg || "指派成功");
          this.assignDialogVisible = false;
          this.getList();
          this.loadAllForGroup();
        });
      }).catch(() => {});
    },
    handleReleasePoint(row) {
      this.$modal.confirm('确认释放该装卸点？释放后将自动安排下一任务。').then(() => {
        releasePoint(row.id).then(response => {
          this.$modal.msgSuccess(response.msg || "点位释放成功");
          this.getList();
          this.loadAllForGroup();
        });
      }).catch(() => {});
    },
    handleExport() {
      this.download('system/TaskDock/export', {
        ...this.queryParams,
        hasLoadingTaskCode: '1'
      }, `dock_task_${new Date().getTime()}.xlsx`);
    }
  }
};
</script>

<style scoped>
.stat-card {
  cursor: pointer;
  transition: all 0.3s;
  border: 2px solid transparent;
}
.stat-card:hover {
  transform: translateY(-2px);
}
.stat-card.active {
  border-color: #409eff;
}
.stat-content {
  text-align: center;
  padding: 10px 0;
}
.stat-number {
  font-size: 28px;
  font-weight: bold;
  color: #303133;
}
.stat-number.stat-pending { color: #909399; }
.stat-number.stat-working { color: #409eff; }
.stat-number.stat-done { color: #67c23a; }
.stat-label {
  font-size: 14px;
  color: #606266;
  margin-top: 6px;
}
.dock-section {
  margin-bottom: 16px;
}
.dock-card-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.dock-card-title {
  font-weight: bold;
  font-size: 15px;
}
.dock-task-list {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}
.dock-priority-item {
  display: flex;
  align-items: center;
  padding: 6px 10px;
  border-radius: 4px;
  border: 1px solid #ebeef5;
  width: calc(50% - 4px);
  box-sizing: border-box;
}
.dock-priority-item.priority-current {
  border-left: 4px solid #f56c6c;
  background: #fef0f0;
}
.dock-priority-item.priority-next {
  border-left: 4px solid #e6a23c;
  background: #fdf6ec;
}
.dock-priority-item.priority-waiting {
  border-left: 4px solid #dcdfe6;
  background: #f9f9f9;
}
.dock-priority-item.priority-done {
  border-left: 4px solid #67c23a;
  background: #f0f9eb;
}
.priority-order {
  width: 22px;
  height: 22px;
  border-radius: 50%;
  color: #fff;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
  font-size: 11px;
  flex-shrink: 0;
}
.priority-order.order-current { background: #f56c6c; }
.priority-order.order-next { background: #e6a23c; }
.priority-order.order-waiting { background: #c0c4cc; }
.priority-order.order-done { background: #67c23a; }
.priority-info {
  flex: 1;
  margin-left: 8px;
  display: flex;
  align-items: center;
}
.priority-code {
  font-size: 13px;
  color: #303133;
}
.priority-extra {
  flex-shrink: 0;
  font-size: 12px;
  color: #909399;
  display: flex;
  gap: 8px;
}
.dock-expand {
  text-align: center;
  margin-top: 10px;
  border-top: 1px dashed #ebeef5;
  padding-top: 8px;
}
</style>
