webpackJsonp([99],{BXxJ:function(e,a,t){var i=t("ZmKH");"string"==typeof i&&(i=[[e.i,i,""]]),i.locals&&(e.exports=i.locals);t("FIqI")("37a52162",i,!0,{})},"WYJ+":function(e,a,t){"use strict";function i(e){t("BXxJ")}Object.defineProperty(a,"__esModule",{value:!0});var l=t("5HJ5"),n=(t("getHttpTools"),t("x1ym")),o={mixins:[l.a],data:function(){return{params:{pageNo:"",pageSize:""},rules:{name:[n.a.required("该项必填")]},param:{name:""},dialogVisible:!1,dialogVisible1:!1,tapTipSave:!1,updateParam:{id:"",name:""}}},methods:{save:function(){var e=this;this.$refs.form.validate(function(a){if(!a)return!1;e.$http.post(e.$api.wordOriginSave,{name:e.param.name}).then(function(a){"200"==a.code&&(e.dialogVisible=!1,e.successMessage("添加成功")),e.param.name="",e.loading=!1}).catch(function(a){e.dialogVisible=!1,e.loading=!1})})},edit:function(e,a){this.updateParam.name="",this.updateParam.name=e,this.updateParam.id=a,this.tapTipSave=!1,this.dialogVisible1=!0},update:function(){var e=this;this.$refs.form1.validate(function(a){if(!a)return!1;e.$http.post(e.$api.wordOriginUpdate,{id:e.updateParam.id,name:e.updateParam.name}).then(function(a){"200"==a.code&&(e.dialogVisible1=!1,e.successMessage("添加成功"),e.initTableData(e.$api.wordOriginList,e.params)),e.loading=!1}).catch(function(a){e.dialogVisible1=!1,e.loading=!1})})},handleClose:function(e){e()}},created:function(){this.initTableData(this.$api.wordOriginList,this.params)}},s=function(){var e=this,a=e.$createElement,t=e._self._c||a;return t("section",{directives:[{name:"loading",rawName:"v-loading",value:e.loading,expression:"loading"}],staticClass:"cms-body"},[t("div",{staticClass:"cms-list-header"},[t("el-button",{directives:[{name:"perms",rawName:"v-perms",value:"/word/origin/add",expression:"'/word/origin/add'"}],attrs:{type:"primary",icon:"el-icon-plus"},on:{click:function(a){e.dialogVisible=!0}}},[e._v("添加")])],1),e._v(" "),t("el-table",{staticStyle:{width:"100%"},attrs:{data:e.tableData,stripe:""},on:{"selection-change":e.checkIds}},[t("el-table-column",{attrs:{type:"selection",width:"65",align:"right"}}),e._v(" "),t("el-table-column",{attrs:{prop:"id",label:"ID",width:"150",align:"center"}}),e._v(" "),t("el-table-column",{attrs:{prop:"name",label:"来源",align:"left"}}),e._v(" "),t("el-table-column",{attrs:{label:"操作",align:"center"},scopedSlots:e._u([{key:"default",fn:function(a){return t("div",{},[t("cms-button",{directives:[{name:"perms",rawName:"v-perms",value:"/word/origin/edit",expression:"'/word/origin/edit'"}],attrs:{type:"edit"},nativeOn:{click:function(t){e.edit(a.row.name,a.row.id)}}}),e._v(" "),t("cms-button",{directives:[{name:"perms",rawName:"v-perms",value:"/word/origin/delete",expression:"'/word/origin/delete'"}],attrs:{type:"delete"},nativeOn:{click:function(t){e.deleteBatch(e.$api.wordOriginDelete,a.row.id)}}})],1)}}])})],1),e._v(" "),t("div",{staticClass:"cms-list-footer "},[t("div",{staticClass:"cms-left"},[t("el-button",{directives:[{name:"perms",rawName:"v-perms",value:"/word/origin/delete",expression:"'/word/origin/delete'"}],attrs:{disabled:e.disabled},on:{click:function(a){e.deleteBatch(e.$api.wordOriginDelete,e.ids)}}},[e._v("批量删除")])],1),e._v(" "),t("cms-pagination",{attrs:{total:e.total},on:{change:e.getPages}})],1),e._v(" "),t("el-dialog",{attrs:{title:"来源管理-添加",visible:e.dialogVisible,width:"30%","close-on-click-modal":!1,"before-close":e.handleClose},on:{"update:visible":function(a){e.dialogVisible=a}}},[t("span",[t("el-form",{ref:"form",attrs:{model:e.param,rules:e.rules,"label-width":"80px"}},[t("el-form-item",{attrs:{label:"来源",prop:"name"}},[t("el-input",{model:{value:e.param.name,callback:function(a){e.$set(e.param,"name",a)},expression:"param.name"}})],1)],1)],1),e._v(" "),t("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[t("el-button",{on:{click:function(a){e.dialogVisible=!1}}},[e._v("取消")]),e._v(" "),t("el-button",{attrs:{type:"primary"},on:{click:e.save}},[e._v("确定")])],1)]),e._v(" "),t("el-dialog",{attrs:{title:"来源管理-修改",visible:e.dialogVisible1,width:"30%","close-on-click-modal":!1,"before-close":e.handleClose},on:{"update:visible":function(a){e.dialogVisible1=a}}},[t("span",[t("el-form",{ref:"form1",attrs:{model:e.updateParam,rules:e.rules,"label-width":"80px"}},[t("el-form-item",{attrs:{label:"来源",prop:"name"}},[t("el-input",{model:{value:e.updateParam.name,callback:function(a){e.$set(e.updateParam,"name",a)},expression:"updateParam.name"}})],1)],1)],1),e._v(" "),t("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[t("el-button",{on:{click:function(a){e.dialogVisible1=!1}}},[e._v("取消")]),e._v(" "),t("el-button",{attrs:{type:"primary"},on:{click:e.update}},[e._v("确定")])],1)])],1)},r=[],d={render:s,staticRenderFns:r},c=d,m=t("operateHtmlCreate"),p=i,u=m(o,c,!1,p,"data-v-44655dab",null);a.default=u.exports},ZmKH:function(e,a,t){a=e.exports=t("UTlt")(!1),a.push([e.i,"\n.el-dialog__body[data-v-44655dab]{\n   min-height: 150px;\n}\n",""])}});