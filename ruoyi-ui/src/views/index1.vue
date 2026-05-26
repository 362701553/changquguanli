<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :sm="24" :lg="24">
        <blockquote class="text-warning" style="font-size: 14px">
          林
          <br />
          <el-link
            href="https://www.aliyun.com/minisite/goods?userCode=brki8iof"
            type="primary"
            target="_blank"
            >https://www.aliyun.com/minisite/goods?userCode=brki8iof</el-link
          >
          <br />
          领取腾讯云通用云产品2860优惠券
          <br />
          <el-link
            href="https://cloud.tencent.com/redirect.php?redirect=1025&cps_key=198c8df2ed259157187173bc7f4f32fd&from=console"
            type="primary"
            target="_blank"
            >https://cloud.tencent.com/redirect.php?redirect=1025&cps_key=198c8df2ed259157187173bc7f4f32fd&from=console</el-link
          >
          <br />
          阿里云服务器折扣区
          <el-link href="http://aly.ruoyi.vip" type="primary" target="_blank"
            >>☛☛点我进入☚☚</el-link
          >
          &nbsp;&nbsp;&nbsp; 腾讯云服务器秒杀区
          <el-link href="http://txy.ruoyi.vip" type="primary" target="_blank"
            >>☛☛点我进入☚☚</el-link
          ><br />
          <h4 class="text-danger">
            云产品通用红包，可叠加官网常规优惠使用。(仅限新用户)
          </h4>
        </blockquote>

        <hr />
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :sm="24" :lg="12" style="padding-left: 20px">
        <h2>管理框架</h2>
        <p>
        </p>
        <p>
          <b>当前版本:</b> <span>v{{ version }}</span>
        </p>
        <p>
          <el-tag type="danger">&yen;免费开源</el-tag>
        </p>
        <p>
          <el-button
            type="primary"
            size="mini"
            icon="el-icon-cloudy"
            plain
            @click="goTarget('https://gitee.com/y_project/RuoYi-Vue')"
            >访问码云</el-button
          >
          <el-button
            size="mini"
            icon="el-icon-s-home"
            plain
            @click="goTarget('http://ruoyi.vip')"
            >访问主页</el-button
          >
        </p>
      </el-col>

      <el-col :sm="24" :lg="12" style="padding-left: 50px">
        <el-row>
          <el-col :span="12">
            <h2>技术选型</h2>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="6">
            <h4>后端技术</h4>
            <ul>
              <li>SpringBoot</li>
              <li>Spring Security</li>
              <li>JWT</li>
              <li>MyBatis</li>
              <li>Druid</li>
              <li>Fastjson</li>
              <li>...</li>
            </ul>
          </el-col>
          <el-col :span="6">
            <h4>前端技术</h4>
            <ul>
              <li>Vue</li>
              <li>Vuex</li>
              <li>Element-ui</li>
              <li>Axios</li>
              <li>Sass</li>
              <li>Quill</li>
              <li>...</li>
            </ul>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
    <el-divider />
    <el-row :gutter="20">
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span>联系信息</span>
          </div>
          <div class="body">
            <p>
              <i class="el-icon-s-promotion"></i> 官网：<el-link
                href="http://www.ruoyi.vip"
                target="_blank"
                >http://www.ruoyi.vip</el-link
              >
            </p>
            <p>
              <i class="el-icon-user-solid"></i> QQ群：<s>满937441</s> <s>满887144332</s>
              <s>满180251782</s> <s>满104180207</s> <s>满186866453</s> <s>满201396349</s>
              <s>满101456076</s> <s>满101539465</s> <s>满264312783</s> <s>满167385320</s>
              <a href="https://jq.qq.com/?_wv=1027&k=DuWxuULe" target="_blank">
                139821253</a
              >
            </p>
            <p>
              <i class="el-icon-chat-dot-round"></i> 微信：<a
                href="javascript:;"
                >/ *若依</a
              >
            </p>
            <p>
              <i class="el-icon-money"></i> 支付宝：<a
                href="javascript:;"
                class="支付宝信息"
                >/ *若依</a
              >
            </p>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span>更新日志</span>
          </div>
          <el-collapse accordion>
            <el-collapse-item title="v3.8.3 - 2022-06-27">
              <ol>
                <li>新增缓存列表菜单功能</li>
              </ol>
            </el-collapse-item>
            <el-collapse-item title="v3.8.2 - 2022-04-01">
              <ol>
                <li>前端支持设置是否需要防止数据重复提交</li>
              </ol>
            </el-collapse-item>
            <el-collapse-item title="v3.8.1 - 2022-01-01">
              <ol>
                <li>新增Vue3前端代码生成模板</li>

              </ol>
            </el-collapse-item>
            <el-collapse-item title="v3.8.0 - 2021-12-01">
              <ol>
                <li>新增配套并同步的Vue3前端版本</li>

              </ol>
            </el-collapse-item>
            <el-collapse-item title="v3.7.0 - 2021-09-13">
              <ol>
                <li>参数管理支持配置验证码开关</li>

              </ol>
            </el-collapse-item>
            <el-collapse-item title="v3.6.0 - 2021-07-12">
              <ol>
                <li>角色管理新增分配用户功能</li>

              </ol>
            </el-collapse-item>
            <el-collapse-item title="v3.5.0 - 2021-05-25">
              <ol>
                <li>新增菜单导航显示风格TopNav（false为左侧导航菜单，true为顶部导航菜单）</li>
                <li>布局设置支持保存&重置配置</li>

                <li>其他细节优化</li>
              </ol>
            </el-collapse-item>
            <el-collapse-item title="v3.4.0 - 2021-02-22">
              <ol>
                <li>代码生成模板支持主子表</li>
                <li>表格右侧工具栏组件支持显隐列</li>

              </ol>
            </el-collapse-item>
            <el-collapse-item title="v3.3.0 - 2020-12-14">
              <ol>
                <li>新增缓存监控功能</li>

              </ol>
            </el-collapse-item>
            <el-collapse-item title="v3.2.1 - 2020-11-18">
              <ol>
                <li>阻止任意文件下载漏洞</li>
                <li>代码生成支持上传控件</li>
                <li>新增图片上传组件</li>
                <li>调整默认首页</li>
                <li>升级druid到最新版本v1.2.2</li>
                <li>mapperLocations配置支持分隔符</li>
                <li>权限信息调整</li>
                <li>调整sql默认时间</li>
                <li>解决代码生成没有bit类型的问题</li>
                <li>升级pagehelper到最新版1.3.0</li>
              </ol>
            </el-collapse-item>
            <el-collapse-item title="v3.2.0 - 2020-10-10">
              <ol>
                <li>升级springboot版本到2.1.17 提升安全性</li>

              </ol>
            </el-collapse-item>

            <el-collapse-item title="v3.1.0 - 2020-08-13">
              <ol>
                <li>表格工具栏右侧添加刷新&显隐查询组件</li>

              </ol>
            </el-collapse-item>

            <el-collapse-item title="v3.0.0 - 2020-07-20">
              <ol>
                <li>单应用调整为多模块项目</li>

              </ol>
            </el-collapse-item>

            <el-collapse-item title="v2.3.0 - 2020-06-01">
              <ol>
                <li>升级fastjson到最新版1.2.70 修复高危安全漏洞</li>
                <li>dev启动默认打开浏览器</li>
                <li>vue-cli使用默认source-map</li>
                <li>slidebar eslint报错优化</li>
                <li>当tags-view滚动关闭右键菜单</li>
                <li>字典管理添加缓存读取</li>
                <li>参数管理支持缓存操作</li>
                <li>支持一级菜单（和主页同级）在main区域显示</li>
                <li>限制外链地址必须以http(s)开头</li>
                <li>tagview & sidebar 主题颜色与element ui(全局)同步</li>
                <li>修改数据源类型优先级，先根据方法，再根据类</li>
                <li>支持是否需要设置token属性，自定义返回码消息。</li>
                <li>swagger请求前缀加入配置。</li>
                <li>登录地点设置内容过长则隐藏显示</li>
                <li>修复定时任务执行一次按钮后不提示消息问题</li>
                <li>修改上级部门（选择项排除本身和下级）</li>
                <li>通用http发送方法增加参数 contentType 编码类型</li>
                <li>更换IP地址查询接口</li>
                <li>修复页签变量undefined</li>
                <li>添加校验部门包含未停用的子部门</li>
                <li>修改定时任务详情下次执行时间日期显示错误</li>
                <li>角色管理查询设置默认排序字段</li>
                <li>swagger添加enable参数控制是否启用</li>
                <li>只对json类型请求构建可重复读取inputStream的request</li>
                <li>修改代码生成字典字段int类型没有自动选中问题</li>
                <li>vuex用户名取值修正</li>
                <li>表格树模板去掉多余的)</li>
                <li>代码生成序号修正</li>
                <li>全屏情况下不调整上外边距</li>
                <li>代码生成Date字段添加默认格式</li>
                <li>用户管理角色选择权限控制</li>
                <li>修复路由懒加载报错问题</li>
                <li>模板sql.vm添加菜单状态</li>
                <li>设置用户名称不能修改</li>
                <li>dialog添加append-to-body属性，防止ie遮罩</li>
                <li>菜单区分状态和显示隐藏功能</li>
                <li>升级fastjson到最新版1.2.68 修复安全加固</li>
                <li>修复代码生成如果选择字典类型缺失逗号问题</li>
                <li>登录请求params更换为data，防止暴露url</li>
                <li>日志返回时间格式处理</li>
                <li>添加handle控制允许拖动的元素</li>
                <li>布局设置点击扩大范围</li>
                <li>代码生成列属性排序查询</li>
                <li>代码生成列支持拖动排序</li>
                <li>修复时间格式不支持ios问题</li>
                <li>表单构建添加父级class，防止冲突</li>
                <li>定时任务并发属性修正</li>
                <li>角色禁用&菜单隐藏不查询权限</li>
                <li>其他细节优化</li>
              </ol>
            </el-collapse-item>

            <el-collapse-item title="v2.2.0 - 2020-03-18">
              <ol>
                <li>系统监控新增定时任务功能</li>
                <li>添加一个打包Web工程bat</li>
                <li>修复页签鼠标滚轮按下的时候，可以关闭不可关闭的tag</li>
                <li>修复点击退出登录有时会无提示问题</li>
                <li>修复防重复提交注解无效问题</li>
                <li>修复通知公告批量删除异常问题</li>
                <li>添加菜单时路由地址必填限制</li>
                <li>代码生成字段描述可编辑</li>
                <li>修复用户修改个人信息导致缓存不过期问题</li>
                <li>个人信息创建时间获取正确属性值</li>
                <li>操作日志详细显示正确类型</li>
                <li>导入表单击行数据时选中对应的复选框</li>
                <li>批量替换表前缀逻辑调整</li>
                <li>固定重定向路径表达式</li>
                <li>升级element-ui版本到2.13.0</li>
                <li>操作日志排序调整</li>
                <li>修复charts切换侧边栏或者缩放窗口显示bug</li>
                <li>其他细节优化</li>
              </ol>
            </el-collapse-item>

            <el-collapse-item title="v2.1.0 - 2020-02-24">
              <ol>
                <li>新增表单构建</li>

              </ol>
            </el-collapse-item>

            <el-collapse-item title="v2.0.0 - 2019-12-02">
              <ol>
                <li>新增代码生成</li>

              </ol>
            </el-collapse-item>
            <el-collapse-item title="v1.1.0 - 2019-11-11">
              <ol>
                <li>新增在线用户管理</li>

              </ol>
            </el-collapse-item>
            <el-collapse-item title="v1.0.0 - 2019-10-08">
              <ol>
                <li>若依前后端分离系统正式发布</li>
              </ol>
            </el-collapse-item>
          </el-collapse>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span>捐赠支持</span>
          </div>
          <div class="body">
            <img
              src="https://oscimg.oschina.net/oscnet/up-d6695f82666e5018f715c41cb7ee60d3b73.png"
              alt="donate"
              width="100%"
            />
            <span style="display: inline-block; height: 30px; line-height: 30px"
              >你可以请作者喝杯咖啡表示鼓励</span
            >
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: "Index",
  data() {
    return {
      // 版本号
      version: "3.8.3",
    };
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    },
  },
};
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }
}
</style>

