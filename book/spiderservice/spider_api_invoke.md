# basin-spider api 调用示例

维护人：陈牵

更新时间：2017-10-09

该文档主要用于说明启动爬虫任务基本流程,对于新增爬虫app等api,需要涉及到爬虫调试以及脚本保存,暂不在此说明.

### 1. 获取spider app

#### 代码示例:
~~~
import requests
url = 'http://127.0.0.1:5001/api/v1'
path = "/spiderapps"
r = requests.get(url + path)
print r.json()
~~~

#### 返回示例
~~~
[{"createtime": "2017-07-11",
  "description": "南网爬虫app..",
  "name": "bidding_csg",
  "simplename": "南网爬虫",
  "updatetime": 1498468897.84839
  "script": "spider script..."}]
~~~



### 2. 启动爬虫任务
#### 代码示例:
~~~
import requests
url = 'http://127.0.0.1:5001/api/v1'
newtask = "news_baidu_demo" # 自定义任务名
spidername = "news_baidu"  # 由获取spider app 列表中返回
type = "search" # type 由2种,url和search
path = "/tasks"
payload = {
            "status": "RUNNING",
            "spidername": spiderapp,
            "taskname": newtask,
            "data": data,
            'type': type
        }

r = requests.post(url + path, json=payload)
print r.json()
~~~

#### 返回示例:

~~~
{
  "name": "news_baidu_demo",
  "status": "RUNNING",
  "updatetime": 1507515552.162177
}
~~~


### 3. 获取采集结果
#### 代码示例:

~~~
import requests
url = 'http://127.0.0.1:5001/api/v1'
path = "/tasks/result/"
taskname = "news_baidu_demo"
params = {
    "offset": 0,
    "limit": 1
}
r = requests.get(url + path + taskname, params=params)
print r.json()
~~~
#### 返回示例:

~~~
[
  {
    "result": {
      "appkeys": [
        "sgcc"
      ],
      "authors": "",
      "extra": {
        "appkeys": [
          "sgcc"
        ],
        "authors": "IT168",
        "keyword": "helloworld",
        "name": "IT168",
        "publish_time": 1436266800
      },
      "publish_time": 1436266800,
      "text": "采集内容",
      "title": "采集标题",
      "type": "search",
      "update_time": 1507515293,
      "url": "http://safe.it168.com/a2015/0707/1744/000001744134.shtml"
    },
    "taskid": "7b9d40ab0e562d188d698561a39f0b02",
    "updatetime": 1507515293.307488,
    "url": "http://safe.it168.com/a2015/0707/1744/000001744134.shtml"
  }
]

~~~

### 4. 停止任务
#### 代码示例:

~~~
import requests
url = 'http://127.0.0.1:5001/api/v1'
path = "/tasks/"
taskname = "news_baidu_demo"
payload = {"status": "STOP"}
r = requests.put(url + path + taskname, json=payload)
~~~

#### 返回示例:
无







