## 一、编译运行（v1.8.0 及以后）
#### 1.源码编译打包
打包 backend
在backend目录下，执行下面命令。

> mvn clean package -Pstage

注意:

* 在 backend 目录下，不是 dataease 目录；
* 命令一定要加 -Pstage；
* 运行文件为 target/backend-1.8.0.jar。

打包 frontend
在 frontend 目录下，执行下面命令，注意命令后缀。

> npm run build:stage

打包 mobile
在 mobile 目录下，执行下面命令，注意命令后缀。

> npm run build:stage

#### 2.nginx 配置
假设各个文件分别按如下路径放置：

* frontend 编译后文件存放目录 /opt/dataease/frontend/dist
* mobile 编译后文件存放目录 /opt/mobile/frontend/dist
* nginx 配置文件路径 /usr/local/etc/nginx/nginx.conf

在dataease工程目录下执行：

```shell
mkdir -p /opt/dataease/frontend/dist
cp -r frontend/dist/* /opt/dataease/frontend/dist

mkdir -p /opt/dataease/mobile/dist
cp -r mobile/dist/* /opt/dataease/mobile/dist
mv /opt/dataease/mobile/dist/index.html /opt/dataease/mobile/dist/app.html
```

修改 nginx.conf 配置

```shell
server {
listen      8000;
server_name localhost;

    location / {
        root    /opt/dataease/frontend/dist/;
        index   index.html;
    }

    location /app.html {
        root    /opt/dataease/mobile/dist/;
    }

    location /de-app/ {
        alias   /opt/dataease/mobile/dist/;
    }

    location /de-api/ {
        proxy_pass http://localhost:8081/de-api/;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header Host $host:8000;
        server_name_in_redirect on;
    }
}
```

#### 3.运行测试
访问 http://localhost:8000。

## 二、License & Copyright

Copyright (c) 2014-2021 飞致云 FIT2CLOUD, All rights reserved.

Licensed under The GNU General Public License version 3 (GPLv3)  (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

<https://www.gnu.org/licenses/gpl-3.0.html>

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
