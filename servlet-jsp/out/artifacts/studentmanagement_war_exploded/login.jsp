<%--
  Created by IntelliJ IDEA.
  User: 12589
  Date: 2023/12/23
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>武汉工程大学管理系统-登录页面</title>
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
            <el-row type="flex" class="row-bg" justify="center">
                <el-col :span="6">
                    <el-form ref="form" :model="form" label-position="right" label-width="80px" action="loginService">
                        <el-form-item label="账号">
                            <el-input v-model="form.account"></el-input>
                        </el-form-item>
                        <el-form-item label="密码">
                            <el-input v-model="form.password"></el-input>
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
                visible: false,
                form: {
                    account: "",
                    password: ""
                }
            }
        },
        methods: {
            submitForm(formName) {
                let param = {
                    account: this.form.account,
                    password: this.form.password
                }
                this.$http.post('loginService', param, {emulateJSON: true}).then((e) => {
                    if (e.bodyText == 'success') {
                        this.$notify({
                            title: '登录提示',
                            message: '登录成功',
                            type: 'success'
                        });

                        setTimeout(()=>{window.location.href='list.jsp'},300)
                        return
                    }

                    this.$notify({
                        title: '登录提示',
                        message: '用户输入有误',
                        type: 'warning'
                    });

                })
            }
        }
    })
</script>
</html>
