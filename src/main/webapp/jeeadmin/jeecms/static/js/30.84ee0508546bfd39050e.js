webpackJsonp([30],{Jvxf:function(a,n,e){"use strict";function t(a){e("ThhX")}Object.defineProperty(n,"__esModule",{value:!0});var l=e("lcoF"),s=e("getHttpTools"),o=e.n(s),i=e("x1ym"),r={mixins:[l.a],data:function(){var a=i.a.required("此项必填"),n=i.a.number("只能输入数字");return{params:{},rules:{name:[a],priority:[a,n],allowPerDay:[a,n],allowMaxFile:[a,n],allowFileSize:[a,n],allowFileTotal:[a,n]},memberGroup:[],roles:[]}},methods:{getRoleIds:function(a){console.log(a)},getDataInfo:function(a,n){var e=this,t=this.$api;o.a.all([o.a.post(t.groupGet,{id:a,https:n})]).then(o.a.spread(function(a){e.dataInfo=a.body,e.$refs.form.resetFields(),e.loading=!1})).catch(function(a){e.loading=!1})},add:function(a){this.dataInfo.steps=1,this.saveDataInfo(a,this.$api.groupSave,this.dataInfo,"list")}},created:function(){this.getDataInfo(this.id)}},d=function(){var a=this,n=a.$createElement,e=a._self._c||n;return e("section",{directives:[{name:"loading",rawName:"v-loading",value:a.loading,expression:"loading"}],staticClass:"cms-body"},[e("cms-back"),a._v(" "),e("el-form",{ref:"form",staticClass:"cms-form",attrs:{model:a.dataInfo,rules:a.rules,"label-width":"162px"}},[e("el-form-item",{staticClass:"flex-50",attrs:{label:"名称",prop:"name"}},[e("el-input",{staticClass:"cms-width",attrs:{type:"required"},model:{value:a.dataInfo.name,callback:function(n){a.$set(a.dataInfo,"name",n)},expression:"dataInfo.name"}})],1),a._v(" "),e("el-form-item",{staticClass:"flex-50",attrs:{label:"排列顺序",prop:"priority"}},[e("el-input",{staticClass:"cms-width",attrs:{type:"number"},model:{value:a.dataInfo.priority,callback:function(n){a.$set(a.dataInfo,"priority",n)},expression:"dataInfo.priority"}})],1),a._v(" "),e("el-form-item",{staticClass:"flex-50",attrs:{label:"每日附件总尺寸",prop:"allowPerDay"}},[e("el-input",{staticClass:"cms-width",attrs:{type:"required"},model:{value:a.dataInfo.allowPerDay,callback:function(n){a.$set(a.dataInfo,"allowPerDay",n)},expression:"dataInfo.allowPerDay"}}),a._v(" "),e("span",{staticClass:"gray"},[a._v("0为不限制，单位(KB)")])],1),a._v(" "),e("el-form-item",{staticClass:"flex-50",attrs:{label:"最大附件总尺寸",prop:"allowMaxFile"}},[e("el-input",{staticClass:"cms-width",attrs:{type:"required"},model:{value:a.dataInfo.allowMaxFile,callback:function(n){a.$set(a.dataInfo,"allowMaxFile",n)},expression:"dataInfo.allowMaxFile"}}),a._v(" "),e("span",{staticClass:"gray"},[a._v("0为不限制，单位(KB)")])],1),a._v(" "),e("el-form-item",{staticClass:"flex-100",attrs:{label:"允许上传后缀",prop:"allowSuffix"}},[e("el-input",{staticClass:"cms-width",model:{value:a.dataInfo.allowSuffix,callback:function(n){a.$set(a.dataInfo,"allowSuffix",n)},expression:"dataInfo.allowSuffix"}}),a._v(" "),e("span",{staticClass:"gray"},[a._v('留空则不限制，多个用","分开')])],1),a._v(" "),e("el-form-item",{staticClass:"flex-50",attrs:{label:"评论需要审核",prop:"needCheck"}},[e("el-radio-group",{model:{value:a.dataInfo.needCheck,callback:function(n){a.$set(a.dataInfo,"needCheck",n)},expression:"dataInfo.needCheck"}},[e("el-radio",{attrs:{label:!0}},[a._v("是")]),a._v(" "),e("el-radio",{attrs:{label:!1}},[a._v("否")])],1)],1),a._v(" "),e("el-form-item",{staticClass:"flex-50",attrs:{label:"评论需要验证码",prop:"needCaptcha"}},[e("el-radio-group",{model:{value:a.dataInfo.needCaptcha,callback:function(n){a.$set(a.dataInfo,"needCaptcha",n)},expression:"dataInfo.needCaptcha"}},[e("el-radio",{attrs:{label:!0}},[a._v("是")]),a._v(" "),e("el-radio",{attrs:{label:!1}},[a._v("否")])],1)],1),a._v(" "),e("div",{staticClass:"form-footer"},[e("el-button",{directives:[{name:"perms",rawName:"v-perms",value:"/group/add",expression:"'/group/add'"}],attrs:{type:"warning"},on:{click:function(n){a.add(!0)}}},[a._v("保存并继续添加")]),a._v(" "),e("el-button",{directives:[{name:"perms",rawName:"v-perms",value:"/group/add",expression:"'/group/add'"}],attrs:{type:"primary"},on:{click:function(n){a.add(!1)}}},[a._v("提交")]),a._v(" "),e("el-button",{attrs:{type:"info"},on:{click:a.$reset}},[a._v("重置")])],1)],1)],1)},c=[],f={render:d,staticRenderFns:c},p=f,u=e("operateHtmlCreate"),m=t,v=u(r,p,!1,m,null,null);n.default=v.exports},ThhX:function(a,n,e){var t=e("nZqf");"string"==typeof t&&(t=[[a.i,t,""]]),t.locals&&(a.exports=t.locals);e("FIqI")("2c0b6830",t,!0,{})},nZqf:function(a,n,e){n=a.exports=e("UTlt")(!1),n.push([a.i,"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",""])}});