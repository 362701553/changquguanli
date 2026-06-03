<template>
  <div class="security-screen">
    <!-- 顶部标题栏 -->
    <div class="screen-header">
      <h1 class="screen-title">安保监控大屏</h1>
      <div class="header-time">{{ currentTime }}</div>
    </div>

    <div class="screen-body">
      <!-- 左侧地图区域 -->
      <div class="map-container" ref="mapContainer">
        <div id="securityMap" ref="mapBox"></div>
      </div>

      <!-- 右侧预约情况面板 -->
      <div class="info-panel">
        <div class="panel-title">
          <i class="el-icon-data-analysis"></i>
          <span>今日预约情况</span>
        </div>
        <div class="panel-date">{{ todayDate }}</div>

        <div class="status-grid">
          <div class="status-card" v-for="item in statusList" :key="item.key">
            <div class="status-icon" :style="{ background: item.color }">
              <i :class="item.icon"></i>
            </div>
            <div class="status-info">
              <div class="status-count">{{ item.count }}</div>
              <div class="status-label">{{ item.label }}</div>
            </div>
          </div>
        </div>

        <div class="panel-divider"></div>

        <!-- 汇总统计 -->
        <div class="summary-section">
          <div class="summary-title">汇总统计</div>
          <div class="summary-row">
            <span class="summary-label">今日总预约</span>
            <span class="summary-value">{{ totalCount }}</span>
          </div>
          <div class="summary-row">
            <span class="summary-label">进行中（已签入）</span>
            <span class="summary-value highlight-blue">{{ checkedInCount }}</span>
          </div>
          <div class="summary-row">
            <span class="summary-label">已完成（已签出）</span>
            <span class="summary-value highlight-green">{{ checkedOutCount }}</span>
          </div>
        </div>

        <!-- 刷新按钮 -->
        <div class="refresh-section">
          <el-button type="primary" size="small" icon="el-icon-refresh" @click="loadData" :loading="loading">
            刷新数据
          </el-button>
          <span class="refresh-tip">每60秒自动刷新</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { listTask } from "@/api/system/task";

export default {
  name: "SecurityScreen",
  data() {
    return {
      map: null,
      currentTime: "",
      todayDate: "",
      loading: false,
      timer: null,
      clockTimer: null,
      statusList: [
        { key: "0", label: "待签到", count: 0, color: "#e6a23c", icon: "el-icon-time" },
        { key: "1", label: "待作业", count: 0, color: "#409eff", icon: "el-icon-loading" },
        { key: "2", label: "作业中", count: 0, color: "#f56c6c", icon: "el-icon-s-operation" },
        { key: "5", label: "待签出", count: 0, color: "#9b59b6", icon: "el-icon-unlock" },
        { key: "checkedIn", label: "已签入", count: 0, color: "#67c23a", icon: "el-icon-circle-check" },
        { key: "checkedOut", label: "已签出", count: 0, color: "#909399", icon: "el-icon-finished" },
      ],
    };
  },
  computed: {
    totalCount() {
      return this.statusList.reduce((sum, item) => {
        if (item.key !== "checkedIn" && item.key !== "checkedOut") {
          return sum + item.count;
        }
        return sum;
      }, 0) + this.checkedInCount + this.checkedOutCount;
    },
    checkedInCount() {
      const item = this.statusList.find(s => s.key === "checkedIn");
      return item ? item.count : 0;
    },
    checkedOutCount() {
      const item = this.statusList.find(s => s.key === "checkedOut");
      return item ? item.count : 0;
    },
  },
  mounted() {
    this.updateClock();
    this.loadData();
    this.clockTimer = setInterval(this.updateClock, 1000);
    this.timer = setInterval(this.loadData, 60000);
    this.$nextTick(() => {
      this.initMap();
    });
  },
  beforeDestroy() {
    if (this.timer) clearInterval(this.timer);
    if (this.clockTimer) clearInterval(this.clockTimer);
    if (this.map) {
      this.map.remove();
      this.map = null;
    }
  },
  methods: {
    initMap() {
      const container = this.$refs.mapContainer;
      const mapEl = this.$refs.mapBox;
      if (container && mapEl) {
        mapEl.style.width = container.offsetWidth + "px";
        mapEl.style.height = container.offsetHeight + "px";
      }
      this.map = L.map("securityMap", {
        center: [30.57, 114.30],
        zoom: 13,
        zoomControl: true,
      });
      // 高德免费瓦片，无需API key
      L.tileLayer("https://webrd0{s}.is.autonavi.com/appmaptile?lang=zh_cn&size=1&scale=1&style=8&x={x}&y={y}&z={z}", {
        subdomains: ["1", "2", "3", "4"],
        maxZoom: 18,
      }).addTo(this.map);
    },
    updateClock() {
      const now = new Date();
      this.currentTime = now.toLocaleString("zh-CN", {
        year: "numeric",
        month: "2-digit",
        day: "2-digit",
        hour: "2-digit",
        minute: "2-digit",
        second: "2-digit",
      });
      this.todayDate = now.toLocaleDateString("zh-CN", {
        year: "numeric",
        month: "long",
        day: "numeric",
        weekday: "long",
      });
    },
    loadData() {
      this.loading = true;
      const today = this.getToday();
      const params = {
        pageNum: 1,
        pageSize: 9999,
        params: { beginAppointmentStart: today + " 00:00:00", endAppointmentStart: today + " 23:59:59" },
      };
      listTask(params).then(response => {
        const rows = response.rows || [];
        const countMap = { "0": 0, "1": 0, "2": 0, "5": 0 };
        let checkedIn = 0;
        let checkedOut = 0;

        rows.forEach(row => {
          const status = String(row.taskStatus);
          if (countMap.hasOwnProperty(status)) {
            countMap[status]++;
          }
          // 已签入：待作业(1)、作业中(2)、待签出(5) 都属于已签入状态
          if (["1", "2", "5"].includes(status)) {
            checkedIn++;
          }
          // 已签出：已结束(6)
          if (status === "6") {
            checkedOut++;
          }
        });

        this.statusList.forEach(item => {
          if (item.key === "checkedIn") {
            item.count = checkedIn;
          } else if (item.key === "checkedOut") {
            item.count = checkedOut;
          } else if (countMap.hasOwnProperty(item.key)) {
            item.count = countMap[item.key];
          }
        });
      }).finally(() => {
        this.loading = false;
      });
    },
    getToday() {
      const now = new Date();
      const y = now.getFullYear();
      const m = String(now.getMonth() + 1).padStart(2, "0");
      const d = String(now.getDate()).padStart(2, "0");
      return `${y}-${m}-${d}`;
    },
  },
};
</script>

