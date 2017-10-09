# Basin spider
[toc]

<a name="overview"></a>
## Overview
basin 爬虫文档 api


### Version information
*Version* : 1.0.0


### Contact information
*Contact Email* : 7671557@qq.com


### License information
*License* : Apache 2.0  
*License URL* : http://www.apache.org/licenses/LICENSE-2.0.html  
*Terms of service* : http://swagger.io/terms/


### URI scheme
*Host* : 127.0.0.1  
*BasePath* : /v1  
*Schemes* : HTTP


### Tags

* spiderapps : 爬虫app管理
* sys : 系统参数配置
* tasks : 任务管理




<a name="paths"></a>
## Paths

<a name="spiderapps-post"></a>
### <font color=red> 新增爬虫app</font>
```
POST /spiderapps
```


#### Description
新增爬虫app


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**body**  <br>*required*|spider-app 字段|[SpiderApp](#spiderapp)|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|ok|No Content|
|**400**|Invalid input|No Content|


#### Consumes

* `application/json`


#### Produces

* `application/json`


#### Tags

* spiderapps


<a name="getspiderapps"></a>
### <font color=red> 获取爬虫app列表(支持分页查询)</font>
```
GET /spiderapps
```


#### Description
获取爬虫app列表,支持模糊查询,返回查询个数.(支持分页查询)


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Query**|**limit**  <br>*optional*|取多少条|integer (int32)|
|**Query**|**offset**  <br>*optional*|偏移量|integer (int32)|
|**Query**|**order_by**  <br>*optional*|排序,默认是降序desc，asc升序|string (string)|
|**Query**|**search**  <br>*optional*|模糊查询|string (string)|
|**Query**|**sort_by**  <br>*optional*|根据字段进行排序|string (string)|
|**Query**|**spidername**  <br>*optional*|依据spidername查询爬虫|string (string)|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK  <br>**Headers** :   <br>`X-Total-Count` (integer) : 返回查询记录总数.|< [SpiderApp](#spiderapp) > array|
|**400**|Invalid input|No Content|


#### Produces

* `application/json`


#### Tags

* spiderapps


<a name="getspider"></a>
### 更新已存在的spider app
```
GET /spiderapps/{spiderapp}
```


#### Description
更新已存在的spider app


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Path**|**spiderapp**  <br>*required*|爬虫名称|string (string)|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|No Content|
|**400**|Invalid input|No Content|


#### Produces

* `application/json`


#### Tags

* spiderapps


<a name="updatespider"></a>
### <font color=red> 更新已存在的spider app</font>
```
PUT /spiderapps/{spiderapp}
```


#### Description
更新已存在的spider app


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Path**|**spiderapp**  <br>*required*|爬虫名称|string (string)|
|**Body**|**body**  <br>*required*|更新指定spider-app对象|[SpiderApp](#spiderapp)|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|No Content|
|**400**|Invalid input|No Content|


#### Produces

* `application/json`


#### Tags

* spiderapps


<a name="spiderapps-spiderapp-delete"></a>
### <font color=red> 删除指定的spider app</font>
```
DELETE /spiderapps/{spiderapp}
```


#### Description
删除指定的spiderapp


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Path**|**spiderapp**  <br>*required*|爬虫名称|string (string)|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|No Content|
|**400**|Invalid input|No Content|


#### Tags

* spiderapps


<a name="createspidertype"></a>
### <font color=red> 创建类型</font>
```
POST /sys/types
```


#### Description
创建类型


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**body**  <br>*required*|创建类型|[SpiderType](#spidertype)|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|No Content|


#### Produces

* `application/json`


#### Tags

* sys


<a name="getspidertypes"></a>
### <font color=red> 获取类型配置(spider app接口包含类型了)</font>
```
GET /sys/types
```

Caution : 
operation.deprecated


#### Description
获取类型配置


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**default**|OK|No Content|


#### Produces

* `application/json`


#### Tags

* sys


<a name="deletespiderbytypeid"></a>
### <font color=red> 删除指定类型配置</font>
```
DELETE /sys/types/{typeid}
```


#### Description
删除指定类型配置


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Path**|**typeid**  <br>*required*|类型id|integer (int32)|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|No Content|
|**400**|Invalid input|No Content|
|**404**|typeid not found|No Content|


#### Produces

* `application/json`


#### Tags

* sys


<a name="tasks-post"></a>
### <font color=red> 创建一个新任务</font>
```
POST /tasks
```


#### Description
createNewTask


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**body**  <br>*required*|spiderapp object that needs to be added to spiderapps|[SpiderApp](#spiderapp)|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|No Content|
|**400**|Invalid input|No Content|


#### Consumes

* `application/json`


#### Produces

* `application/json`


#### Tags

* tasks


<a name="getalltasks"></a>
### <font color=red> 获取所有任务列表</font>
```
GET /tasks
```


#### Description
返回所有任务列表


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|< [Task](#task) > array|


#### Produces

* `application/json`


#### Tags

* tasks


<a name="updateconfingtask"></a>
### <font color=red> 配置采集任务</font>
```
PUT /tasks/config/{taskid}
```


#### Description
配置采集任务


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Path**|**taskid**  <br>*required*|任务id|string (string)|
|**Body**|**body**  <br>*required*|创建类型|[ConfigTask](#configtask)|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|No Content|
|**400**|Invalid input|No Content|
|**404**|Taskid not found|No Content|


#### Produces

* `application/json`


#### Tags

* tasks


<a name="gettasklog"></a>
### <font color=red> 获取任务采集日志(支持分页查询)</font>
```
GET /tasks/log/{taskid}
```


#### Description
获取任务采集日志(支持分页查询)


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Header**|**X-Total-Count**  <br>*optional*|返回查询记录总数|integer (int32)|
|**Path**|**taskid**  <br>*required*|任务id|string (string)|
|**Query**|**limit**  <br>*optional*|取多少条|integer (int32)|
|**Query**|**offset**  <br>*optional*|偏移量|integer (int32)|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|< [TaskLog](#tasklog) > array|
|**400**|Invalid input|No Content|
|**404**|Taskid not found|No Content|


#### Produces

* `application/json`


#### Tags

* tasks


<a name="gettaskresult"></a>
### <font color=red> 获取任务采集日志(支持分页查询)</font>
```
GET /tasks/result/{taskid}
```


#### Description
获取任务采集日志(支持分页查询)


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Header**|**X-Total-Count**  <br>*optional*|返回查询记录综述|integer (int32)|
|**Path**|**taskid**  <br>*required*|任务id|string (string)|
|**Query**|**limit**  <br>*optional*|取多少条|integer (int32)|
|**Query**|**offset**  <br>*optional*|偏移量|integer (int32)|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|< [TaskResult](#taskresult) > array|
|**400**|Invalid input|No Content|
|**404**|Taskid not found|No Content|


#### Produces

* `application/json`


#### Tags

* tasks


<a name="webhooktaskid"></a>
### <font color=red> webhook,用于集成第三方采集回调数据</font>
```
POST /tasks/{taskid}
```


#### Description
集成神箭手等采集服务,采集的数据.发送到该接口中,保存到对应的结果集中.


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Path**|**taskid**  <br>*required*|任务id|string (string)|
|**Body**|**body**  <br>*required*|采集结果数据|[SpiderData](#spiderdata)|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|No Content|
|**400**|Invalid input|No Content|
|**404**|Taskid not found|No Content|


#### Produces

* `application/json`


#### Tags

* tasks


<a name="gettasktaskid"></a>
### <font color=red> 获取任务信息/状态/采集量</font>
```
GET /tasks/{taskid}
```


#### Description
获取任务信息/状态/采集量


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Path**|**taskid**  <br>*required*|任务id|string (string)|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|[TaskStatus](#taskstatus)|
|**400**|Invalid input|No Content|
|**404**|Taskid not found|No Content|


#### Produces

* `application/json`


#### Tags

* tasks


<a name="updatetaskid"></a>
### <font color=red> 更新任务(启动/停止)任务</font>
```
PUT /tasks/{taskid}
```


#### Description
更新任务(启动/停止)任务


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Path**|**taskid**  <br>*required*|任务id|string (string)|
|**Query**|**force**  <br>*optional*|如果已启动就重启|integer (int32)|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|No Content|
|**400**|Invalid input|No Content|
|**404**|Taskid not found|No Content|


#### Produces

* `application/json`


#### Tags

* tasks


<a name="deletebytaskid"></a>
### <font color=red> 删除指定任务</font>
```
DELETE /tasks/{taskid}
```


#### Description
删除指定任务


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Path**|**taskid**  <br>*required*|任务id|string (string)|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|OK|No Content|
|**400**|Invalid input|No Content|
|**404**|Taskid not found|No Content|


#### Produces

* `application/json`


#### Tags

* tasks




<a name="definitions"></a>
## Definitions

<a name="configtask"></a>
### ConfigTask

|Name|Description|Schema|
|---|---|---|
|**extra**  <br>*optional*|自定义数据|object|
|**option**  <br>*optional*|可选|enum (可选,设置历史才生效 2017-01-01~2017-02-02)|
|**proxy**  <br>*optional*||string (string)|
|**type**  <br>*optional*||enum (once, realtime, history)|
|**urls**  <br>*optional*||< object > array|


<a name="spiderapp"></a>
### SpiderApp

|Name|Description|Schema|
|---|---|---|
|**createtime**  <br>*optional*|创建时间|string (date-time)|
|**description**  <br>*optional*|爬虫描述,支持md语法|string (string)|
|**name**  <br>*optional*|爬虫名称,英文表示|string (string)|
|**script**  <br>*optional*|爬虫脚本|string (string)|
|**spiderName**  <br>*optional*|爬虫简称等|string (string)|
|**type**  <br>*optional*|爬虫app类型|string (string)|
|**updatetime**  <br>*optional*|更新时间|string (date-time)|


<a name="spiderdata"></a>
### SpiderData

|Name|Schema|
|---|---|
|**fields**  <br>*optional*|< object > array|
|**name**  <br>*optional*|string|
|**timestamp**  <br>*optional*|string (date-time)|


<a name="spidertype"></a>
### SpiderType

|Name|Schema|
|---|---|
|**name**  <br>*optional*|string (string)|


<a name="task"></a>
### Task

|Name|Schema|
|---|---|
|**name**  <br>*optional*|string|
|**status**  <br>*optional*|enum (running, stop)|
|**updatetime**  <br>*optional*|string|


<a name="tasklog"></a>
### TaskLog

|Name|Schema|
|---|---|
|**msg**  <br>*optional*|string|
|**name**  <br>*optional*|string|
|**status**  <br>*optional*|string|
|**url**  <br>*optional*|string|


<a name="taskresult"></a>
### TaskResult

|Name|Schema|
|---|---|
|**content**  <br>*optional*|string|
|**extra**  <br>*optional*|string|
|**html**  <br>*optional*|string|
|**publish_date**  <br>*optional*|string|
|**title**  <br>*optional*|string|
|**update_time**  <br>*optional*|string|
|**url**  <br>*optional*|string|


<a name="taskstatus"></a>
### TaskStatus

|Name|Description|Schema|
|---|---|---|
|**1d**  <br>*optional*|1天采集量|string|
|**1d-failed**  <br>*optional*|1天采集失败量|string|
|**1d-pending**  <br>*optional*|1天新增数量|string|
|**1d-retry**  <br>*optional*|采集失败,重试数|string|
|**1d-success**  <br>*optional*|采集成功数量|string|
|**name**  <br>*optional*||string|




