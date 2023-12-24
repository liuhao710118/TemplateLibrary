<%--
  Created by IntelliJ IDEA.
  User: 12589
  Date: 2023/12/23
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>武汉工程大学管理系统-学生信息展示页面</title>
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
                    学生信息展示页面
                </el-col>
            </el-row>
            <el-row type="flex" class="row-bg" justify="center">
                <el-col :span="24">
                    <el-table
                            :data="tableData"
                            border
                            style="width: 100%">
                        <el-table-column
                                prop="sid"
                                label="学号">
                        </el-table-column>
                        <el-table-column
                                prop="sname"
                                label="姓名">
                        </el-table-column>
                        <el-table-column
                                prop="ssex"
                                label="性别">
                        </el-table-column>
                        <el-table-column
                                prop="saddress"
                                label="联系地址">
                        </el-table-column>
                        <el-table-column
                                prop="stel"
                                label="联系电话">
                        </el-table-column>
                        <el-table-column label="操作">
                            <template slot-scope="scope">
                                <el-button
                                        size="mini"
                                        @click="handleEdit(scope.$index, scope.row)">编辑
                                </el-button>
                                <el-button
                                        size="mini"
                                        type="danger"
                                        @click="handleDelete(scope.$index, scope.row)">删除
                                </el-button>
                            </template>
                        </el-table-column>
                    </el-table>
                </el-col>
            </el-row>
            <el-row style="padding-top: 10px" type="flex" class="row-bg" justify="center">
                <el-col :span="2">
                    <el-button
                            type="primary"
                            @click="handleInsert()">增加学生
                    </el-button>
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
                tableData: [{
                    date: '2016-05-02',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1518 弄'
                }, {
                    date: '2016-05-04',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1517 弄'
                }, {
                    date: '2016-05-01',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1519 弄'
                }, {
                    date: '2016-05-03',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1516 弄'
                }]
            }
        },
        methods: {
            fetchAllStudents() {
                let url = 'studentList'
                this.$http.get(url).then(e => {
                    console.log(e)
                    this.tableData = e.body
                })
            },
            handleEdit(index, row) {
                console.log(index, row);
                window.location.href = 'update.jsp?sname=' + row.sname + "&ssex=" + row.ssex + '&saddress=' + row.saddress + '&stel=' + row.stel + '&sid=' + row.sid
            },
            handleDelete(index, row) {
                console.log(index, row);
                this.$confirm('确认删除学号=' + row.sid + '，姓名=' + row.sname + '的学生吗?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    let url = 'deleteStudent?sid=' + row.sid
                    this.$http.get(url).then(e => {
                        console.log(e)
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
                })
            },
            handleInsert() {
                window.location.href = 'insert.jsp'
            }
        },
        created: function () {
            this.fetchAllStudents()
        }
    })
</script>
</html>
