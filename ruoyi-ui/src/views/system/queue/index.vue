<template>
  <div class="app-container">
    <!-- 叫号中列表 -->
    <el-card v-if="callingList.length > 0" class="calling-card" shadow="always">
      <div slot="header" class="calling-header">
        <span class="calling-title">叫号中（{{ callingList.length }}）</span>
      </div>
      <el-table :data="callingList" border size="small">
        <el-table-column label="任务编号" prop="taskCode" width="150" />
        <el-table-column label="司机" prop="outDriverName" width="80" />
        <el-table-column label="车牌号" prop="carNo" width="100" />
        <el-table-column label="分配码头" prop="assignedDockName" width="100" />
        <el-table-column label="发货员" prop="dispatcherName" width="80" />
        <el-table-column label="叫号时间" width="160" align="center">
          <template slot-scope="scope">
            {{ parseTime(scope.row.callTime) }}
          </template>
        </el-table-column>
        <el-table-column label="倒计时" width="120" align="center">
          <template slot-scope="scope">
            <el-tag :type="getCountdownType(scope.row.callTime)" effect="dark" size="small">
              {{ getCountdownText(scope.row.callTime) }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="过号次数" width="80" align="center">
          <template slot-scope="scope">
            <el-tag v-if="scope.row.missCount > 0" type="danger" size="small">{{ scope.row.missCount }}</el-tag>
            <span v-else>0</span>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="180" align="center">
          <template slot-scope="scope">
            <el-button type="success" size="mini" @click="handleConfirmEntry(scope.row)">确认入厂</el-button>
            <el-button type="danger" size="mini" @click="handleMiss(scope.row)">过号</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <!-- 排队队列 -->
    <el-card shadow="never">
      <div slot="header">
        <span>排队队列</span>
        <el-tag style="float: right;" type="info" size="medium">
          共 {{ total }} 人排队
        </el-tag>
      </div>

      <el-table v-loading="loading" :data="queueList" border>
        <el-table-column label="序号" width="60" align="center">
          <template slot-scope="scope">
            {{ scope.$index + 1 }}
          </template>
        </el-table-column>
        <el-table-column label="任务编号" prop="taskCode" width="160" />
        <el-table-column label="司机姓名" prop="outDriverName" width="100" />
        <el-table-column label="司机电话" prop="outDriverPhone" width="120" />
        <el-table-column label="车牌号" prop="carNo" width="100" />
        <el-table-column label="预约时段" width="160" align="center">
          <template slot-scope="scope">
            {{ parseTime(scope.row.appointmentStart, '{h}:{i}') }} - {{ parseTime(scope.row.appointmentEnd, '{h}:{i}') }}
          </template>
        </el-table-column>
        <el-table-column label="签到类型" width="80" align="center">
          <template slot-scope="scope">
            <el-tag :type="getCheckinTypeTag(scope.row.checkinType)" size="small">
              {{ getCheckinTypeText(scope.row.checkinType) }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="签到时间" width="160" align="center">
          <template slot-scope="scope">
            {{ parseTime(scope.row.actualCheckinTime) }}
          </template>
        </el-table-column>
        <el-table-column label="预约码头" prop="dockNames" min-width="100" />
        <el-table-column label="过号次数" width="70" align="center">
          <template slot-scope="scope">
            <el-tag v-if="scope.row.missCount > 0" type="danger" size="small">{{ scope.row.missCount }}</el-tag>
            <span v-else>0</span>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="80" align="center">
          <template slot-scope="scope">
            <el-button type="primary" size="mini" @click="handleCallNumber(scope.row)">叫号</el-button>
          </template>
        </el-table-column>
      </el-table>

      <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList" />
    </el-card>

    <!-- 叫号对话框 -->
    <el-dialog title="叫号" :visible.sync="callDialogVisible" width="500px" append-to-body>
      <el-form ref="callForm" :model="callForm" :rules="callRules" label-width="100px">
        <el-form-item label="排队任务">
          <span>{{ callTargetTask ? callTargetTask.taskCode + ' - ' + callTargetTask.outDriverName + ' (' + callTargetTask.carNo + ')' : '' }}</span>
        </el-form-item>
        <el-form-item label="分配方式" prop="assignType">
          <el-radio-group v-model="callForm.assignType">
            <el-radio label="dock">选择码头</el-radio>
            <el-radio label="dispatcher">指定发货员</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item v-if="callForm.assignType === 'dock'" label="选择码头" prop="dockId">
          <el-select v-model="callForm.dockId" placeholder="请选择码头" style="width: 100%;">
            <el-option v-for="dock in dockOptions" :key="dock.id" :label="dock.dockName" :value="dock.id" />
          </el-select>
        </el-form-item>
        <el-form-item v-if="callForm.assignType === 'dispatcher'" label="发货员" prop="dispatcherName">
          <el-input v-model="callForm.dispatcherName" placeholder="请输入发货员名称" />
        </el-form-item>
      </el-form>
      <div slot="footer">
        <el-button @click="callDialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitCallNumber">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { getQueueList, callNumber, confirmEntry, missNumber } from '@/api/system/queue'
import { listDock } from '@/api/system/dock'
import { listTask } from '@/api/system/task'

export default {
  name: 'QueueDispatch',
  data() {
    return {
      loading: true,
      total: 0,
      queueList: [],
      callingList: [],
      refreshTimer: null,
      countdownTimer: null,
      queryParams: {
        pageNum: 1,
        pageSize: 20
      },
      callDialogVisible: false,
      callTargetTask: null,
      callForm: {
        assignType: 'dock',
        dockId: null,
        dispatcherId: null,
        dispatcherName: ''
      },
      callRules: {
        assignType: [{ required: true, message: '请选择分配方式', trigger: 'change' }]
      },
      dockOptions: []
    }
  },
  created() {
    this.getList()
    this.loadDockOptions()
    this.refreshTimer = setInterval(this.getList, 30000)
    this.countdownTimer = setInterval(() => this.$forceUpdate(), 1000)
  },
  beforeDestroy() {
    if (this.refreshTimer) clearInterval(this.refreshTimer)
    if (this.countdownTimer) clearInterval(this.countdownTimer)
  },
  methods: {
    getList() {
      this.loading = true
      getQueueList(this.queryParams).then(response => {
        this.queueList = response.rows
        this.total = response.total
        this.loading = false
      })
      this.loadCallingList()
    },
    loadCallingList() {
      listTask({ taskStatus: '8', pageNum: 1, pageSize: 50 }).then(response => {
        this.callingList = response.rows || []
      })
    },
    loadDockOptions() {
      listDock({ pageNum: 1, pageSize: 100 }).then(response => {
        this.dockOptions = response.rows || []
      })
    },
    getCountdownText(callTime) {
      if (!callTime) return ''
      const elapsed = Math.floor((Date.now() - new Date(callTime).getTime()) / 1000)
      const remaining = 300 - elapsed
      if (remaining <= 0) return '已超时'
      const min = Math.floor(remaining / 60)
      const sec = remaining % 60
      return `${min}:${sec < 10 ? '0' + sec : sec}`
    },
    getCountdownType(callTime) {
      if (!callTime) return 'info'
      const elapsed = Math.floor((Date.now() - new Date(callTime).getTime()) / 1000)
      const remaining = 300 - elapsed
      if (remaining <= 0) return 'danger'
      if (remaining <= 60) return 'warning'
      return 'success'
    },
    getCheckinTypeTag(type) {
      const map = { normal: 'success', late: 'warning', early: '' }
      return map[type] || 'info'
    },
    getCheckinTypeText(type) {
      const map = { normal: '正常', late: '迟到', early: '提前' }
      return map[type] || type
    },
    handleCallNumber(row) {
      this.callTargetTask = row
      this.callForm = { assignType: 'dock', dockId: null, dispatcherId: null, dispatcherName: '' }
      this.callDialogVisible = true
    },
    submitCallNumber() {
      this.$refs.callForm.validate(valid => {
        if (!valid) return
        // 验证二选一
        if (this.callForm.assignType === 'dock' && !this.callForm.dockId) {
          this.$modal.msgError('请选择码头')
          return
        }
        if (this.callForm.assignType === 'dispatcher' && !this.callForm.dispatcherName) {
          this.$modal.msgError('请输入发货员名称')
          return
        }
        const data = {
          taskId: this.callTargetTask.id,
          dockId: this.callForm.assignType === 'dock' ? this.callForm.dockId : null,
          dispatcherId: this.callForm.dispatcherId || 0,
          dispatcherName: this.callForm.assignType === 'dispatcher' ? this.callForm.dispatcherName : ''
        }
        callNumber(data).then(response => {
          this.$modal.msgSuccess('叫号成功')
          this.callDialogVisible = false
          this.getList()
        })
      })
    },
    handleConfirmEntry(task) {
      this.$modal.confirm('确认该司机已入厂？').then(() => {
        confirmEntry(task.id).then(response => {
          this.$modal.msgSuccess('确认入厂成功')
          this.getList()
        })
      }).catch(() => {})
    },
    handleMiss(task) {
      this.$modal.confirm('确认手动过号？过号2次将作废预约。').then(() => {
        missNumber(task.id).then(response => {
          this.$modal.msgSuccess(response.msg)
          this.getList()
        })
      }).catch(() => {})
    }
  }
}
</script>

<style scoped>
.calling-card {
  margin-bottom: 20px;
  border-left: 4px solid #e6a23c;
}
.calling-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.calling-title {
  font-size: 16px;
  font-weight: bold;
  color: #e6a23c;
}
</style>
