webpackJsonp([158],{dIgG:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var l=a("5HJ5"),n=(a("getHttpTools"),a("getBaseUrl")),s={mixins:[l.a],data:function(){return{globalUrl:Object(n.a)(),adTypes:[]}},methods:{calculation:function(e,t){return 0==t?e+"/"+t+"=0.00%":e+"/"+t+"="+(e/t*100).toFixed(2)+"%"}},created:function(){this.initTableData(this.$api.adList,this.params)}},r=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("section",{directives:[{name:"loading",rawName:"v-loading",value:e.loading,expression:"loading"}],staticClass:"cms-body"},[a("div",{staticClass:"cms-list-header "},[a("el-button",{directives:[{name:"perms",rawName:"v-perms",value:"/ad/save",expression:"'/ad/save'"}],attrs:{type:"primary",icon:"el-icon-plus"},on:{click:function(t){e.routerLink("/ad/save","save",0)}}},[e._v("添加")]),e._v(" "),a("el-button",{directives:[{name:"perms",rawName:"v-perms",value:"/adSpace/list",expression:"'/adSpace/list'"}],attrs:{type:"primary"},on:{click:function(t){e.routerLink("/adSpace/list",0)}}},[e._v("广告版位"),a("i",{staticClass:"el-icon-arrow-right"})])],1),e._v(" "),a("el-table",{staticStyle:{width:"100%"},attrs:{data:e.tableData,stripe:""},on:{"selection-change":e.checkIds}},[a("el-table-column",{attrs:{type:"selection",width:"65",align:"right"}}),e._v(" "),a("el-table-column",{attrs:{prop:"id",label:"ID",width:"50",align:"center"}}),e._v(" "),a("el-table-column",{attrs:{prop:"name",label:"名称",align:"center"}}),e._v(" "),a("el-table-column",{attrs:{prop:"adspaceName",label:"版位",align:"center"}}),e._v(" "),a("el-table-column",{attrs:{prop:"category",label:"类型",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return["text"==t.row.category?a("span",[e._v("文字")]):e._e(),e._v(" "),"image"==t.row.category?a("span",[e._v("图片")]):e._e(),e._v(" "),"flash"==t.row.category?a("span",[e._v("Flash")]):e._e(),e._v(" "),"code"==t.row.category?a("span",[e._v("代码")]):e._e()]}}])}),e._v(" "),a("el-table-column",{attrs:{prop:"weight",label:"权重",align:"center"}}),e._v(" "),a("el-table-column",{attrs:{label:"点击/展现=点击率",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("span",[e._v(e._s(e.calculation(t.row.clickCount,t.row.displayCount)))])]}}])}),e._v(" "),a("el-table-column",{attrs:{prop:"enabled",label:"启用",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[t.row.enabled?a("span",[e._v("是")]):e._e(),e._v(" "),t.row.enabled?e._e():a("span",[e._v("否")])]}}])}),e._v(" "),a("el-table-column",{attrs:{width:"300",label:"操作",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return a("div",{},[a("cms-button",{directives:[{name:"perms",rawName:"v-perms",value:"/ad/get",expression:"'/ad/get'"}],attrs:{type:"edit"},nativeOn:{click:function(a){e.routerLink("/ad/update","update",t.row.id)}}}),e._v(" "),a("cms-button",{directives:[{name:"perms",rawName:"v-perms",value:"/ad/delete",expression:"'/ad/delete'"}],attrs:{type:"delete"},nativeOn:{click:function(a){e.deleteBatch(e.$api.adDelete,t.row.id)}}})],1)}}])})],1),e._v(" "),a("div",{staticClass:"cms-list-footer"},[a("div",{staticClass:"cms-left"},[a("el-button",{directives:[{name:"perms",rawName:"v-perms",value:"/ad/delete",expression:"'/ad/delete'"}],attrs:{disabled:e.disabled},on:{click:function(t){e.deleteBatch(e.$api.adDelete,e.ids)}}},[e._v("批量删除")])],1),e._v(" "),a("cms-pagination",{attrs:{total:e.total},on:{change:e.getPages}})],1)],1)},i=[],c={render:r,staticRenderFns:i},o=c,d=a("operateHtmlCreate"),u=d(s,o,!1,null,null,null);t.default=u.exports}});