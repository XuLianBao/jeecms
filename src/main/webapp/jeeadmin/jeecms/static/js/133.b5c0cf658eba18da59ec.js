webpackJsonp([133],{lDj7:function(t,e,i){var n=i("tmUO");"string"==typeof n&&(n=[[t.i,n,""]]),n.locals&&(t.exports=n.locals);i("FIqI")("1f5c6d9d",n,!0,{})},spI4:function(t,e,i){"use strict";function n(t){i("lDj7")}Object.defineProperty(e,"__esModule",{value:!0});var a=i("lcoF"),o=i("getHttpTools"),s=i.n(o),l=i("x1ym"),r={mixins:[a.a],data:function(){var t=l.a.required("此项必填"),e=l.a.number("只能输入数字");l.a.string("只能输入英文字母");return{params:this.$route.query,rules:{parentId:[t],title:[t],typeId:[t,e]},fieldRequied:[{required:!0,message:"此项必填",trigger:"change"}],parentId:"",dataState:!1,isLink:!1,hasContentImg:!1,hasTitleImg:!1,channelList:[],itemList:[],topicList:[],typeList:[],groupList:[],workflowList:[],tplAll:[],chargeMap:[],contentInfo:{},info:{parentId:"",channelId:"",channelIds:[],bold:!1,topicIds:"",link:"",originUrl:"",topLevelDate:"",sortDate:"",releaseDate:"",pigeonholeDate:"",typeId:"",recommend:!1,recommendLevel:1,draft:!1,tplContent:"",tplMobileContent:"",charge:!1,attachments:[],attachmentNames:[],attachmentPaths:[],mediaPath:"",mediaType:"CK",pics:[],picPaths:[],picDescs:[],chargeAmount:"",rewardPattern:!1,rewardFix:"",rewardRandomMin:0,rewardRandomMax:10},isTypeImg:!1,props:{label:"name",children:"zones",isLeaf:"isChild",id:"id"},channelVisble:!1,ue:[]}},methods:{back:function(){this.routerLink("/content/list","list",this.parentId)},getChannelId:function(t,e){this.routerLink("/content/list","list",t.id)},checkChange:function(t,e,i){console.log(this.$refs.channelTree.getCheckedKeys()),this.info.channelIds=this.$refs.channelTree.getCheckedKeys()},handleClose:function(){},ansyTree:function(t,e){if(0===t.level)return e([{name:"根目录",id:"",isChild:!0}]);t.level>0&&s.a.post(this.$api.channelList,{parentId:t.data.id}).then(function(t){var i=[];for(var n in t.body){var a={};a.id=t.body[n].id,a.isChild=!(t.body[n].childCount>0),a.name=t.body[n].name,i.push(a)}return e(i)})},getTypeId:function(t){var e=this;s.a.post(this.$api.typeGet,{id:t}).then(function(t){"200"==t.code&&(e.isTypeImg=t.body.hasImage)})},getPath:function(t){var e=this;""!=t.target.value&&s.a.post(this.$api.channelCreatPath,{name:t.target.value}).then(function(t){e.info.path=t.body})},getFieldImg:function(t,e,i,n){this.info[e]=t},getAttachments:function(t){this.info.attachments=t},getPics:function(t){this.info.pics=t},getDocTxt:function(t,e){this.ue[e].execCommand("inserthtml",t)},getMediaPath:function(t,e){this.info[e]=t},getUeditor:function(t,e){this.ue[e]=t},getTitleImg:function(t){this.info.titleImg=t},getContentImg:function(t){this.info.contentImg=t},getTypeImg:function(t){this.info.typeImg=t},getContentInfo:function(t){var e=this;s.a.post(this.$api.contentGet,{id:t}).then(function(t){e.contentInfo=t.body,e.info=t.body,e.params.modelId=t.body.modelId,e.info.modelId=t.body.modelId,e.params.parentId=t.body.channelId,e.parentId=t.body.channelId,e.getDataInfo()})},getDataInfo:function(t){var e=this;this.loading=!0;var i={modelId:this.params.modelId,isChannel:!1};s.a.post(this.$api.itemList,i).then(function(t){e.loading=!1,e.$refs.form.resetFields(),e.info.titleImg="",e.info.contentImg="";var i=t.body;for(var n in i)i[n].custom?7==i[n].dataType||e.$set(e.info,"attr_"+i[n].field,e.contentInfo["attr_"+i[n].field]):(i[n].dataType,e.$set(e.info,i[n].field,e.contentInfo[i[n].field]));e.itemList=i,e.getAllList(),e.getDefaultInfo(e.params.id)}).catch(function(t){e.loading=!1})},getDefaultInfo:function(t){var e=this;if(this.info.bold=this.contentInfo.bold,this.info.originUrl=this.contentInfo.originUrl,this.info.sortDate=this.contentInfo.sortDate,this.info.topLevelDate=this.contentInfo.topLevelDate,this.info.pigeonholeDate=this.contentInfo.pigeonholeDate,this.info.viewGroupIds=this.contentInfo.viewGroupIds,this.info.typeId=this.contentInfo.typeId,this.info.downNeed=this.contentInfo.downNeed,this.info.recommend=this.contentInfo.recommend,this.info.recommendLevel=this.contentInfo.recommendLevel,this.info.draft=this.contentInfo.draft,this.info.topicIds=this.contentInfo.topicIds[0],this.info.channelIds=this.contentInfo.channelIds,this.info.mediaPath=this.contentInfo.mediaPath,this.info.mediaType=this.contentInfo.mediaType,this.info.chargeAmount=this.contentInfo.chargeAmount,this.info.charge=this.contentInfo.charge,this.$set(this.info,"rewardPattern",this.contentInfo.rewardPattern),this.$set(this.info,"rewardRandomMax",this.contentInfo.rewardRandomMax),this.$set(this.info,"rewardRandomMin",this.contentInfo.rewardRandomMin),this.getTypeId(this.info.typeId),this.$set(this.info,"attachments",[]),this.$set(this.info,"pics",[]),""!=this.contentInfo.link&&(this.isLink=!0,this.info.link=this.contentInfo.link),this.contentInfo.rewardFix.length>0?this.chargeMap=this.contentInfo.rewardFix:s.a.post(this.$api.configContentChargeGet).then(function(t){var i=[];for(var n in t.body.fixMap)i.push(t.body.fixMap[n].value);e.chargeMap=i}),this.contentInfo.attachArr.length>0)for(var i in this.contentInfo.attachArr){var n={name:this.contentInfo.attachArr[i].attachmentNames,path:this.contentInfo.attachArr[i].attachmentPaths};this.info.attachments.push(n)}if(this.contentInfo.picArr.length>0)for(var a in this.contentInfo.picArr){var o={name:this.contentInfo.picArr[a].picDescs,path:this.contentInfo.picArr[a].picPaths};this.info.pics.push(o)}this.dataState=!0},getAllList:function(){var t=this,e=this.$api;s.a.post(e.channelGet,{id:this.params.parentId}).then(function(e){t.hasContentImg=e.body.hasContentImg,t.hasTitleImg=e.body.hasTitleImg,""!=t.params.parentId?t.info.parentId=e.body.nodeIds:t.info.parentId=[""]}),s.a.all([s.a.post(e.fullTextSearchChannelList,{hasContentOnly:!0}),s.a.post(e.topicListAll,{channelId:this.params.parentId}),s.a.post(e.typeList,{containDisabled:!1}),s.a.post(e.groupList),s.a.post(e.tplModelList,{modelId:this.params.modelId})]).then(s.a.spread(function(e,i,n,a,o){t.channelList=t.channelList.concat(e.body),t.topicList=i.body,t.typeList=n.body,t.groupList=a.body,t.tplAll=o.body})).catch(function(e){t.loading=!1})},getEditorContent:function(){void 0!=this.info.txt&&this.ue[0]&&(this.info.txt=this.ue[0].getContent()),void 0!=this.info.txt1&&this.ue[1]&&(this.info.txt1=this.ue[1].getContent()),void 0!=this.info.txt2&&this.ue[2]&&(this.info.txt2=this.ue[2].getContent()),void 0!=this.info.txt3&&this.ue[3]&&(this.info.txt3=this.ue[3].getContent())},getParams:function(){var t={},e=[],i=[],n=[],a=[];this.getEditorContent(),this.info.rewardFix=this.chargeMap;for(var o=0;o<this.info.pics.length;o++)e.push(this.info.pics[o].path),i.push(this.info.pics[o].name);for(var s in this.info.attachments)n.push(this.info.attachments[s].name),a.push(this.info.attachments[s].path);this.info.picPaths=e,this.info.picDescs=i,this.info.attachmentNames=n,this.info.attachmentPaths=a;for(var l in this.info)this.info[l]instanceof Array?t[l]=this.info[l].join(","):t[l]=this.info[l];return delete t.attachments,delete t.pics,delete t.comments,t.channelId=t.parentId.substring(t.parentId.lastIndexOf(",")+1),t.id=this.params.id,t},update:function(t){var e=this;if(""==this.getParams().channelId)return this.errorMessage("请选择一个栏目"),!1;this.$refs.form.validate(function(t){if(!t)return!1;e.loading=!0,s.a.post(e.$api.contentUpdate,e.getParams()).then(function(t){"200"==t.code&&(e.successMessage("修改成功"),setTimeout(function(){e.routerLink("/content/list","list",e.parentId)},1e3)),e.loading=!1}).catch(function(t){e.loading=!1})})}},created:function(){this.$store.dispatch("setCollapse",!0),this.getContentInfo(this.params.id)},mounted:function(){}},c=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("section",{staticClass:"cms-body flex"},[i("a",{staticClass:"cms-back",attrs:{href:"javascript:void(0)"},on:{click:t.back}}),t._v(" "),i("cms-tree",{on:{change:t.getChannelId}}),t._v(" "),i("div",{staticClass:"cms-content-right"},[i("el-form",{directives:[{name:"loading",rawName:"v-loading",value:t.loading,expression:"loading"}],ref:"form",staticClass:"cms-form",attrs:{model:t.info,rules:t.rules,"label-width":"162px"}},[i("el-form-item",{staticClass:"flex-50",attrs:{label:"选择栏目",prop:"parentId"}},[t.dataState?i("el-cascader",{staticClass:"cms-width",attrs:{props:{value:"id",label:"name",children:"child"},options:t.channelList,filterable:""},model:{value:t.info.parentId,callback:function(e){t.$set(t.info,"parentId",e)},expression:"info.parentId"}}):t._e(),t._v(" "),i("span",{staticClass:"gray"},[t._v("只能选择最后一层")])],1),t._v(" "),i("el-form-item",{staticClass:"flex-50",attrs:{label:"关联副栏目"}},[i("el-button",{on:{click:function(e){t.channelVisble=!0}}},[t._v("关联副栏目")]),t._v(" "),i("span",{staticClass:"gray"},[t._v("关联后本条内容将会出现在所选的栏目页，需要结合标签使用")])],1),t._v(" "),i("el-dialog",{staticClass:"dialog",attrs:{title:"选择副栏目",visible:t.channelVisble,width:"30%"},on:{"update:visible":function(e){t.channelVisble=e}}},[i("div",{staticClass:"tree-layout"},[i("div",{staticClass:"tree"},[i("el-tree",{ref:"channelTree",attrs:{load:t.ansyTree,lazy:"",props:t.props,"default-expanded-keys":[""],"default-checked-keys":t.info.channelIds,"show-checkbox":"",indent:16,"node-key":"id"},on:{"check-change":t.checkChange}})],1)]),t._v(" "),i("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[i("el-button",{on:{click:function(e){t.channelVisble=!1}}},[t._v("取消")]),t._v(" "),i("el-button",{attrs:{type:"primary"},on:{click:function(e){t.channelVisble=!1}}},[t._v("选择")])],1)]),t._v(" "),i("el-form-item",{staticClass:"flex-50",attrs:{label:"关联专题",prop:"topicIds"}},[i("el-select",{staticClass:"cms-width",model:{value:t.info.topicIds,callback:function(e){t.$set(t.info,"topicIds",e)},expression:"info['topicIds']"}},t._l(t.topicList,function(t,e){return i("el-option",{key:e,attrs:{label:t.name,value:t.id}})}))],1),t._v(" "),i("el-form-item",{staticClass:"flex-50"}),t._v(" "),t._l(t.itemList,function(e,n){return"title"==e.field?i("el-form-item",{key:n,staticClass:"flex-100",attrs:{label:e.label,prop:"title"}},[i("el-input",{staticClass:"cms-width",model:{value:t.info.title,callback:function(e){t.$set(t.info,"title",e)},expression:"info['title']"}}),t._v(" "),i("el-checkbox",{model:{value:t.isLink,callback:function(e){t.isLink=e},expression:"isLink"}},[t._v("外部链接")])],1):t._e()}),t._v(" "),t.isLink?i("el-form-item",{staticClass:"flex-100",attrs:{label:"外部链接地址"}},[i("el-input",{staticClass:"cms-width",model:{value:t.info.link,callback:function(e){t.$set(t.info,"link",e)},expression:"info['link']"}})],1):t._e(),t._v(" "),t._l(t.itemList,function(e,n){return"channelId"==e.field||"title"==e.field||"typeImg"==e.field||"titleImg"==e.field&&!t.hasTitleImg||"contentImg"==e.field&&!t.hasContentImg?t._e():i("el-form-item",{key:n,class:[e.single?"flex-100":"flex-50"],attrs:{label:e.label,prop:(e.custom?"attr_":"")+e.field,rules:e.required?t.fieldRequied:[]}},[1==e.dataType&&e.custom?i("el-input",{staticClass:"cms-width",model:{value:t.info["attr_"+e.field],callback:function(i){t.$set(t.info,"attr_"+e.field,i)},expression:"info['attr_'+item.field]"}}):t._e(),t._v(" "),1!=e.dataType||e.custom||"titleImg"==e.field||"contentImg"==e.field||"typeImg"==e.field||"attachments"==e.field||"media"==e.field||"name"==e.field||"origin"==e.field?t._e():i("el-input",{staticClass:"cms-width",model:{value:t.info[e.field],callback:function(i){t.$set(t.info,e.field,i)},expression:"info[item.field]"}}),t._v(" "),"tagStr"==e.field?i("span",{staticClass:"gray"},[t._v('用","分开')]):t._e(),t._v(" "),"shortTitle"==e.field?i("span",{staticClass:"gray"},[t._v("在列表中显示，留空则显示完整标题")]):t._e(),t._v(" "),"origin"==e.field?i("div",{staticClass:"inline-block"},[i("el-input",{staticClass:"w40p inline-block",model:{value:t.info[e.field],callback:function(i){t.$set(t.info,e.field,i)},expression:"info[item.field]"}}),t._v(" "),i("label",{staticClass:"ml-24"},[t._v("来源地址")]),t._v(" "),i("el-input",{staticClass:"w40p inline-block",model:{value:t.info.originUrl,callback:function(e){t.$set(t.info,"originUrl",e)},expression:"info['originUrl']"}})],1):t._e(),t._v(" "),"name"==e.field?i("el-input",{staticClass:"cms-width",on:{blur:t.getPath},model:{value:t.info[e.field],callback:function(i){t.$set(t.info,e.field,i)},expression:"info[item.field]"}}):t._e(),t._v(" "),"titleImg"==e.field&&t.hasTitleImg?i("cms-upload",{attrs:{src:t.info[e.field],isMark:!1},on:{change:t.getTitleImg}}):t._e(),t._v(" "),"contentImg"==e.field&&t.hasContentImg?i("cms-upload",{attrs:{src:t.info[e.field],isMark:!1},on:{change:t.getContentImg}}):t._e(),t._v(" "),"attachments"==e.field&&t.dataState?i("cms-multiple-upload",{attrs:{propList:t.info.attachments},on:{change:t.getAttachments}}):t._e(),t._v(" "),"pictures"==e.field&&t.dataState?i("cms-pictrues",{attrs:{propList:t.info.pics},on:{change:t.getPics}}):t._e(),t._v(" "),"media"==e.field?i("div",[i("cms-multiple-upload",{attrs:{src:t.info.mediaPath,multiple:!1,field:"mediaPath",propList:t.info.mediaPath},on:{get:t.getMediaPath}}),t._v(" "),i("label",[t._v("播放器")]),t._v(" "),i("el-radio-group",{model:{value:t.info.mediaType,callback:function(e){t.$set(t.info,"mediaType",e)},expression:"info['mediaType']"}},[i("el-radio",{attrs:{label:"WM"}}),t._v(" "),i("el-radio",{attrs:{label:"REAL"}}),t._v(" "),i("el-radio",{attrs:{label:"FLV"}}),t._v(" "),i("el-radio",{attrs:{label:"FLASH"}}),t._v(" "),i("el-radio",{attrs:{label:"CK"}})],1)],1):t._e(),t._v(" "),2==e.dataType&&e.custom?i("el-input",{staticClass:"cms-width",attrs:{type:"number",min:"0"},model:{value:t.info["attr_"+e.field],callback:function(i){t.$set(t.info,"attr_"+e.field,t._n(i))},expression:"info['attr_'+item.field]"}}):t._e(),t._v(" "),2!=e.dataType||e.custom?t._e():i("el-input",{staticClass:"cms-width",attrs:{type:"number",min:"0"},model:{value:t.info[e.field],callback:function(i){t.$set(t.info,e.field,i)},expression:"info[item.field]"}}),t._v(" "),3==e.dataType&&e.custom?i("el-input",{staticClass:"cms-width",model:{value:t.info["attr_"+e.field],callback:function(i){t.$set(t.info,"attr_"+e.field,i)},expression:"info['attr_'+item.field]"}}):t._e(),t._v(" "),4==e.dataType&&e.custom?i("el-input",{staticClass:"cms-width",attrs:{type:"textarea"},model:{value:t.info["attr_"+e.field],callback:function(i){t.$set(t.info,"attr_"+e.field,i)},expression:"info['attr_'+item.field]"}}):t._e(),t._v(" "),4!=e.dataType||e.custom||"txt"==e.field||"txt1"==e.field||"txt2"==e.field||"txt3"==e.field||"pictures"==e.field?t._e():i("el-input",{staticClass:"cms-width",attrs:{type:"textarea"},model:{value:t.info[e.field],callback:function(i){t.$set(t.info,e.field,i)},expression:"info[item.field]"}}),t._v(" "),5==e.dataType&&e.custom?i("el-date-picker",{staticClass:"cms-width",attrs:{type:"date","value-format":"yyyy-MM-dd"},model:{value:t.info["attr_"+e.field],callback:function(i){t.$set(t.info,"attr_"+e.field,i)},expression:"info['attr_'+item.field]"}}):t._e(),t._v(" "),5!=e.dataType||e.custom||"releaseDate"==e.field?t._e():i("el-date-picker",{staticClass:"cms-width",attrs:{type:"date","value-format":"yyyy-MM-dd"},model:{value:t.info[e.field],callback:function(i){t.$set(t.info,e.field,i)},expression:"info[item.field]"}}),t._v(" "),"releaseDate"==e.field?i("div",[i("el-date-picker",{staticStyle:{width:"195px"},attrs:{type:"datetime","value-format":"yyyy-MM-dd HH:mm:ss"},model:{value:t.info.releaseDate,callback:function(e){t.$set(t.info,"releaseDate",e)},expression:"info['releaseDate']"}}),t._v(" "),i("label",{staticClass:"ml-24",attrs:{for:""}},[t._v("归档日期")]),t._v(" "),i("el-date-picker",{staticStyle:{width:"195px"},attrs:{type:"date","value-format":"yyyy-MM-dd"},model:{value:t.info.pigeonholeDate,callback:function(e){t.$set(t.info,"pigeonholeDate",e)},expression:"info['pigeonholeDate']"}})],1):t._e(),t._v(" "),6==e.dataType&&e.custom?i("el-select",{staticClass:"cms-width",model:{value:t.info["attr_"+e.field],callback:function(i){t.$set(t.info,"attr_"+e.field,i)},expression:"info['attr_'+item.field]"}},t._l(e.optValue,function(t,e){return i("el-option",{key:e,attrs:{label:t,value:t}})})):t._e(),t._v(" "),"titleColor"==e.field?i("div",{staticClass:"flex"},[i("el-color-picker",{model:{value:t.info[e.field],callback:function(i){t.$set(t.info,e.field,i)},expression:"info[item.field]"}}),t._v(" "),i("el-checkbox",{staticClass:"ml-24",model:{value:t.info.bold,callback:function(e){t.$set(t.info,"bold",e)},expression:"info['bold']"}},[t._v("是否加粗")])],1):t._e(),t._v(" "),"topLevel"==e.field?i("div",[i("el-input",{staticClass:"w50",attrs:{type:"number"},model:{value:t.info.topLevel,callback:function(e){t.$set(t.info,"topLevel",e)},expression:"info['topLevel']"}}),t._v(" "),i("label",{staticClass:"ml-24"},[t._v("固顶到期日期:")]),t._v(" "),i("el-date-picker",{staticClass:"w120",staticStyle:{width:"195px"},attrs:{type:"date","value-format":"yyyy-MM-dd"},model:{value:t.info.topLevelDate,callback:function(e){t.$set(t.info,"topLevelDate",e)},expression:"info['topLevelDate']"}}),t._v(" "),i("label",{staticClass:"ml-24"},[t._v("排序时间:")]),t._v(" "),i("el-date-picker",{staticClass:"w120",staticStyle:{width:"195px"},attrs:{type:"datetime","value-format":"yyyy-MM-dd HH:mm:ss"},model:{value:t.info.sortDate,callback:function(e){t.$set(t.info,"sortDate",e)},expression:"info['sortDate']"}})],1):t._e(),t._v(" "),"typeId"==e.field?i("div",[i("el-select",{staticStyle:{width:"220px"},on:{change:t.getTypeId},model:{value:t.info.typeId,callback:function(e){t.$set(t.info,"typeId",e)},expression:"info['typeId']"}},t._l(t.typeList,function(t,e){return i("el-option",{key:e,attrs:{label:t.name,value:t.id}})})),t._v(" "),i("el-checkbox",{staticClass:"ml-24",model:{value:t.info.recommend,callback:function(e){t.$set(t.info,"recommend",e)},expression:"info['recommend']"}},[t._v("推荐")]),t._v(" "),i("el-checkbox",{model:{value:t.info.draft,callback:function(e){t.$set(t.info,"draft",e)},expression:"info['draft']"}},[t._v("草稿")]),t._v(" "),t.info.recommend?i("div",{staticClass:"mt-10"},[i("label",{attrs:{for:""}},[t._v("推荐等级")]),t._v(" "),i("el-input",{staticClass:"w50",attrs:{type:"number"},model:{value:t.info.recommendLevel,callback:function(e){t.$set(t.info,"recommendLevel",e)},expression:"info['recommendLevel']"}})],1):t._e(),t._v(" "),t.isTypeImg?i("div",{staticClass:"bread-box",staticStyle:{"margin-top":"12px"}},[i("label",{staticStyle:{"margin-right":"10px"},attrs:{for:""}},[t._v("类型图")]),t._v(" "),i("cms-upload",{attrs:{src:t.info.typeImg,field:"typeImg",isMark:!1},on:{get:t.getFieldImg}})],1):t._e()],1):t._e(),t._v(" "),"tplContent"==e.field?i("el-select",{staticClass:"cms-width",model:{value:t.info[e.field],callback:function(i){t.$set(t.info,e.field,i)},expression:"info[item.field]"}},[i("el-option",{attrs:{label:"默认",value:""}}),t._v(" "),t._l(t.tplAll.contentTpl,function(t,e){return i("el-option",{key:e,attrs:{label:t,value:t}})})],2):t._e(),t._v(" "),"tplMobileContent"==e.field?i("el-select",{staticClass:"cms-width",model:{value:t.info[e.field],callback:function(i){t.$set(t.info,e.field,i)},expression:"info[item.field]"}},[i("el-option",{attrs:{label:"默认",value:""}}),t._v(" "),t._l(t.tplAll.contentMobileTpl,function(t,e){return i("el-option",{key:e,attrs:{label:t,value:t}})})],2):t._e(),t._v(" "),7==e.dataType&&e.custom?i("el-checkbox-group",{model:{value:t.info["attr_"+e.field],callback:function(i){t.$set(t.info,"attr_"+e.field,i)},expression:"info['attr_'+item.field]"}},t._l(e.optValue,function(t,e){return i("el-checkbox",{key:e,attrs:{label:t}})})):t._e(),t._v(" "),7!=e.dataType||e.custom||"viewGroupIds"!=e.field?t._e():i("el-checkbox-group",{model:{value:t.info[e.field],callback:function(i){t.$set(t.info,e.field,i)},expression:"info[item.field]"}},t._l(t.groupList,function(e,n){return i("el-checkbox",{key:n,attrs:{label:e.id}},[t._v(t._s(e.name))])})),t._v(" "),8==e.dataType&&e.custom?i("el-radio-group",{model:{value:t.info["attr_"+e.field],callback:function(i){t.$set(t.info,"attr_"+e.field,i)},expression:"info['attr_'+item.field]"}},t._l(e.optValue,function(t,e){return i("el-radio",{key:e,attrs:{label:t}})})):t._e(),t._v(" "),"charge"==e.field?i("div",[i("el-radio-group",{model:{value:t.info.charge,callback:function(e){t.$set(t.info,"charge",e)},expression:"info['charge']"}},[i("el-radio",{attrs:{label:0}},[t._v("免费")]),t._v(" "),i("el-radio",{attrs:{label:1}},[t._v("收费")]),t._v(" "),i("el-radio",{attrs:{label:2}},[t._v("打赏")])],1),t._v(" "),i("div",[1==t.info.charge?i("div",{staticClass:" mt-10"},[i("label",{attrs:{for:""}},[t._v("收费金额")]),t._v(" "),i("el-input",{staticClass:"w50",attrs:{type:"number",min:"0"},model:{value:t.info.chargeAmount,callback:function(e){t.$set(t.info,"chargeAmount",e)},expression:"info.chargeAmount"}})],1):t._e(),t._v(" "),2==t.info.charge?i("div",{staticClass:" mt-10"},[i("label",{attrs:{for:""}},[t._v("打赏方式")]),t._v(" "),i("el-select",{model:{value:t.info.rewardPattern,callback:function(e){t.$set(t.info,"rewardPattern",e)},expression:"info['rewardPattern']"}},[i("el-option",{attrs:{label:"随机",value:!1}}),t._v(" "),i("el-option",{attrs:{label:"固定",value:!0}})],1)],1):t._e(),t._v(" "),0==t.info.rewardPattern&&2==t.info.charge?i("div",{staticClass:"mt-10"},[i("label",{attrs:{for:""}},[t._v("随机金额")]),t._v(" "),i("label",[t._v("最小")]),t._v(" "),i("el-input",{staticClass:"w50",attrs:{type:"number"},model:{value:t.info.rewardRandomMin,callback:function(e){t.$set(t.info,"rewardRandomMin",e)},expression:"info['rewardRandomMin']"}}),t._v(" "),i("label",[t._v("最大")]),t._v(" "),i("el-input",{staticClass:"w50",attrs:{type:"number"},model:{value:t.info.rewardRandomMax,callback:function(e){t.$set(t.info,"rewardRandomMax",e)},expression:"info['rewardRandomMax']"}})],1):t._e(),t._v(" "),1==t.info.rewardPattern&&2==t.info.charge?i("div",{staticClass:" mt-10"},[i("label",{attrs:{for:""}},[t._v("固定金额")]),t._v(" "),t._l(t.chargeMap,function(e,n){return i("el-input",{key:e,staticClass:"w50",staticStyle:{"margin-right":"10px"},attrs:{type:"number"},model:{value:t.chargeMap[n],callback:function(e){t.$set(t.chargeMap,n,e)},expression:"chargeMap[index]"}})})],2):t._e()])],1):t._e(),t._v(" "),9==e.dataType&&e.custom?i("cms-multiple-upload",{attrs:{src:t.info["attr_"+e.field],multiple:!1,field:"attr_"+e.field,btnLabel:"上传"},on:{get:t.getMediaPath}}):t._e(),t._v(" "),10==e.dataType&&e.custom?i("cms-upload",{attrs:{src:t.info["attr_"+e.field],field:"attr_"+e.field},on:{get:t.getFieldImg}}):t._e(),t._v(" "),"txt"==e.field&&t.dataState?i("div",[i("cms-editor",{attrs:{defaultMsg:t.info.txt,index:0},on:{ready:t.getUeditor}})],1):t._e(),t._v(" "),"txt1"==e.field&&t.dataState?i("div",[i("cms-editor",{attrs:{defaultMsg:t.info.txt1,index:1},on:{ready:t.getUeditor}})],1):t._e(),t._v(" "),"txt2"==e.field&&t.dataState?i("div",[i("cms-editor",{attrs:{defaultMsg:t.info.txt2,index:2},on:{ready:t.getUeditor}})],1):t._e(),t._v(" "),"txt3"==e.field&&t.dataState?i("div",[i("cms-editor",{attrs:{defaultMsg:t.info.txt3,index:3},on:{ready:t.getUeditor}})],1):t._e()],1)}),t._v(" "),i("div",{staticClass:"form-footer"},[i("el-button",{directives:[{name:"perms",rawName:"v-perms",value:"/content/update",expression:"'/content/update'"}],attrs:{type:"primary"},on:{click:function(e){t.update(!1)}}},[t._v("修改")]),t._v(" "),i("el-button",{attrs:{type:"info"},on:{click:t.$reset}},[t._v("重置")])],1)],2)],1)],1)},d=[],f={render:c,staticRenderFns:d},p=f,h=i("operateHtmlCreate"),m=n,u=h(r,p,!1,m,"data-v-165db916",null);e.default=u.exports},tmUO:function(t,e,i){e=t.exports=i("UTlt")(!1),e.push([t.i,"\n.w40p[data-v-165db916]{\n  width: 35% !important;\n}\n",""])}});