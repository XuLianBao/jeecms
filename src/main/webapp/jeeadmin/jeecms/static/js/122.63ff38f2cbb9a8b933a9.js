webpackJsonp([122],{"1u7B":function(e,n,t){var s=t("IS2T");"string"==typeof s&&(s=[[e.i,s,""]]),s.locals&&(e.exports=s.locals);t("FIqI")("7046f4b4",s,!0,{})},HaGw:function(e,n,t){"use strict";function s(e){t("1u7B")}Object.defineProperty(n,"__esModule",{value:!0});var a=t("5HJ5"),i={mixins:[a.a],data:function(){return{params:{}}},created:function(){this.initTableData(this.$api.ossList,this.params)}},l=function(){var e=this,n=e.$createElement,t=e._self._c||n;return t("section",{directives:[{name:"loading",rawName:"v-loading",value:e.loading,expression:"loading"}],staticClass:"cms-body"},[t("div",{staticClass:"cms-list-header"},[t("el-button",{directives:[{name:"perms",rawName:"v-perms",value:"/oss/add",expression:"'/oss/add'"}],attrs:{type:"primary",icon:"el-icon-plus"},on:{click:function(n){e.routerLink("/oss/add","save",0)}}},[e._v("添加")])],1),e._v(" "),t("el-table",{staticStyle:{width:"100%"},attrs:{data:e.tableData,stripe:""},on:{"selection-change":e.checkIds}},[t("el-table-column",{attrs:{type:"selection",width:"65",align:"right"}}),e._v(" "),t("el-table-column",{attrs:{prop:"id",label:"ID",width:"50",align:"center"}}),e._v(" "),t("el-table-column",{attrs:{prop:"name",label:"备注名字",align:"center"}}),e._v(" "),t("el-table-column",{attrs:{prop:"ossType",label:"类型",align:"center"},scopedSlots:e._u([{key:"default",fn:function(n){return t("div",{},[1===n.row.ossType?t("span",[e._v("\n                     腾讯云\n                 ")]):e._e(),e._v(" "),2===n.row.ossType?t("span",[e._v("\n                     阿里云\n                 ")]):e._e(),e._v(" "),3===n.row.ossType?t("span",[e._v("\n                     七牛云\n                 ")]):e._e()])}}])}),e._v(" "),t("el-table-column",{attrs:{prop:"bucketName",label:"Bucket名",align:"center"}}),e._v(" "),t("el-table-column",{attrs:{label:"操作",align:"center"},scopedSlots:e._u([{key:"default",fn:function(n){return t("div",{},[t("cms-button",{directives:[{name:"perms",rawName:"v-perms",value:"/oss/edit",expression:"'/oss/edit'"}],attrs:{type:"edit"},nativeOn:{click:function(t){e.routerLink("/oss/edit","update",n.row.id)}}}),e._v(" "),t("cms-button",{directives:[{name:"perms",rawName:"v-perms",value:"/oss/delete",expression:"'/oss/delete'"}],attrs:{type:"delete"},nativeOn:{click:function(t){e.deleteBatch(e.$api.ossDelete,n.row.id)}}})],1)}}])})],1),e._v(" "),t("div",{staticClass:"cms-list-footer"},[t("div",{staticClass:"cms-left"},[t("el-button",{directives:[{name:"perms",rawName:"v-perms",value:"/oss/delete",expression:"'/oss/delete'"}],attrs:{disabled:e.disabled},on:{click:function(n){e.deleteBatch(e.$api.ossDelete,e.ids)}}},[e._v("批量删除")])],1)])],1)},o=[],r={render:l,staticRenderFns:o},c=r,d=t("operateHtmlCreate"),p=s,u=d(i,c,!1,p,null,null);n.default=u.exports},IS2T:function(e,n,t){n=e.exports=t("UTlt")(!1),n.push([e.i,"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",""])}});