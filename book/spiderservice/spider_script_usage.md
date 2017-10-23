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
    ~~~
