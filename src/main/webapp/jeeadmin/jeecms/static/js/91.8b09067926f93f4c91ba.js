webpackJsonp([91],{"7S/j":function(t,a,e){a=t.exports=e("UTlt")(!1),a.push([t.i,"\n.data-item[data-v-4f860072] {\n  float: left;\n  min-width: 170px;\n  margin-top: 30px;\n}\n.data-item .data-title[data-v-4f860072] {\n    font-size: 12px;\n    color: #878d99;\n    margin-bottom: 17px;\n}\n.data-item .data-num[data-v-4f860072] {\n    color: #353535;\n    font-size: 24px;\n}\n.chart-style[data-v-4f860072] {\n  width: 100%;\n  height: 380px;\n  border-bottom: 1px dashed #eee;\n  margin-bottom: 15px;\n}\n",""])},NFgv:function(t,a,e){"use strict";function s(t){e("qFGr")}Object.defineProperty(a,"__esModule",{value:!0});var i=e("getHttpTools"),r=e.n(i),n={data:function(){return{dateArr:"",params:{flag:4,begin:"",statisDay:"",end:""},time:"",date:{year:"",month:"",day:""},dataInfo:{pvTotal:0,visitorTotal:0,ipTotal:0,list:[]},chartLine:null,chartPie:null,chartLineOptions:{tooltip:{trigger:"axis"},legend:{data:["浏览量(pv)","独立访客数(uv)","ip数"]},grid:{left:"5%",right:"2%",bottom:"14%"},xAxis:{type:"category",splitLine:{show:!1},boundaryGap:!0,data:["周一","周二","周三","周四","周五","周六","周日"]},yAxis:{splitLine:{show:!1},type:"value"},series:[{name:"浏览量(pv)",type:"line",showSymbol:!1,smooth:!0,data:[120,132,101,134,90,230,210]},{name:"独立访客数(uv)",type:"line",showSymbol:!1,smooth:!0,data:[220,182,191,234,290,330,310]},{name:"ip数",type:"line",showSymbol:!1,smooth:!0,data:[150,232,201,154,190,330,410]}]}}},methods:{rangeTime:function(t){null!=t?(this.params.begin=t[0],this.params.end=t[1],this.params.flag=3,t[0]===t[1]?this.time=t[0]:this.time=t[0]+"-"+t[1]):(this.params.begin="",this.params.end="",this.params.flag=4,this.time=this.date.year+"-"+this.date.month+"-"+this.date.day),this.getDataInfo()},query:function(t){this.dateArr="",this.params.begin="",this.params.end="",4===t&&(this.time=this.date.year+"-"+this.date.month+"-"+this.date.day),6===t&&(this.time=this.date.year+"-"+this.date.month+"-"+(this.date.day-1)),1===t&&(this.time=this.date.year+"-"+this.date.month),2===t&&(this.time=this.date.year),this.getDataInfo()},getDataInfo:function(){var t=this;r.a.post(this.$api.flowPvList,this.params).then(function(a){t.dataInfo.pvTotal=a.body.pvTotal,t.dataInfo.visitorTotal=a.body.visitorTotal,t.dataInfo.ipTotal=a.body.ipTotal,t.dataInfo.list=a.body.list;var e=[],s=[[],[],[]];for(var i in a.body.list)e.push(t.timeFormat(t.params.flag,a.body.list[i][4])),s[0].push(a.body.list[i][0]),s[1].push(a.body.list[i][2]),s[2].push(a.body.list[i][1]);t.setChartLineOptions(e,s)})},setChartLineOptions:function(t,a){var e={xAxis:{data:t},series:[{name:"浏览量(pv)",data:a[0]},{name:"独立访客数(uv)",smooth:!0,data:a[1]},{name:"ip数",data:a[2]}]};this.chartLine.setOption(e)},timeFormat:function(t,a){var e="0";if(4==t||6==t)switch(a){case 0:e="00:00-00:59";break;case 1:e="01:00-01:59";break;case 2:e="02:00-02:59";break;case 3:e="03:00-03:59";break;case 4:e="04:00-04:59";break;case 5:e="05:00-05:59";break;case 6:e="06:00-06:59";break;case 7:e="07:00-07:59";break;case 8:e="08:00-08:59";break;case 9:e="09:00-09:59";break;case 10:e="10:00-10:59";break;case 11:e="11:00-11:59";break;case 12:e="12:00-12:59";break;case 13:e="13:00-13:59";break;case 14:e="14:00-14:59";break;case 15:e="15:00-15:59";break;case 16:e="16:00-16:59";break;case 17:e="17:00-17:59";break;case 18:e="18:00-18:59";break;case 19:e="19:00-19:59";break;case 20:e="20:00-20:59";break;case 21:e="21:00-21:59";break;case 22:e="22:00-22:59";break;case 23:e="23:00-23:59";break;default:e="99:99:99~99:99:99:99"}if(2==t){var s=new Date;switch(a){case 1:e=s.getFullYear()+"-01";break;case 2:e=s.getFullYear()+"-02";break;case 3:e=s.getFullYear()+"-03";break;case 4:e=s.getFullYear()+"-04";break;case 5:e=s.getFullYear()+"-05";break;case 6:e=s.getFullYear()+"-06";break;case 7:e=s.getFullYear()+"-07";break;case 8:e=s.getFullYear()+"-08";break;case 9:e=s.getFullYear()+"-09";break;case 10:e=s.getFullYear()+"-10";break;case 11:e=s.getFullYear()+"-11";break;case 12:e=s.getFullYear()+"-12";break;default:e="9999-99-99"}}return 1!=t&&3!=t||(e=a),e}},created:function(){var t=new Date,a=t.getFullYear(),e=t.getMonth()+1,s=t.getDate();this.date.year=a,this.date.month=e,this.date.day=s,this.year=a,this.month=e,this.time=a+"-"+e+"-"+s,this.getDataInfo()},mounted:function(){this.chartLine=echarts.init(document.getElementById("chartLine")),this.chartLine.setOption(this.chartLineOptions)}},l=function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("section",{staticClass:"cms-body cms-chart-box"},[e("div",{staticClass:"cms-list-header",staticStyle:{"padding-left":"0"}},[e("h5",{staticClass:"data-header-title"},[t._v("趋势分析("+t._s(t.time)+")")]),t._v(" "),e("div",{staticClass:"flex-date"},[e("label",{staticClass:"cms-label",staticStyle:{"margin-left":"0"}},[t._v("日期：")]),t._v(" "),e("el-radio-group",{staticStyle:{"margin-right":"10px"},attrs:{size:"small"},on:{change:t.query},model:{value:t.params.flag,callback:function(a){t.$set(t.params,"flag",a)},expression:"params.flag"}},[e("el-radio-button",{attrs:{label:4}},[t._v("今日")]),t._v(" "),e("el-radio-button",{attrs:{label:6}},[t._v("昨日")]),t._v(" "),e("el-radio-button",{attrs:{label:1}},[t._v("本月")]),t._v(" "),e("el-radio-button",{attrs:{label:2}},[t._v("今年")])],1),t._v(" "),e("el-date-picker",{attrs:{"value-format":"yyyy-MM-dd",editable:!1,type:"daterange","range-separator":"至","start-placeholder":"开始日期","end-placeholder":"结束日期"},on:{change:t.rangeTime},model:{value:t.dateArr,callback:function(a){t.dateArr=a},expression:"dateArr"}})],1)]),t._v(" "),e("ul",{staticClass:"clearfix"},[e("li",{staticClass:"data-item"},[t._m(0),t._v(" "),e("p",{staticClass:"data-num"},[t._v(t._s(t.dataInfo.pvTotal))])]),t._v(" "),e("li",{staticClass:"data-item"},[t._m(1),t._v(" "),e("p",{staticClass:"data-num"},[t._v(t._s(t.dataInfo.visitorTotal))])]),t._v(" "),e("li",{staticClass:"data-item"},[t._m(2),t._v(" "),e("p",{staticClass:"data-num"},[t._v(t._s(t.dataInfo.ipTotal))])])]),t._v(" "),e("div",{staticClass:"chart-style",attrs:{id:"chartLine"}}),t._v(" "),e("table",{staticClass:"data-table"},[t._m(3),t._v(" "),t._l(t.dataInfo.list,function(a,s){return e("tr",{key:s},[e("td",[t._v(t._s(t.timeFormat(t.params.flag,a[4])))]),t._v(" "),e("td",[t._v(t._s(a[0]))]),t._v(" "),e("td",[t._v(t._s(a[2]))]),t._v(" "),e("td",[t._v(t._s(a[1]))])])})],2)])},o=[function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("p",{staticClass:"data-title"},[t._v("浏览量(pv)"),e("i",{staticClass:"iconfont icon-kongzhitai-zhushi"})])},function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("p",{staticClass:"data-title"},[t._v("独立访客数(UV)"),e("i",{staticClass:"iconfont icon-kongzhitai-zhushi"})])},function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("p",{staticClass:"data-title"},[t._v("IP 数"),e("i",{staticClass:"iconfont icon-kongzhitai-zhushi"})])},function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("tr",[e("th",[t._v("时段")]),t._v(" "),e("th",[t._v("浏览量(pv)")]),t._v(" "),e("th",[t._v("独立访客数(uv)")]),t._v(" "),e("th",[t._v("IP 数")])])}],c={render:l,staticRenderFns:o},d=c,h=e("operateHtmlCreate"),m=s,v=h(n,d,!1,m,"data-v-4f860072",null);a.default=v.exports},qFGr:function(t,a,e){var s=e("7S/j");"string"==typeof s&&(s=[[t.i,s,""]]),s.locals&&(t.exports=s.locals);e("FIqI")("50af4c1c",s,!0,{})}});