webpackJsonp([81],{"SH6+":function(t,e,n){"use strict";function a(t){n("q3WB")}Object.defineProperty(e,"__esModule",{value:!0});var s=n("5HJ5"),i=n("getHttpTools"),o=n.n(i),c=(n("getBaseUrl"),{mixins:[s.a],data:function(){return{interval:"",tips:{SUCCESS:"采集成功!",TITLESTARTNOTFOUND:"采集失败!原因: 标题起始点不匹配",TITLEENDNOTFOUND:"采集失败!原因: 标题结束点不匹配",CONTENTSTARTNOTFOUND:"采集失败!原因: 内容起始点不匹配",CONTENTENDNOTFOUND:"采集失败!原因: 内容结束点不匹配",TITLEEXIST:"采集失败!原因: 标题已存在",VIEWSTARTNOTFOUND:"采集失败!原因: 浏览量起始点不匹配",VIEWENDNOTFOUND:"采集失败!原因: 浏览量结束点不匹配",AUTHORSTARTNOTFOUND:"采集失败!原因: 作者起始点不匹配",AUTHORENDNOTFOUND:"采集失败!原因: 作者结束点不匹配",DESCRISTARTNOTFOUND:"采集失败!原因: 摘要起始点不匹配",DESCRIENDNOTFOUND:"采集失败!原因: 摘要结束点不匹配",ORIGINSTARTNOTFOUND:"采集失败!原因: 来源起始点不匹配",ORIGINENDNOTFOUND:"采集失败!原因: 来源结束点不匹配",RELEASESTARTNOTFOUND:"采集失败!原因: 发布时间起始点不匹配",RELEASEENDNOTFOUND:"采集失败!原因: 发布时间结束点不匹配",VIEWIDSTARTNOTFOUND:"采集失败!原因: 发布时间起始点不匹配",VIEWIDENDNOTFOUND:"采集失败!原因: 发布时间结束点不匹配"},percent:0,collection:{},speedData:[],havaAcquisition:!1}},methods:{getInfo:function(t,e){var n=this;this.loading=!1;var a=this.$api.collectSpeedData;this.interval=setInterval(function(){o.a.post(a).then(function(t){"200"==t.code&&(t.body.havaAcquisition?(n.percent=t.body.percent,n.collection=t.body.acquisition,n.speedData=t.body.list,n.havaAcquisition=!0):(clearInterval(n.interval),n.$confirm("目前暂无进行中的采集任务，请至采集列表中开始任务!","提示",{confirmButtonText:"确定",type:"warning"}).then(function(){n.routerLink("/collectionmanage/list","list")}).catch(function(){n.routerLink("/collectionmanage/list","list")})))}).catch(function(t){})},1e3)}},created:function(){this.getInfo()},beforeRouteLeave:function(t,e,n){clearInterval(this.interval),n()}}),r=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("section",{directives:[{name:"loading",rawName:"v-loading",value:t.loading,expression:"loading"}],staticClass:"cms-body"},[t.havaAcquisition?n("section",{staticClass:"container"},[n("el-row",[n("el-col",{attrs:{span:24}},[n("el-progress",{attrs:{"text-inside":!0,"stroke-width":18,percentage:t.percent,status:"success"}})],1)],1),t._v(" "),n("el-row",{staticClass:"speedHead"},[n("el-col",[n("h3",[t._v("采集任务描述："+t._s(t.collection.name)+"正在进行中，预计总数为："+t._s(t.collection.totalNum)+"，正在执行第"+t._s(t.collection.currNum)+"个")])])],1),t._v(" "),n("el-row",{staticClass:"speedHead"},[n("el-col",[n("h3",[t._v("采集信息过程：")])])],1),t._v(" "),n("section",{staticClass:"speed-container"},t._l(t.speedData,function(e,a){return n("el-row",{key:a,staticClass:"speedHead"},[n("el-col",{attrs:{span:1}},[t._v("\n                              第"+t._s(t.speedData[a].seq)+"条\n                        ")]),t._v(" "),n("el-col",{attrs:{span:17}},[t._v("\n                            "+t._s(t.speedData[a].contentUrl)+"【"+t._s(t.speedData[a].title)+"】\n                        ")]),t._v(" "),n("el-col",{attrs:{span:6}},["success"==t.speedData[a].description?n("span",{staticClass:"collectioning"},[t._v(t._s(t.tips[t.speedData[a].description]))]):n("span",{staticClass:"stoping"},[t._v(t._s(t.tips[t.speedData[a].description]))])])],1)}))],1):t._e()])},l=[],d={render:r,staticRenderFns:l},p=d,N=n("operateHtmlCreate"),T=a,u=N(c,p,!1,T,"data-v-5448da54",null);e.default=u.exports},q3WB:function(t,e,n){var a=n("uYB4");"string"==typeof a&&(a=[[t.i,a,""]]),a.locals&&(t.exports=a.locals);n("FIqI")("dcd64b1c",a,!0,{})},uYB4:function(t,e,n){e=t.exports=n("UTlt")(!1),e.push([t.i,"\n.container[data-v-5448da54]{\r\n  width: 95%;\r\n  margin:20px auto;\r\n  color: rgb(96, 98, 102);\n}\n.collectioning[data-v-5448da54]{\r\n  color: green;\n}\n.stoping[data-v-5448da54]{\r\n  color: red;\n}\n.speed-container[data-v-5448da54]{\r\n  max-height: 600px;\r\n  overflow:auto\n}\n.speedHead[data-v-5448da54] {\r\n  margin:10px 0px;\r\n  -webkit-box-sizing: border-box;\r\n          box-sizing: border-box;\n}\r\n\r\n",""])}});