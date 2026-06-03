<template>
  <div class="app-container">
    <!-- 搜索区域 -->
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="80px">
      <el-form-item label="围栏名称" prop="fenceName">
        <el-input v-model="queryParams.fenceName" placeholder="请输入围栏名称" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="围栏类型" prop="fenceType">
        <el-select v-model="queryParams.fenceType" placeholder="请选择类型" clearable>
          <el-option label="停车区" value="parking" />
          <el-option label="禁行区" value="forbidden" />
          <el-option label="工作区" value="working" />
        </el-select>
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable>
          <el-option label="启用" :value="1" />
          <el-option label="禁用" :value="0" />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <!-- 操作按钮 -->
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['system:electronic:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete" v-hasPermi="['system:electronic:remove']">删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 数据表格 -->
    <el-table v-loading="loading" :data="electronicList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="围栏名称" align="center" prop="fenceName" min-width="150" />
      <el-table-column label="围栏类型" align="center" prop="fenceType" min-width="100">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.fenceType === 'parking'" type="info">停车区</el-tag>
          <el-tag v-else-if="scope.row.fenceType === 'forbidden'" type="danger">禁行区</el-tag>
          <el-tag v-else-if="scope.row.fenceType === 'working'" type="success">工作区</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="关联码头" align="center" prop="dockName" min-width="120" />
      <el-table-column label="状态" align="center" prop="status" min-width="80">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status === 1" type="success">启用</el-tag>
          <el-tag v-else type="info">禁用</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createDate" min-width="160" />
      <el-table-column label="操作" align="center" width="200">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-view" @click="handleDetail(scope.row)" v-hasPermi="['system:electronic:query']">详情</el-button>
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['system:electronic:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['system:electronic:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList" />

    <!-- 新增/修改弹窗 -->
    <el-dialog :title="title" :visible.sync="open" width="900px" append-to-body @opened="initMap" @close="closeDialog">
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="围栏名称" prop="fenceName">
              <el-input v-model="form.fenceName" placeholder="请输入围栏名称" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="围栏类型" prop="fenceType">
              <el-select v-model="form.fenceType" placeholder="请选择围栏类型" style="width: 100%;" @change="handleTypeChange">
                <el-option label="停车区" value="parking" />
                <el-option label="禁行区" value="forbidden" />
                <el-option label="工作区" value="working" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="关联码头" prop="dockId">
              <el-select v-model="form.dockId" placeholder="请选择码头" clearable filterable style="width: 100%;" @change="handleDockChange">
                <el-option v-for="dock in dockList" :key="dock.id" :label="dock.dockName" :value="dock.id" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="状态" prop="status">
              <el-radio-group v-model="form.status">
                <el-radio :label="1">启用</el-radio>
                <el-radio :label="0">禁用</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入备注" />
        </el-form-item>
        <el-form-item label="围栏区域" required>
          <div class="map-toolbar">
            <el-button size="mini" type="primary" icon="el-icon-edit-outline" @click="startDraw">绘制围栏</el-button>
            <el-button size="mini" type="warning" icon="el-icon-delete" @click="clearFence">清除围栏</el-button>
            <span v-if="form.points && form.points.length > 0" class="point-count">已绘制 {{ form.points.length }} 个点</span>
          </div>
          <div id="mapContainer" class="map-container"></div>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 详情弹窗 -->
    <el-dialog title="电子围栏详情" :visible.sync="detailOpen" width="900px" append-to-body @opened="initDetailMap" @close="closeDetailDialog">
      <el-descriptions :column="2" border>
        <el-descriptions-item label="围栏名称">{{ detailData.fenceName }}</el-descriptions-item>
        <el-descriptions-item label="围栏类型">
          <span v-if="detailData.fenceType === 'parking'">停车区</span>
          <span v-else-if="detailData.fenceType === 'forbidden'">禁行区</span>
          <span v-else-if="detailData.fenceType === 'working'">工作区</span>
        </el-descriptions-item>
        <el-descriptions-item label="关联码头">{{ detailData.dockName || '无' }}</el-descriptions-item>
        <el-descriptions-item label="状态">
          <el-tag v-if="detailData.status === 1" type="success">启用</el-tag>
          <el-tag v-else type="info">禁用</el-tag>
        </el-descriptions-item>
        <el-descriptions-item label="创建时间">{{ detailData.createDate }}</el-descriptions-item>
        <el-descriptions-item label="备注">{{ detailData.remark || '无' }}</el-descriptions-item>
      </el-descriptions>
      <div id="detailMapContainer" class="map-container" style="margin-top: 15px;"></div>
    </el-dialog>
  </div>
</template>

<script>
import { listElectronic, getElectronic, addElectronic, updateElectronic, delElectronic } from "@/api/system/electronic";
import { listDock } from "@/api/system/dock";

export default {
  name: "Electronic",
  data() {
    return {
      loading: true,
      ids: [],
      multiple: true,
      showSearch: true,
      total: 0,
      electronicList: [],
      title: "",
      open: false,
      detailOpen: false,
      detailData: {},
      dockList: [],
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        fenceName: null,
        fenceType: null,
        status: null
      },
      form: {},
      rules: {
        fenceName: [{ required: true, message: "请输入围栏名称", trigger: "blur" }],
        fenceType: [{ required: true, message: "请选择围栏类型", trigger: "change" }],
        status: [{ required: true, message: "请选择状态", trigger: "change" }]
      },
      map: null,
      drawControl: null,
      drawnItems: null,
      currentPolygon: null,
      pointMarkers: [],
      detailMap: null,
      detailMarkers: []
    };
  },
  created() {
    this.getList();
    this.loadDockList();
  },
  methods: {
    getList() {
      this.loading = true;
      listElectronic(this.queryParams).then(response => {
        this.electronicList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    loadDockList() {
      listDock({ pageNum: 1, pageSize: 999, status: 1 }).then(response => {
        this.dockList = response.rows;
      });
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
      this.multiple = !selection.length;
    },
    handleTypeChange() {
      if (this.form.fenceType !== 'working') {
        this.$refs.form && this.$refs.form.clearValidate('dockId');
      }
    },
    handleDockChange(val) {
      const dock = this.dockList.find(d => d.id === val);
      this.form.dockName = dock ? dock.dockName : null;
    },
    reset() {
      this.form = {
        id: null,
        fenceName: null,
        fenceType: null,
        dockId: null,
        dockName: null,
        status: 1,
        remark: null,
        points: []
      };
      this.resetForm("form");
    },
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "新增电子围栏";
    },
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids[0];
      getElectronic(id).then(response => {
        this.form = response.data;
        if (!this.form.points) {
          this.form.points = [];
        }
        this.open = true;
        this.title = "修改电子围栏";
      });
    },
    handleDetail(row) {
      getElectronic(row.id).then(response => {
        this.detailData = response.data;
        this.detailOpen = true;
      });
    },
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (!valid) return;
        if (this.form.fenceType === 'working' && !this.form.dockId) {
          this.$message.error("工作区类型必须选择码头");
          return;
        }
        if (!this.form.points || this.form.points.length < 3) {
          this.$message.error("请在地图上绘制围栏区域（至少3个点）");
          return;
        }
        if (this.form.id != null) {
          updateElectronic(this.form).then(response => {
            if (response.code === 200) {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            } else {
              this.$modal.msgError(response.msg);
            }
          });
        } else {
          addElectronic(this.form).then(response => {
            if (response.code === 200) {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            } else {
              this.$modal.msgError(response.msg);
            }
          });
        }
      });
    },
    handleDelete(row) {
      const ids = row.id ? [row.id] : this.ids;
      this.$modal.confirm('是否确认删除选中的电子围栏？').then(() => {
        return delElectronic(ids.join(','));
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    cancel() {
      this.open = false;
      this.reset();
    },
    closeDialog() {
      this.destroyMap();
    },
    closeDetailDialog() {
      this.destroyDetailMap();
    },
    initMap() {
      this.$nextTick(() => {
        if (this.map) {
          this.destroyMap();
        }
        const container = document.getElementById('mapContainer');
        if (!container) return;

        this.map = L.map('mapContainer').setView([30.57, 114.30], 13);
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
          maxZoom: 19,
          attribution: '&copy; OpenStreetMap'
        }).addTo(this.map);

        this.drawnItems = new L.FeatureGroup();
        this.map.addLayer(this.drawnItems);

        if (this.form.points && this.form.points.length > 0) {
          this.showExistingPolygon();
        }
      });
    },
    initDetailMap() {
      this.$nextTick(() => {
        if (this.detailMap) {
          this.destroyDetailMap();
        }
        const container = document.getElementById('detailMapContainer');
        if (!container) return;

        this.detailMap = L.map('detailMapContainer').setView([30.57, 114.30], 13);
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
          maxZoom: 19,
          attribution: '&copy; OpenStreetMap'
        }).addTo(this.detailMap);

        if (this.detailData.points && this.detailData.points.length > 0) {
          const latlngs = this.detailData.points.map(p => [parseFloat(p.lat), parseFloat(p.lng)]);
          const polygon = L.polygon(latlngs, {
            color: '#0000ff',
            weight: 3,
            opacity: 0.8,
            fillColor: '#0000ff',
            fillOpacity: 0.3
          }).addTo(this.detailMap);
          this.detailMap.fitBounds(polygon.getBounds());

          this.detailData.points.forEach((p, index) => {
            const marker = L.circleMarker([parseFloat(p.lat), parseFloat(p.lng)], {
              radius: 7,
              color: '#ff4500',
              fillColor: '#ff4500',
              fillOpacity: 1,
              weight: 2
            }).addTo(this.detailMap);
            marker.bindTooltip(
              '<b>P' + (index + 1) + '</b><br/>经度: ' + parseFloat(p.lng).toFixed(6) + '<br/>纬度: ' + parseFloat(p.lat).toFixed(6),
              { permanent: true, direction: 'top', className: 'point-label' }
            );
            this.detailMarkers.push(marker);
          });
        }
      });
    },
    showExistingPolygon() {
      if (!this.map || !this.form.points || this.form.points.length === 0) return;
      const latlngs = this.form.points.map(p => [parseFloat(p.lat), parseFloat(p.lng)]);
      this.currentPolygon = L.polygon(latlngs, {
        color: '#0000ff',
        weight: 3,
        opacity: 0.8,
        fillColor: '#0000ff',
        fillOpacity: 0.3
      });
      this.drawnItems.addLayer(this.currentPolygon);
      this.map.fitBounds(this.currentPolygon.getBounds());

      this.refreshPointMarkers();

      this.currentPolygon.editing.enable();
      this.currentPolygon.on('edit', () => {
        this.updatePointsFromPolygon();
      });
    },
    startDraw() {
      if (!this.map) return;
      if (this.currentPolygon) {
        this.$modal.confirm('重新绘制将清除当前围栏，是否继续？').then(() => {
          this.clearFence();
          this.enableDrawing();
        }).catch(() => {});
      } else {
        this.enableDrawing();
      }
    },
    enableDrawing() {
      if (this.drawControl) {
        this.drawControl.disable();
      }
      this.drawControl = new L.Draw.Polygon(this.map, {
        shapeOptions: {
          color: '#0000ff',
          weight: 3,
          opacity: 0.8,
          fillColor: '#0000ff',
          fillOpacity: 0.3
        }
      });
      this.drawControl.enable();

      this.map.once(L.Draw.Event.CREATED, (e) => {
        this.currentPolygon = e.layer;
        this.drawnItems.addLayer(this.currentPolygon);
        this.updatePointsFromPolygon();

        this.currentPolygon.editing.enable();
        this.currentPolygon.on('edit', () => {
          this.updatePointsFromPolygon();
        });
      });
    },
    updatePointsFromPolygon() {
      if (!this.currentPolygon) return;
      const latlngs = this.currentPolygon.getLatLngs()[0];
      this.form.points = latlngs.map((ll, index) => ({
        lng: ll.lng.toFixed(8),
        lat: ll.lat.toFixed(8),
        sortOrder: index
      }));
      this.refreshPointMarkers();
    },
    refreshPointMarkers() {
      this.pointMarkers.forEach(m => this.map.removeLayer(m));
      this.pointMarkers = [];
      if (!this.form.points || this.form.points.length === 0) return;
      this.form.points.forEach((p, index) => {
        const marker = L.circleMarker([parseFloat(p.lat), parseFloat(p.lng)], {
          radius: 7,
          color: '#ff4500',
          fillColor: '#ff4500',
          fillOpacity: 1,
          weight: 2
        }).addTo(this.map);
        marker.bindTooltip(
          '<b>P' + (index + 1) + '</b><br/>经度: ' + parseFloat(p.lng).toFixed(6) + '<br/>纬度: ' + parseFloat(p.lat).toFixed(6),
          { permanent: false, direction: 'top', className: 'point-label' }
        );
        marker.bindPopup(
          '<b>顶点 P' + (index + 1) + '</b><br/>经度: ' + parseFloat(p.lng).toFixed(6) + '<br/>纬度: ' + parseFloat(p.lat).toFixed(6)
        );
        this.pointMarkers.push(marker);
      });
    },
    clearFence() {
      if (this.currentPolygon) {
        this.drawnItems.removeLayer(this.currentPolygon);
        this.currentPolygon = null;
      }
      this.pointMarkers.forEach(m => this.map.removeLayer(m));
      this.pointMarkers = [];
      this.form.points = [];
    },
    destroyMap() {
      if (this.drawControl) {
        this.drawControl.disable();
        this.drawControl = null;
      }
      this.pointMarkers.forEach(m => this.map && this.map.removeLayer(m));
      this.pointMarkers = [];
      if (this.map) {
        this.map.remove();
        this.map = null;
      }
      this.drawnItems = null;
      this.currentPolygon = null;
    },
    destroyDetailMap() {
      this.detailMarkers.forEach(m => this.detailMap && this.detailMap.removeLayer(m));
      this.detailMarkers = [];
      if (this.detailMap) {
        this.detailMap.remove();
        this.detailMap = null;
      }
    }
  }
};
</script>

<style scoped>
.map-container {
  width: 100%;
  height: 450px;
  border: 1px solid #dcdfe6;
  border-radius: 4px;
}
.map-toolbar {
  margin-bottom: 10px;
}
.point-count {
  margin-left: 15px;
  color: #67c23a;
  font-size: 13px;
}
</style>
<style>
.point-label {
  background: rgba(255,255,255,0.9);
  border: 1px solid #ff4500;
  border-radius: 3px;
  padding: 2px 6px;
  font-size: 11px;
  line-height: 1.4;
  white-space: nowrap;
}
</style>
