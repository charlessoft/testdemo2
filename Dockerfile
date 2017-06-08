FROM centos:7.3.1611
MAINTAINER charles <charles@qq.com>

#RUN yum install gcc openssl-devel gcc-c++ compat-gcc-34 compat-gcc-34-c++ -y

RUN yum install -y curl git  && \
        curl --silent --location https://rpm.nodesource.com/setup_8.x | bash - && \
        yum install -y nodejs && \
        npm install -g gitbook-cli && \
        gitbook install


#RUN gitbook install 
RUN mkdir /gitbook 
WORKDIR /gitbook
#ADD pull.sh /gitbook
EXPOSE 4000
#CMD ["gitbook", "serve", "/gitbook"]
CMD gitbook serve /gitbook
