webpackJsonp([9], {
    BmVa: function (n, a, t) {
        a = n.exports = t("UTlt")(!1), a.push([n.i,"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
                                                   + "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
                                                   + "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", ""])
    },
    VQd7: function (n, a, t) {
        var e = t("BmVa");
        "string" == typeof e && (e = [[n.i, e, ""]]), e.locals && (n.exports = e.locals);
        t("FIqI")("018aac68", e, !0, {})
    }, uMon: function (n, a, t) {
        "use strict";

        function e(n) {
            t("VQd7")
        }

        Object.defineProperty(a, "__esModule", {value: !0});
        var s = t("getHttpTools"), i = t.n(s), o = t("x1ym"), l = t("lcoF"),
            r = {
            mixins: [l.a], data: function () {
                var n = o.a.required("此项必填"), a = o.a.number("必须为数字");
                return {
                    dataInfo: {},
                    LinkTypes: [],
                    rules: {
                        name: [n],
                        priority: [n, a],
                        views: [n, a],
                        enabled: [n],
                        domain: [n, o.a.checkChinese("URL不能包含中文"), o.a.isURL("URL格式不正确")],
                        categoryId: [n]
                    }
                }
            }, methods: {
                getPath: function (n) {
                    this.dataInfo.logo = n
                }, getLinkTypes: function () {
                    var n = this;
                    i.a.post(this.$api.linkTypeList).then(function (a) {
                        "200" == a.code && (n.LinkTypes = a.body, 0 != n.id && "" != n.dataInfo.categoryId
                                                                  || a.body.length > 0 && (n.dataInfo.categoryId =
                            a.body[0].id))
                    })
                }, getDataInfo: function (n) {
                    var a = this;
                    this.$api;
                    i.a.post(this.$api.linkGet, {id: n}).then(function (n) {
                        a.loading = !1, a.dataInfo = n.body, a.getLinkTypes()
                    }).catch(function (n) {
                        a.loading = !1
                    })
                }, update: function () {
                    this.updateDataInfo(this.$api.linkUpdate, this.dataInfo, "list")
                }, add: function (n) {
                    this.saveDataInfo(n, this.$api.linkSave, this.dataInfo, "list")
                }
            }, created: function () {
                this.getDataInfo(this.id)
            }
        }, d = function () {
            var n = this, a = n.$createElement, t = n._self._c || a;
            return t("section", {
                directives: [{name: "loading", rawName: "v-loading", value: n.loading, expression: "loading"}],
                staticClass: "cms-body"
            }, [t("cms-back"), n._v(" "), t("el-form", {
                ref: "form",
                staticClass: "cms-form",
                attrs: {model: n.dataInfo, rules: n.rules, "label-width": "162px"}
            }, [t("el-form-item", {staticClass: "flex-50 ", attrs: {label: "名称", prop: "name"}}, [t("el-input", {
                staticClass: "cms-width", model: {
                    value: n.dataInfo.name, callback: function (a) {
                        n.$set(n.dataInfo, "name", a)
                    }, expression: "dataInfo.name"
                }
            })], 1), n._v(" "), t("el-form-item", {staticClass: "flex-50 ", attrs: {label: "网站地址", prop: "domain"}},
                                  [t("el-input", {
                                      staticClass: "cms-width", model: {
                                          value: n.dataInfo.domain, callback: function (a) {
                                              n.$set(n.dataInfo, "domain", a)
                                          }, expression: "dataInfo.domain"
                                      }
                                  })], 1), n._v(" "),
                t("el-form-item", {staticClass: "flex-50", attrs: {label: "网站类别", prop: "categoryId"}}, [t("el-select",
                                                                                                           {
                                                                                                               staticClass: "cms-width",
                                                                                                               model: {
                                                                                                                   value: n.dataInfo.categoryId,
                                                                                                                   callback: function (a) {
                                                                                                                       n.$set(
                                                                                                                           n.dataInfo,
                                                                                                                           "categoryId",
                                                                                                                           a)
                                                                                                                   },
                                                                                                                   expression: "dataInfo.categoryId"
                                                                                                               }
                                                                                                           }, n._l(
                        n.LinkTypes, function (a, e) {
                            return t("el-option",
                                     {key: e, attrs: {label: n.LinkTypes[e].name, value: n.LinkTypes[e].id}})
                        }))], 1), n._v(" "),
                t("el-form-item", {staticClass: "flex-50 ", attrs: {label: "排序", prop: "priority"}}, [t("el-input", {
                    staticClass: "cms-width",
                    attrs: {type: "number"},
                    model: {
                        value: n.dataInfo.priority, callback: function (a) {
                            n.$set(n.dataInfo, "priority", a)
                        }, expression: "dataInfo.priority"
                    }
                })], 1), n._v(" "), t("el-form-item", {staticClass: "flex-50 ", attrs: {label: "点击次数", prop: "views"}},
                                      [t("el-input", {
                                          staticClass: "cms-width",
                                          attrs: {type: "number"},
                                          model: {
                                              value: n.dataInfo.views, callback: function (a) {
                                                  n.$set(n.dataInfo, "views", a)
                                              }, expression: "dataInfo.views"
                                          }
                                      })], 1), n._v(" "),
                t("el-form-item", {staticClass: "flex-50 ", attrs: {label: "显示", prop: "enabled"}}, [t("el-radio-group",
                                                                                                       {
                                                                                                           staticClass: "cms-width",
                                                                                                           model: {
                                                                                                               value: n.dataInfo.enabled,
                                                                                                               callback: function (a) {
                                                                                                                   n.$set(
                                                                                                                       n.dataInfo,
                                                                                                                       "enabled",
                                                                                                                       a)
                                                                                                               },
                                                                                                               expression: "dataInfo.enabled"
                                                                                                           }
                                                                                                       }, [t("el-radio",
                                                                                                             {attrs: {label: !0}},
                                                                                                             [n._v(
                                                                                                                 "是")]),
                                                                                                           n._v(" "),
                                                                                                           t("el-radio",
                                                                                                             {attrs: {label: !1}},
                                                                                                             [n._v(
                                                                                                                 "否")])],
                                                                                                       1)], 1),
                n._v(" "), t("el-form-item", {staticClass: "flex-50 ", attrs: {label: "Logo"}}, [t("cms-upload", {
                    staticClass: "cms-width",
                    attrs: {src: n.dataInfo.logo, isMark: !1},
                    on: {change: n.getPath}
                })], 1), n._v(" "), t("el-form-item", {staticClass: "flex-50 "}), n._v(" "),
                t("el-form-item", {staticClass: "flex-100", attrs: {label: "描述"}}, [t("el-input", {
                    staticClass: "cms-width",
                    attrs: {type: "textarea", maxlength: "255"},
                    model: {
                        value: n.dataInfo.description, callback: function (a) {
                            n.$set(n.dataInfo, "description", a)
                        }, expression: "dataInfo.description"
                    }
                })], 1), n._v(" "), t("div", {staticClass: "form-footer"}, [n.isType("save") ? t("el-button", {
                    directives: [{
                        name: "perms",
                        rawName: "v-perms",
                        value: "/link/save",
                        expression: "'/link/save'"
                    }], attrs: {type: "warning"}, on: {
                        click: function (a) {
                            n.add(!0)
                        }
                    }
                }, [n._v("\n提交并继续添加\n")]) : n._e(), n._v(" "),
                                  n.isType("save") ? t("el-button",
                                                       {
                                                           directives: [{
                                                               name: "perms",
                                                               rawName: "v-perms",
                                                               value: "/link/save",
                                                               expression: "'/link/save'"
                                                           }],
                                                           attrs: {type: "primary"},
                                                           on: {
                                                               click: function (a) {
                                                                   n.add(!1)
                                                               }
                                                           }
                                                       },
                                                       [n._v( "\n              提交\n            ")])
                                                                                             : n._e(), n._v(" "),
                                                                            n.isType("update") ? t("el-button", {
                                                                                                   directives: [{
                                                                                                       name: "perms",
                                                                                                       rawName: "v-perms",
                                                                                                       value: "/link/update",
                                                                                                       expression: "'/link/update'"
                                                                                                   }],
                                                                                                   attrs: {type: "primary"},
                                                                                                   on: {
                                                                                                       click: function (a) {
                                                                                                           n.update()
                                                                                                       }
                                                                                                   }
                                                                                               }, [n._v(
                                                                                "\n              修改\n            ")])
                                                                                               : n._e(), n._v(" "),
                                                                            t("el-button", {
                                                                                attrs: {type: "info"},
                                                                                on: {click: n.$reset}
                                                                            }, [n._v("重置")]), n._v(" "),
                                                                            n.isType("save") ? t("span",
                                                                                                 {staticClass: "gray"},
                                                                                                 [n._v(
                                                                                                     "选择“提交并继续添加”按钮会停留在添加页面；选择“提交”按钮后将跳转到对应的列表页")])
                                                                                             : n._e()], 1)], 1)], 1)
        }, c = [], p = {render: d, staticRenderFns: c}, f = p, m = t("operateHtmlCreate"), u = e, v = m(r, f, !1, u, null, null);
        a.default = v.exports
    }
});