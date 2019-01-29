webpackJsonp([141], {
    DOs3: function (a, t, e) {
        "use strict";

        function s(a) {
            e("GQNJ")
        }

        Object.defineProperty(t, "__esModule", {value: !0});
        var l = e("3cXf"), i = e.n(l), n = e("hRKE"), r = e.n(n), o = e("lcoF"), d = e("getHttpTools"), c = e.n(d),
            f = e("P9l9"), u = e("x1ym"), p = {
                mixins: [o.a], data: function () {
                    var a = this, t = u.a.required("此项必填"), e = u.a.number("只能输入数字"), s = u.a.email("请输入正确的邮箱地址"),
                        l = u.a.validateName("用户名已存在"), i = u.a.tel("请输入正确的固定电话"), n = u.a.mobile("请输入正确的手机号");
                    return {
                        params: {queryUsername: "", https: ""},
                        rules: {
                            username: [t, l], email: [s], password: [function () {
                                return {
                                    validator: function (t, e, s) {
                                        "" === e ? s() : e.length < a.passwordMinLen ? s(
                                            new Error("密码长度不能小于系统设定值:" + a.passwordMinLen)) : (""
                                                                                               !== a.dataInfo.confirmPassword
                                                                                               && a.$refs.form.validateField(
                                            "confirmPassword"), s())
                                    }, trigger: "blur"
                                }
                            }(), t], confirmPassword: [function () {
                                return {
                                    validator: function (t, e, s) {
                                        "" === e ? s() : e !== a.dataInfo.password ? s(new Error("前后密码不一致")) : s()
                                    }, trigger: "blur"
                                }
                            }(), t], groupId: [t, e], grain: [t, e], phone: [i], mobile: [n], rank: [e, function () {
                                return {
                                    validator: function (a, t, e) {
                                        "" != t && c.a.post(f.a.adminValRank, {id: "", rank: t}).then(function (a) {
                                            "" == t ? e() : "200" == a.code ? a.body.result ? e() : e(new Error("不能大于自身级别"))
                                                                            : e(new Error("服务器响应异常"))
                                        })
                                    }, trigger: "blur"
                                }
                            }()], disabled: [t]
                        },
                        memberGroup: [],
                        passwordMinLen: "",
                        roles: [],
                        dialogDepartments: !1,
                        parents: [],
                        departmentList: [],
                        siteList: [],
                        roleIds: [],
                        siteIds: [],
                        steps: [],
                        allChannels: [],
                        allControlChannels: [],
                        defaultProps: {label: "name", value: "id", children: "child"},
                        dialogVisible: !1
                    }
                }, methods: {
                    getSiteIds: function (a, t) {
                        var e = this.siteIds.indexOf(a);
                        this.steps[t] = 1, e >= 0 ? (this.allChannels[t] = !0, this.allControlChannels[t] = !0)
                                                  : (this.allChannels[t] = !1, this.allControlChannels[t] = !1)
                    }, getDataInfo: function (a, t) {
                        var e = this, s = this.$api;
                        c.a.all([c.a.post(s.adminGlobleGet, {id: a, https: t}), c.a.post(s.groupList), c.a.post(s.roleList),
                                 c.a.post(s.siteList)]).then(c.a.spread(function (a, t, s, l) {
                            e.dataInfo = a.body, e.passwordMinLen = e.dataInfo.passwordMinLen, e.dataInfo.groupId =
                                1, e.dataInfo.gender = !0, e.dataInfo.rank = 1, e.memberGroup = t.body, e.roles =
                                s.body, e.siteList = l.body;
                            for (var i in e.siteList) {
                                e.steps[i] = "", e.allChannels[i] = !1, e.allControlChannels[i] = !1;
                            }
                            e.$refs.form.resetFields(), e.loading = !1
                        })).catch(function (a) {
                            e.loading = !1
                        })
                    }, inputDigit: function (a) {
                        function t() {
                            return a.apply(this, arguments)
                        }

                        return t.toString = function () {
                            return a.toString()
                        }, t
                    }(function () {
                        var a = !1;
                        for (var t in this.siteIds) {
                            for (var e in this.siteList) {
                                if (this.siteList[e].id
                                    === this.siteIds[t]) {
                                    "" != this.steps[e] && this.steps[e];
                                    var s = this.steps[e], l = /[1-9]{1}/;
                                    "" !== s ? (s > 9 || s < 0 ? (alert("审核级别必须在1-9之间"), a = !0) : a = !1, s =
                                        l.exec(s), s =
                                        null === s ? "" : s[0]) : (alert("审核级别必填"), a =
                                        !0), this.$refs.reviewLevel[e]._data.currentValue = s, this.steps[e] = s
                                }
                            }
                        }
                        !0 === a && inputDigit(), this.dialogVisible = !1
                    }), add: function (a) {
                        var t = {};
                        for (var e in this.dataInfo) {
                            t[e] = this.dataInfo[e];
                        }
                        t.roleIds = this.roleIds.join(",");
                        var s = [];
                        t.siteIds = this.siteIds.join(",");
                        for (var l in t) {
                            "object" == r()(t[l]) && delete t[l];
                        }
                        for (var n in this.siteIds) {
                            for (var o in this.siteList) {
                                if (this.siteList[o].id
                                    === this.siteIds[n]) {
                                    var d = {
                                        siteIds: this.siteIds[n],
                                        steps: "" != this.steps[o] ? this.steps[o] : 1,
                                        allChannels: this.allChannels[o],
                                        allControlChannels: this.allControlChannels[o]
                                    };
                                    s.push(d)
                                }
                            }
                        }
                        t.source = i()(s), this.saveDataInfo(a, this.$api.adminGlobleSave, t, "list")
                    }
                }, created: function () {
                    this.getDataInfo(this.id)
                }
            }, m = function () {
                var a = this, t = a.$createElement, e = a._self._c || t;
                return e("section", {
                    directives: [{name: "loading", rawName: "v-loading", value: a.loading, expression: "loading"}],
                    staticClass: "cms-body"
                }, [e("cms-back"), a._v(" "), e("el-form", {
                    ref: "form",
                    staticClass: "cms-form",
                    attrs: {model: a.dataInfo, rules: a.rules, "label-width": "162px"}
                }, [e("el-form-item", {staticClass: "flex-50", attrs: {label: "用户名", prop: "username"}}, [e("el-input", {
                    staticClass: "cms-width", model: {
                        value: a.dataInfo.username, callback: function (t) {
                            a.$set(a.dataInfo, "username", t)
                        }, expression: "dataInfo.username"
                    }
                })], 1), a._v(" "), e("el-form-item", {staticClass: "flex-50", attrs: {label: "电子邮箱", prop: "email"}},
                                      [e("el-input", {
                                          staticClass: "cms-width",
                                          model: {
                                              value: a.dataInfo.email, callback: function (t) {
                                                  a.$set(a.dataInfo, "email", t)
                                              }, expression: "dataInfo.email"
                                          }
                                      })], 1), a._v(" "),
                    e("el-form-item", {staticClass: "flex-50", attrs: {label: "密码", prop: "password"}}, [e("el-input", {
                        staticClass: "cms-width",
                        attrs: {type: "password"},
                        model: {
                            value: a.dataInfo.password, callback: function (t) {
                                a.$set(a.dataInfo, "password", t)
                            }, expression: "dataInfo.password"
                        }
                    })], 1), a._v(" "),
                    e("el-form-item", {staticClass: "flex-50", attrs: {label: "确认密码", prop: "confirmPassword"}},
                      [e("el-input", {
                          staticClass: "cms-width",
                          attrs: {type: "password"},
                          model: {
                              value: a.dataInfo.confirmPassword, callback: function (t) {
                                  a.$set(a.dataInfo, "confirmPassword", t)
                              }, expression: "dataInfo.confirmPassword"
                          }
                      })], 1), a._v(" "),
                    e("el-form-item", {staticClass: "flex-50", attrs: {label: "会员组", prop: "groupId"}}, [e("el-select", {
                        staticClass: "cms-width", model: {
                            value: a.dataInfo.groupId, callback: function (t) {
                                a.$set(a.dataInfo, "groupId", t)
                            }, expression: "dataInfo.groupId"
                        }
                    }, a._l(a.memberGroup, function (a, t) {
                        return e("el-option", {key: t, attrs: {label: a.name, value: a.id}})
                    }))], 1), a._v(" "), e("el-form-item", {staticClass: "flex-50", attrs: {label: "等级", prop: "rank"}},
                                           [e("el-input", {
                                               staticClass: "cms-width",
                                               attrs: {type: "number"},
                                               model: {
                                                   value: a.dataInfo.rank, callback: function (t) {
                                                       a.$set(a.dataInfo, "rank", t)
                                                   }, expression: "dataInfo.rank"
                                               }
                                           }), a._v(" "), e("span", {staticClass: "gray"}, [a._v("越大等级越高")])], 1),
                    a._v(" "), e("el-form-item", {staticClass: "flex-50", attrs: {label: "真实姓名", prop: "realname"}},
                                 [e("el-input", {
                                     staticClass: "cms-width",
                                     attrs: {type: "username"},
                                     model: {
                                         value: a.dataInfo.userRealName, callback: function (t) {
                                             a.$set(a.dataInfo, "userRealName", t)
                                         }, expression: "dataInfo.userRealName"
                                     }
                                 })], 1), a._v(" "),
                    e("el-form-item", {staticClass: "flex-50", attrs: {label: "性别", prop: "gender"}}, [e("el-radio-group", {
                        model: {
                            value: a.dataInfo.gender, callback: function (t) {
                                a.$set(a.dataInfo, "gender", t)
                            }, expression: "dataInfo.gender"
                        }
                    }, [e("el-radio", {attrs: {label: !0}}, [a._v("男")]), a._v(" "),
                        e("el-radio", {attrs: {label: !1}}, [a._v("女")])], 1)], 1), a._v(" "),
                    e("el-form-item", {staticClass: "flex-100", attrs: {label: "受限管理员", prop: "selfAdmin"}},
                      [e("el-radio-group", {
                          model: {
                              value: a.dataInfo.selfAdmin, callback: function (t) {
                                  a.$set(a.dataInfo, "selfAdmin", t)
                              }, expression: "dataInfo.selfAdmin"
                          }
                      }, [e("el-radio", {attrs: {label: !0}}, [a._v("是")]), a._v(" "),
                          e("el-radio", {attrs: {label: !1}}, [a._v("否")])], 1), a._v(" "),
                       e("span", {staticClass: "gray"}, [a._v("只能管理自己的数据")])], 1), a._v(" "),
                    e("el-form-item", {staticClass: "flex-100", attrs: {label: "角色", prop: "roleIds"}},
                      [e("el-checkbox-group", {
                          model: {
                              value: a.roleIds, callback: function (t) {
                                  a.roleIds = t
                              }, expression: "roleIds"
                          }
                      }, a._l(a.roles, function (t, s) {
                          return e("el-checkbox", {key: s, attrs: {value: t.id, label: t.id}}, [a._v(a._s(t.name))])
                      })), a._v(" "), e("span", {staticClass: "gray"}, [a._v("功能权限的控制在角色中")])], 1), a._v(" "),
                    e("el-form-item", {staticClass: "flex-100", attrs: {label: "站群权限"}}, [e("el-button", {
                          on: {
                              click: function (t) {
                                  a.dialogVisible = !0
                              }
                          }
                      }, [a._v("站群权限")]), a._v(" "), e("el-dialog", {
                          attrs: {title: "站群权限设置", visible: a.dialogVisible},
                          on: {
                              "update:visible": function (t) {
                                  a.dialogVisible = t
                              }
                          }
                      }, [e("div", {staticClass: "channels-box"}, [e("el-checkbox-group", {
                          staticClass: "pull-left check-vertical",
                          model: {
                              value: a.siteIds, callback: function (t) {
                                  a.siteIds = t
                              }, expression: "siteIds"
                          }
                      }, a._l(a.siteList, function (t, s) {
                          return e("el-checkbox", {
                              key: s, attrs: {label: t.id}, on: {
                                  change: function (e) {
                                      a.getSiteIds(t.id, s)
                                  }
                              }
                          }, [a._v(a._s(t.name))])
                      })), a._v(" "), e("div", {staticClass: "pull-left"}, a._l(a.siteList, function (t, s) {
                          return e("div", {key: s, staticClass: "cms-channels"},
                                   [e("div", {staticClass: "pull-left", staticStyle: {"margin-right": "12px"}},
                                      [e("label", {staticClass: "font-size:12px;", attrs: {for: ""}}, [a._v("审核级别")]),
                                       a._v(" "), e("el-input", {
                                          ref: "reviewLevel",
                                          refInFor: !0,
                                          staticClass: "w50",
                                          attrs: {type: "number", disabled: "-1" == a.siteIds.indexOf(t.id)},
                                          model: {
                                              value: a.steps[s], callback: function (t) {
                                                  a.$set(a.steps, s, t)
                                              }, expression: "steps[index]"
                                          }
                                      })], 1), a._v(" "), e("el-checkbox", {
                                       staticClass: "pull-left",
                                       attrs: {"false-label": "", disabled: "-1" == a.siteIds.indexOf(t.id)},
                                       model: {
                                           value: a.allChannels[s], callback: function (t) {
                                               a.$set(a.allChannels, s, t)
                                           }, expression: "allChannels[index]"
                                       }
                                   }, [a._v("所有栏目内容权限")])], 1)
                      }))], 1), a._v(" "), e("div", {staticClass: "form-footer"},
                                             [e("el-button", {on: {click: a.inputDigit}}, [a._v("确定")])], 1)]), a._v(" "),
                                                                                          e("span", {staticClass: "gray"})],
                      1), a._v(" "), e("div", {staticClass: "form-footer"}, [e("el-button", {
                        directives: [{
                            name: "perms",
                            rawName: "v-perms",
                            value: "/adminGlobal/add",
                            expression: "'/adminGlobal/add'"
                        }],
                        attrs: {type: "warning"},
                        on: {
                            click: function (t) {
                                a.add(!0)
                            }
                        }
                    }, [a._v("保存并继续添加")]), a._v(" "), e("el-button", {
                        directives: [{
                            name: "perms",
                            rawName: "v-perms",
                            value: "/adminGlobal/add",
                            expression: "'/adminGlobal/add'"
                        }],
                        attrs: {type: "primary"},
                        on: {
                            click: function (t) {
                                a.add(!1)
                            }
                        }
                    }, [a._v("提交")]), a._v(" "), e("el-button", {
                        attrs: {type: "info"},
                        on: {click: a.$reset}
                    }, [a._v("重置")])], 1)], 1)], 1)
            }, v = [], b = {render: m, staticRenderFns: v}, h = b, I = e("operateHtmlCreate"), C = s,
            g = I(p, h, !1, C, "data-v-0951b8ce", null);
        t.default = g.exports
    }, GQNJ: function (a, t, e) {
        var s = e("bjZw");
        "string" == typeof s && (s = [[a.i, s, ""]]), s.locals && (a.exports = s.locals);
        e("FIqI")("3abdf636", s, !0, {})
    }, bjZw: function (a, t, e) {
        t = a.exports = e("UTlt")(!1), t.push([a.i, "", ""])
    }
});