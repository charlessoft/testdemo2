# basin-spider 框架说明(暂放)

1. 框架说明
采用python语言开发,最终保存成脚本,保存在数据库中,在爬虫执行过程中,会自动加载爬虫脚本,执行爬虫脚本. 脚本结构说明

    ~~~
    #!/usr/bin/env python
    # -*- encoding: utf-8 -*-
    # Created on 2017-10-16 16:36:15
    # Project: demo
    
    from pyspider.libs.base_handler import *
    from pyspider.libs.base_handler import *
    from udbswp.handler.basinarticle_handler import BasinArticleHandler as MyHandler
    from pyspider.libs.url import _build_url
    from udbswp.atlproc import parse_article
    from datetime import datetime
    from udbswp.utils import utils
    import time
    import re
    class demo(MyHandler):
        #!! 必须继承MyHandler,类名符合英文大小写字符即可.
        crawl_config = {
        }

        #1. 导入url
        def import_urls(self):
            return ["http://news.baidu.com/ns?word=%E7%A8%8B%E5%BA%8F%E5%91%98"]
        #2. 导入扩展属性,用户设置
        def import_extract(self):
            """
                必须返回字典
            """
            return {"website":"myspider"}
        #3. 获取采集列表页
        def get_root_list_page(self, html):
            """
                返回列表页面url数组
            """
            return ["http://news.baidu.com/ns?word=helloworld&pn=0",
            "http://news.baidu.com/ns?word=helloworld&pn=10"]
        #4. 获取详细页面
        def get_detail_page(self, html, detail):
            """
                获取采集结果
            """
            return detail
    ~~~
    
2. 基本示例代码 (以百度新闻为例)

    ~~~
    #!/usr/bin/env python
    # -*- encoding: utf-8 -*-
    # Created on 2017-10-16 16:36:15
    # Project: news_baidu_demo
    
    from pyspider.libs.base_handler import *
    from pyspider.libs.base_handler import *
    from udbswp.handler.basinarticle_handler import BasinArticleHandler as MyHandler
    from pyspider.libs.url import _build_url
    from udbswp.atlproc import parse_article
    from datetime import datetime
    from udbswp.utils import utils
    import time
    import re
    
    class demo(MyHandler):
        crawl_config = {
        }
        
        #1. 导入url
        def import_urls(self):
            return ['http://news.baidu.com/ns?word={}&sr=0&cl=2&rn=20&tn=news&ct=0&clk=sortbytime'.format("中国")]
        #2. 导入扩展属性,用户数设置
        def import_extract(self):
            return {"website":"myspider"}
        #3. 获取采集列表页
        def get_root_list_page(self, html):
            for each in utils.pquery(html,".result > .c-title >a").items():
                yield each.attr("href")
        #4. 获取详细页面
        def get_detail_page(self, html, detail):
            detail.update(self.get_extra())
            return detail
    
    ~~~

3. 框架函数说明
    + 框架类函数

        + **import_urls()**
        
            """
            导入需要采集的url地址
            return: 数组列表(list)
            """
        
        + **import_extra()**  
        
            """
            导入扩展信息
            return: 数组列表(list)
            """
        + **get_root_list_page(html)**
          
            """
            获取列表页
            html: 网页内容
            return: 数组列表(list)
            """
        + **get_detail_page(html,detail)**  

            """
            获取详细页
            html: 网页内容
            detail: 采集字段
            return: 字典(dict)
            """

        + **get_next_page()**  

            """
            获取下一页(待实现)
            """
        
    + 框架函数工具集
        基本函数:
        + **pquery()**  

            """
            封装pyquery类似jquery功能,采用css 选择器来获取数据, 可以根据css 样式,html元素选择标签
            """
        
        高级函数:
        
        + **add_new_url(url,**kwrags)** 
        
            """
            爬取新的url地址
            url: 新增采集地址
            kwargs: 参数
            fetch_type=js
            callbback=回调函数,处理采集后回调地址,函数类型 def callback(self, html)
            
            """

            
    