<style scoped lang="scss">
.security-screen {
  width: 100%;
  height: calc(100vh - 84px);
  background: #0d1b2a;
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

.screen-header {
  height: 60px;
  background: linear-gradient(90deg, #1a2a6c, #2d4a7a, #1a2a6c);
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 30px;
  border-bottom: 2px solid #2d4a7a;
  flex-shrink: 0;
}

.screen-title {
  color: #00e5ff;
  font-size: 24px;
  font-weight: bold;
  letter-spacing: 4px;
  margin: 0;
  text-shadow: 0 0 10px rgba(0, 229, 255, 0.5);
}

.header-time {
  color: #b0c4de;
  font-size: 16px;
  font-family: "Courier New", monospace;
}

.screen-body {
  flex: 1;
  display: flex;
  padding: 16px;
  gap: 16px;
  min-height: 0;
  overflow: hidden;
}

.map-container {
  flex: 1;
  border-radius: 8px;
  overflow: hidden;
  border: 1px solid #2d4a7a;
  position: relative;
  min-height: 400px;
}

#securityMap {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
}

.info-panel {
  width: 360px;
  flex-shrink: 0;
  background: linear-gradient(180deg, #112240, #0a1628);
  border-radius: 8px;
  border: 1px solid #2d4a7a;
  padding: 20px;
  display: flex;
  flex-direction: column;
  overflow-y: auto;
}

.panel-title {
  color: #00e5ff;
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 4px;
  display: flex;
  align-items: center;
  gap: 8px;
  i {
    font-size: 20px;
  }
}

.panel-date {
  color: #8892b0;
  font-size: 13px;
  margin-bottom: 20px;
}

.status-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 12px;
}

.status-card {
  background: rgba(45, 74, 122, 0.3);
  border: 1px solid rgba(45, 74, 122, 0.6);
  border-radius: 8px;
  padding: 14px 12px;
  display: flex;
  align-items: center;
  gap: 10px;
  transition: all 0.3s;
  &:hover {
    border-color: #00e5ff;
    box-shadow: 0 0 12px rgba(0, 229, 255, 0.15);
  }
}

.status-icon {
  width: 38px;
  height: 38px;
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  i {
    color: #fff;
    font-size: 18px;
  }
}

.status-info {
  flex: 1;
}

.status-count {
  font-size: 22px;
  font-weight: bold;
  color: #ffffff;
  line-height: 1.2;
}

.status-label {
  font-size: 12px;
  color: #8892b0;
  margin-top: 2px;
}

.panel-divider {
  height: 1px;
  background: linear-gradient(90deg, transparent, #2d4a7a, transparent);
  margin: 20px 0;
}

.summary-section {
  flex: 1;
}

.summary-title {
  color: #ccd6f6;
  font-size: 15px;
  font-weight: bold;
  margin-bottom: 12px;
}

.summary-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 8px 0;
  border-bottom: 1px solid rgba(45, 74, 122, 0.3);
}

.summary-label {
  color: #8892b0;
  font-size: 14px;
}

.summary-value {
  color: #ffffff;
  font-size: 18px;
  font-weight: bold;
}

.highlight-blue {
  color: #00e5ff;
}

.highlight-green {
  color: #67c23a;
}

.refresh-section {
  margin-top: 20px;
  display: flex;
  align-items: center;
  gap: 10px;
}

.refresh-tip {
  color: #8892b0;
  font-size: 12px;
}
</style>
