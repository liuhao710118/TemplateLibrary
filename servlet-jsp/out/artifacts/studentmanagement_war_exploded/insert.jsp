<%--
  Created by IntelliJ IDEA.
  User: 12589
  Date: 2023/12/23
  Time: 23:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>武汉工程大学管理系统-新增学生页面</title>
    <link rel="stylesheet" href="./css/element-ui.css">
    <link rel="stylesheet" href="./css/login.css">
    <!-- 引入组件库 -->
    <script src="./js/vue.js"></script>
    <script src="./js/element-ui.js"></script>
    <script src="./js/vue-resource.js"></script>
</head>
<body>
<div id="app">
    <el-container>
        <el-main>
            <el-row style="padding-bottom: 10px" type="flex" class="row-bg" justify="center">
                <el-col :span="2">
                    学生信息添加页面
                </el-col>
            </el-row>
            <el-row type="flex" class="row-bg" justify="center">
                <el-col :span="6">
                    <el-form ref="form" :model="form" label-position="right" label-width="80px" action="loginService">
                        <el-form-item label="姓名">
                            <el-input v-model="form.sname"></el-input>
                        </el-form-item>
                        <el-form-item label="性别">
                            <el-radio-group v-model="form.ssex">
                                <el-radio label="男"></el-radio>
                                <el-radio label="女"></el-radio>
                            </el-radio-group>
                        </el-form-item>
                        <el-form-item label="地址">
                            <el-input v-model="form.saddress"></el-input>
                        </el-form-item>
                        <el-form-item label="电话">
                            <el-input v-model="form.stel"></el-input>
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" @click="submitForm('ruleForm')">立即创建</el-button>
                        </el-form-item>
                    </el-form>
                </el-col>
            </el-row>
        </el-main>
    </el-container>
</div>
</body>
<script>
    new Vue({
        el: '#app',
        data: function () {
            return {
                form: {
                    saddress: "",
                    sname: "",
                    ssex: "",
                    stel: ""
                }
            }
        },
        methods: {
            submitForm(name) {
                let param = {
                    saddress: this.form.saddress,
                    sname: this.form.sname,
                    ssex: this.form.ssex,
                    stel: this.form.stel
                }
                this.$http.post('InsertStudent', param, {emulateJSON: true}).then((e) => {
                    if (e.bodyText == 'success') {
                        this.$notify({
                            title: '提示',
                            message: '添加成功',
                            type: 'success'
                        });

                        setTimeout(() => {
                            window.location.href = 'list.jsp'
                        }, 1000)
                        return
                    }

                    this.$notify({
                        title: '提示',
                        message: '添加失败',
                        type: 'warning'
                    });

                })
            }
        }
    })
</script>
</html>
