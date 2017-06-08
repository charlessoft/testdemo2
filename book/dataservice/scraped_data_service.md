# 爬虫数据开放访问服务

维护人：陈予言

更新时间：2017-6-8

## 服务说明

爬虫数据开放访问服务提供了国网舆情系统中的舆情信息，目前可提供2017年5月1日以来的爬虫数据，具体涵盖以下站点：

| project_name |  meaning |
| --- |  ---- |
| baidu_tieba |  百度贴吧 |
| bid_common |  招标公告 |
| common |  5000个新闻，论坛，博客站点 |
| sougou_weixin |  搜狗微信（搜索关键词获得的数据） |
| sougou_weixin_account |  搜狗微信（指定账号抓取获得的数据） |
| weibo_sina |  新浪微博 |

在以下接口访问时，可以设定project参数为上述的project_name，实现指定数据的抓取。

服务地址为：http://139.196.189.136:7777/，具体的接口参见以下说明

## 接口列表

统一约定:

- 所有接口只有http code 为 200时 返回为成功
- 不存在返回404
- 出错返回500，具体出错原因写在 response body 里

### 接口1：查询网页数据条数

- URL:/count/(project)
- Type:JSON
- HTTP Method:GET
- Parameters:

    |name | required | type and range | info |
    | --- | ---- | --- | --- |
    | project | true | string | 参见"服务说明"，一次只能指定一个project name |
    | start | false | string(yyyy-mm-dd HH:MM:SS) | 开始时间 |
    | end | false | string(yyyy-mm-dd HH:MM:SS) | 结束时间 |
    | hostname | false | string | 网页对应站点的hostname，如"sina.com" |

- Request URL Example:

    curl http://139.196.189.136:7777/count/baidu_tieba

- Result:

    符合查询条件的记录条数

- Result Example:

        {'count': 100 }


### 接口2：获取网页数据

- URL:/results/(project).(_format)
- Type:JSON/CSV
- HTTP Method:GET
- Parameters:

    |name | required | type and range | info |
    | --- | ---- | --- | --- |
    | project | true | string | 项目名称(mongo resultdb 中的collection名) |
    | _format | true | ['json', 'csv']  | 输出格式 |
    | start | false | string(yyyy-mm-dd HH:MM:SS) | 开始时间 |
    | end | false | string(yyyy-mm-dd HH:MM:SS) | 结束时间 |
    | offset | false | int | 起始位置（跳过前多少条数据） |
    | limit | false | int | 限制返回个数（与offset 组合使用构成分页） |
    | hostname | false | string | 网页对应站点的hostname，如"sina.com" |


- Request URL Example:

    curl http://139.196.189.136:7777/results/baidu_tieba.json?limit=10

- Result:

    包含一系列符合查询条件的记录集，具体包括：

    - text，正文
    - title，标题
    - type，类型标识
    - update_time，抓取数据的时间
    - publish_time，数据所属站点提供的内容发布时间，如果没有获得，则值记为0
    - url，网页地址

- Result example:


        [
            {
            'publish_time': 1493768454,
            'text': '<p>\u3000\u3000财联社3日讯，据天津卫视报道，4月27日，中国铁路总公司与
            天津市签署《会谈纪要》，天津市委书记李鸿忠、市长王东峰与中铁总总经理陆东福共同察
            看了天津铁路规划示意图，详细了解铁路线路规划设计方案。在播报该则新闻时播出一张高
            铁规划图显示：经过雄安新区的铁路一共有五条，其中，雄安连接天津市区将会开通一条新
            的津雄铁路，铁路起点是雄安站，终点是于家堡，途径雄安东（在雄安新区境内）、新客站
            等，支线去南站西站。北京与雄安新区直接也将会有一条京雄铁路，链接北京新机场和雄安
            东站。</p>',
            'title': '雄安新区高铁最新线路图曝光 共5条设雄安站及东站',
            'type': 'app_news',
            'update_time': 1493773829,
            'url': 'http://3g.163.com/touch/article.html?docid=CJGCVTHD002580S6',
            },
            {
                ....
            },
            {
                ....
            }
        ]
