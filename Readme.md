
### 功能介绍

整个平台包括前台和后台两个部分。

- 前台功能包括：首页、详情页、用户中心。
- 后台功能包括：总览、轮椅管理、分类管理、标签管理、评论管理、用户管理、运营管理、日志管理、系统信息模块。

### 效果演示

### 代码结构

- server目录是后端代码
- web目录是前端代码

### 运行步骤

#### 后端运行步骤

(1) 安装python 3.8

(2) 安装依赖。进入server目录下，执行 pip install -r requirements.txt

(3) 安装mysql 5.7数据库，并创建数据库，创建SQL如下：
```
CREATE DATABASE IF NOT EXISTS rentalplatform DEFAULT CHARSET utf8 COLLATE utf8_general_ci
```
(4) 恢复shop.sql数据。在mysql下依次执行如下命令：

```
mysql> use xxx;
mysql> source D:/xxx/xxx/xxx.sql;
```

(5) 启动django服务。在server目录下执行：
```
python manage.py runserver
```

#### 前端运行步骤

(1) 安装node 16.14

(2) 进入web目录下，安装依赖，执行:
```
npm install 
```
(3) 运行项目
```
npm run dev
```

### 待完善功能

- 邮箱推送功能
- 手机号绑定功能
- 粉丝关注功能
- 支付功能

### 开发文档

[点击进入](doc.md)