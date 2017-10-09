# basin-spider cli 使用说明
basin-spider cli 基于命令行方式,对basin-spider api封装.提供基本创建爬虫任务,启动,停止,获取采集结果功能.

## 安装部署
1. 下载源码
地址: http://115.28.208.122:88/basin-spider/basin-spider-toolkit.tar.gz
2. 安装方式

    ~~~
    cd spidercli
    pip install -r requirements.txt
    python setup.py install
    ~~~

3. 使用帮助
    
    ~~~
    spidercli --help
    ~~~

    >Usage: spidercli [OPTIONS] COMMAND [ARGS]...

    >Main entry point for SpiderCli.

    >Options:
        >--url TEXT  spider api url
        >--help      Show this message and exit.

    >Commands:

    >  getallspiderapp      获取所有spider app.  
      getalltasks          获取爬虫全部任务.  
      getspiderresult      获取爬虫采集结果.  
      getspidertaskstatus  获取爬虫任务状态.  
      runspidertask        启动爬虫任务.   
      updatetaskstatus     启停爬虫任务.   

4. 获取spider app

    ~~~
    spidercli --url=http://115.28.208.122:5001 getallspiderapp
    ~~~
    返回结果:

    ~~~
    http://10.211.55.2:5001/api/v1
    +---------------+--------------+---------------+------------+---------------+
    |   updatetime  | description  |   simplename  | createtime |      name     |
    +---------------+--------------+---------------+------------+---------------+
    | 1498468897.85 |   南网招标   |  bidding_csg  | 2017-07-11 |  bidding_csg  |
    | 1505288149.07 |   国网招标   | sgcc_zhaobiao | 2017-09-13 | sgcc_zhaobiao |
    | 1503988577.53 |   政府采购   | ccgp_zhaobiao | 2017-08-29 | ccgp_zhaobiao |
    | 1505959145.13 |  安徽采购网  |      ahbc     | 2017-09-21 |      ahbc     |
    | 1505959145.13 | 百度新闻采集 |    百度新闻   | 2017-09-21 |   news_baidu  |
    +---------------+--------------+---------------+------------+---------------+
    ~~~

5. 创建爬虫任务

    ~~~
    spidercli --url=http://115.28.208.122:5001 startspidertask  news_baidu news_baidu_demo  '["程序员的一天","helloworld"]' --type=search
    ~~~
    返回结果:

    ~~~
    +---------+--------------+-----------------+
    |  status |  updatetime  |       name      |
    +---------+--------------+-----------------+
    | RUNNING | 1507529408.5 | news_baidu_demo |
    +---------+--------------+-----------------+
    ~~~

6. 获取爬虫任务采集结果

    ~~~
    spidercli --url=http://115.28.208.122:5001  getspiderresult news_baidu_demo
    ~~~
    返回结果:

    ~~~
    WARNING: 采集结果在字段reult,内容太长,不打印,具体采集结果.可以到数据库中查询(适用查看是否采集到数据)
    +------------------------------------------------------------------------+---------------+--------------------------+----------------------------------+
    |                                  url                                   |   updatetime  |           _id            |              taskid              |
    +------------------------------------------------------------------------+---------------+--------------------------+----------------------------------+
    |                 http://zj.zjol.com.cn/news/762839.html                 | 1507529327.12 | 59db126f1c0dca361285a236 | 3a6f63bf77a46491d712b619042805bc |
    |     http://finance.eastmoney.com/news/1354,20150915547916553.html      | 1507529336.38 | 59db12781c0dca361285a23f | c60279541867e35f0e5d55e2c62d78dc |
    |                  http://www.newseed.cn/project/16259                   | 1507529342.08 | 59db127e1c0dca361285a245 | d1cb71739fa320125c2f6ca1dc5cd124 |
    | http://field.10jqka.com.cn/20170727/c599340607.shtml?qq-pf-to=pcqq.c2c | 1507529323.66 | 59db126b1c0dca361285a233 | 433bdd6a139324fc94b4d865f3f83d49 |
    |   http://www.techweb.com.cn/network/system/2015-12-01/2234234.shtml    | 1507529324.59 | 59db126c1c0dca361285a234 | 0638073978e44edde710fe38c1ae2030 |
    |           http://news.eastday.com/c/20160208/u1a9214407.html           | 1507529325.51 | 59db126d1c0dca361285a235 | ac013ff6cb78c6ed55f3cb5ff0715f2a |
    |                 http://www.sohu.com/a/144366614_700886                 | 1507529328.03 | 59db12701c0dca361285a237 | 8186e153dea31609de4c761bee0c7a10 |
    |            http://www.eepw.com.cn/article/201610/305446.htm            | 1507529328.95 | 59db12701c0dca361285a238 | 03183189d64aee315b9a976a678fca41 |
    ~~~

7. 停止爬虫任务

    ~~~
    spidercli --url=http://115.28.208.122:5001  updatetaskstatus news_baidu_demo --status=stop
    ~~~


