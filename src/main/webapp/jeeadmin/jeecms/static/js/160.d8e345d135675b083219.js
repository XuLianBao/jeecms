webpackJsonp([160], {
    "userTest": function (e, t, i) {
        "use strict";

        function n(e) {
            i("zGG4")
        }

        Object.defineProperty(t, "__esModule", {value: !0});
        var a = i("HzJ8"),
            l = i.n(a),
            r = i("5HJ5"),
            s = i("getHttpTools"),
            o = i.n(s),
            c = (i("getBaseUrl"), {
                mixins: [r.a], data: function () {
                    return {globalUrl: this.$getUrl(), params: {queryCtgId: ""}, LinkTypes: []}
                }, methods: {
                    checkP: function (e) {
                        /^([1-9]\d{0,3}|0)$/.test(e) || this.open()
                    }, open: function () {
                        var e = this;
                        this.$alert("排列顺序不能为空且不能超过4位数", "提示", {
                            confirmButtonText: "确定", callback: function (t) {
                                e.initTableData(e.$api.userTestList, e.params)
                            }
                        })
                    }, getLinkTypes: function () {
                        var e = this;
                        this.LinkTypes = [{name: "所有类别", id: ""}], o.a.post(this.$api.linkTypeList).then(function (t) {
                            "200" == t.code && (e.LinkTypes = e.LinkTypes.concat(t.body))
                        })
                    }, getPriority: function () {
                        var e = [], t = !0, i = !1, n = void 0;
                        try {
                            for (var a, r = l()(this.checkedList); !(t = (a = r.next()).done); t = !0) {
                                var s = a.value;
                                e.push(s.priority)
                            }
                        } catch (e) {
                            i = !0, n = e
                        } finally {
                            try {
                                !t && r.return && r.return()
                            } finally {
                                if (i) {
                                    throw n
                                }
                            }
                        }
                        return e.join(",")
                    }
                }, created: function () {
                    this.initTableData(this.$api.userTestList, this.params), this.getLinkTypes(), console.log(this.getParams())
                }
            }), p = function () {
                var e = this, t = e.$createElement, installHtml = e._self._c || t;
                return installHtml("section",
                                   {
                                       directives: [{
                                           name: "loading",
                                           rawName: "v-loading",
                                           value: e.loading,
                                           expression: "loading"
                                       }],
                                       staticClass: "cms-body"
                                   },
                                   [
                                       // installHtml("div", {staticClass: "cms-list-header "},//加载表头添加按钮
                                       //             [installHtml("el-button", {
                                       //                 directives: [{
                                       //                     name: "perms",
                                       //                     rawName: "v-perms",
                                       //                     value: "/userTest/save",
                                       //                     expression: "'/userTest/save'"
                                       //                 }], attrs: {type: "primary", icon: "el-icon-plus"}, on: {
                                       //                     click: function (t) {
                                       //                         e.routerLink("/userTest/save", "save", 0)
                                       //                     }
                                       //                 }
                                       //             }, [e._v("添加")])], 1),
                                       // installHtml("div", {staticClass: "cms-list-header"},//加载表头下拉框
                                       //             [installHtml("el-select", {
                                       //                 on: {change: e.query}, model: {
                                       //                     value: e.params.queryCtgId, callback: function (t) {
                                       //                         e.$set(e.params, "queryCtgId", t)
                                       //                     }, expression: "params.queryCtgId"
                                       //                 }
                                       //             }, e._l(e.LinkTypes, function (t, n) {
                                       //                 return installHtml("el-option", {
                                       //                     key: n,
                                       //                     attrs: {label: e.LinkTypes[n].name, value: e.LinkTypes[n].id}
                                       //                 })
                                       //             }))], 1), e._v(" "),

                                       //渲染查询表头
                                       installHtml("div",
                                                   {staticClass: "cms-list-header flex-between"},
                                                   [installHtml("el-button", {
                                                       directives: [{
                                                           name: "perms",
                                                           rawName: "v-perms",
                                                           value: "/userTest/save",
                                                           expression: "'/userTest/save'"
                                                       }], attrs: {type: "primary", icon: "el-icon-plus"}, on: {
                                                           click: function (n) {
                                                               e.routerLink("/userTest/save", "save", 0)
                                                           }
                                                       }
                                                   }, [e._v("添加")]), e._v(" "),
                                                    installHtml("div",
                                                                [
                                                                    installHtml("label", {staticClass: "cms-label"}, [e._v("性别")]), e._v(" "),
                                                                    installHtml("el-select", {

                                                                                on: {
                                                                                    change: e.query,
                                                                                    ready:function doit(){alert('imready')}
                                                                                },
                                                                                  attrs: {label: "性别"},
                                                                                model: {
                                                                                    value: e.params.querySex,
                                                                                    callback: function (n) {
                                                                                        e.$set(e.params, "querySex",n)
                                                                                    },
                                                                                    expression: "params.querySex"
                                                                                }
                                                                            },
                                                                            [
                                                                             installHtml("el-option",
                                                                                         {
                                                                                             attrs: {
                                                                                                 checked:"1",
                                                                                                 label: "女",
                                                                                                 value: "0"
                                                                                             }
                                                                                         }),
                                                                             e._v(" "),
                                                                             installHtml("el-option",
                                                                                         {
                                                                                             attrs: {
                                                                                                 label: "男",
                                                                                                 value: "1"
                                                                                             }
                                                                                         }),
                                                                             e._v(" "),
                                                                             installHtml("el-option",
                                                                                         {
                                                                                             attrs: {
                                                                                                 label: "未知",
                                                                                                 value: "3"
                                                                                             }
                                                                                         })],
                                                                            1), e._v(" "),


                                                                 installHtml("cms-input", {
                                                                     attrs: {label: "用户名"},
                                                                     model: {
                                                                         value: e.params.userName,
                                                                         callback: function (n) {
                                                                             e.$set(e.params,
                                                                                    "userName", n)
                                                                         },
                                                                         expression: "params.userName"
                                                                     }
                                                                 }), e._v(" "),
                                                                installHtml("el-button", {on: {click: e.query}},
                                                                             [e._v("查询")])]
                                                        , 1)
                                                   ]
                                           , 1), e._v(" "),
                                       //渲染表头数据结束

                                       installHtml("el-table", {//加载表格
                                           staticStyle: {width: "100%"},
                                           attrs: {data: e.tableData, stripe: ""},
                                           on: {"selection-change": e.checkIds}
                                       }, [
                                                       installHtml("el-table-column", {
                                                           attrs: {
                                                               type: "selection",
                                                               width: "65",
                                                               align: "right"
                                                           }
                                                       }), e._v(" "),//加载表格列
                                                       installHtml("el-table-column", {
                                                           attrs: {
                                                               prop: "id",
                                                               label: "ID",
                                                               width: "50",
                                                               align: "center"
                                                           }
                                                       }), e._v(" "),//加载表格列
                                                       installHtml("el-table-column",
                                                                   {attrs: {prop: "userName", label: "用戶名称", align: "center"}}),e._v(" "), /*加载表格列*/
                                                       // installHtml("el-table-column", {
                                                       //     attrs: {prop: "logo", label: "Logo", align: "center"},
                                                       //     scopedSlots: e._u([{
                                                       //         key: "default", fn: function (t) {
                                                       //             return ["" == t.row.logo ? installHtml("span",
                                                       //                                                    [e._v("无Logo")])
                                                       //                                      : e._e(), e._v(" "),
                                                       //                     "" != t.row.logo ? installHtml("span",
                                                       //                                                    [installHtml(
                                                       //                                                        "img", {
                                                       //                                                            staticClass: "logo",
                                                       //                                                            attrs: {
                                                       //                                                                src: e.globalUrl
                                                       //                                                                     + t.row.logo
                                                       //                                                            }
                                                       //                                                        })]) : e._e()]
                                                       //         }
                                                       //     }])
                                                       // }), e._v(" "),
                                                       // installHtml("el-table-column", {
                                                       //     attrs: {width: "100", label: "排列顺序", align: "center"},
                                                       //     scopedSlots: e._u([{
                                                       //         key: "default", fn: function (t) {
                                                       //             return installHtml("div", {}, [installHtml("el-input", {
                                                       //                 staticClass: "w50",
                                                       //                 attrs: {type: "number"},
                                                       //                 on: {
                                                       //                     blur: function (i) {
                                                       //                         e.checkP(t.row.priority)
                                                       //                     }
                                                       //                 },
                                                       //                 model: {
                                                       //                     value: t.row.priority, callback: function (i) {
                                                       //                         e.$set(t.row, "priority", i)
                                                       //                     }, expression: "scope.row.priority"
                                                       //                 }
                                                       //             })], 1)
                                                       //         }
                                                       //     }])
                                                       // }), e._v(" "),
                                                       installHtml("el-table-column", {
                                                           attrs: {prop: "enabled", label: "性别", align: "center"},
                                                           scopedSlots: e._u([{
                                                               key: "default", fn: function (t) {
                                                                    if(t.row.sex =='0')
                                                                        return '女';
                                                                    else if(t.row.sex == '1')
                                                                        return '男';
                                                                   return "未知"
                                                               }
                                                           }])
                                                       }), e._v(" "),
                                                       installHtml("el-table-column", {
                                                           attrs: {width: "300", label: "操作", align: "center"},
                                                           scopedSlots: e._u([{
                                                               key: "default", fn: function (t) {
                                                                   return installHtml("div", {},
                                                                                      [installHtml("cms-button", {
                                                                                          directives: [{
                                                                                              name: "perms",
                                                                                              rawName: "v-perms",
                                                                                              value: "/userTest/get",
                                                                                              expression: "'/userTest/get'"
                                                                                          }],
                                                                                          attrs: {type: "edit"},
                                                                                          nativeOn: {
                                                                                              click: function (i) {
                                                                                                  e.routerLink(
                                                                                                      "/userTest/update",
                                                                                                      "update",
                                                                                                      t.row.id)
                                                                                              }
                                                                                          }
                                                                                      }), e._v(" "),
                                                                                       installHtml("cms-button", {
                                                                                           directives: [{
                                                                                               name: "perms",
                                                                                               rawName: "v-perms",
                                                                                               value: "/userTest/delete",
                                                                                               expression: "'/userTest/delete'"
                                                                                           }],
                                                                                           attrs: {type: "delete"},
                                                                                           nativeOn: {
                                                                                               click: function (i) {
                                                                                                   e.deleteBatch(
                                                                                                       e.$api.linkDelete,
                                                                                                       t.row.id)
                                                                                               }
                                                                                           }
                                                                                       })], 1)
                                                               }
                                                           }])
                                                       })], 1),
                                       e._v(" "),//表格渲染结束

                                       //渲染表的脚部
                                       installHtml("div", {staticClass: "cms-list-footer"},
                                                   [installHtml("div",
                                                                {staticClass: "cms-left"},
                                                                [installHtml("el-button", {
                                                                    directives: [{
                                                                        name: "perms",
                                                                        rawName: "v-perms",
                                                                        value: "/userTest/delete",
                                                                        expression: "'/userTest/delete'"
                                                                    }],
                                                                    attrs: {disabled: e.disabled},
                                                                    on: {
                                                                        click: function (t) {
                                                                            e.deleteBatch(
                                                                                e.$api.linkDelete,
                                                                                e.ids)
                                                                        }
                                                                    }
                                                                }, [e._v("批量删除")]), e._v(" ")],
                                                                1)]
                                       )
                                   ],
                                   1)
            },
            u = [],
            d = {render: p, staticRenderFns: u},
            v = d,
            m = i("operateHtmlCreate"),
            k = n,
            y = m(c, v, !1, k, null, null);
        t.default = y.exports
    }, rWGU: function (e, t, i) {
        t = e.exports = i("UTlt")(!1), t.push([e.i, "\n.logo{\n  height: 45px;\n}\n", ""])
    }, zGG4: function (e, t, i) {
        var n = i("rWGU");
        "string" == typeof n && (n = [[e.i, n, ""]]), n.locals && (e.exports = n.locals);
        i("FIqI")("40b20c8e", n, !0, {})
    },"customMenuEdit": function (e, t, i,obj) {
        "use strict";
        Object.defineProperty(t, "__esModule", {value: !0});
        var isBack;
        var src;
        var initMethond = ( {
                data: function () {
                    return {globalUrl: this.$getUrl(), params: {queryCtgId: ""}, LinkTypes: []}
                }, methods: {

                }, created: function () {
                    obj = JSON.parse(obj);
                    if(src ==null && obj!=null) {
                        if(obj.setCollapse){
                            this.$store.dispatch("setCollapse", !0);
                        }
                        if (obj.src.indexOf("http") != 0) {
                            src = this.$getUrl() + obj.src;
                        } else {
                            src = obj.src;
                        }
                    }

                }
            }), renderHtml = function () {
                var e = this, t = e.$createElement, installHtml = e._self._c || t;
                if(obj && obj.isBack){
                    isBack =  installHtml("cms-back"), e._v(" ");
                }else{
                    isBack=e._v(" ");
                }
                return installHtml("section",
                                   {
                                       directives: [{
                                           name: "loading",
                                           rawName: "v-loading",
                                           value: e.loading,
                                           expression: "loading"
                                       }],
                                       staticClass: "cms-body"
                                   },
                                   [
                                       isBack,
                                       installHtml("iframe",{attrs:{src:src,height:$(document.body).height()-120+"px",width:'100%',border:'none'},staticClass: "cms-body"}),
                                        e._v(" "),//表格渲染结束
                                   ],
                                   1)
            },
            y = i("operateHtmlCreate")(initMethond, {render: renderHtml, staticRenderFns: []}, !1, null, null, null);
        t.default = y.exports
    }
});