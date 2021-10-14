FROM centos:7.7.1908

# RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -
# RUN yum -y install nodejs

RUN yum install -y wget
RUN wget https://rpm.nodesource.com/pub_8.x/el/7/x86_64/nodejs-8.17.0-1nodesource.x86_64.rpm -O /tmp/nodejs-8.17.0-1nodesource.x86_64.rpm
RUN yum install -y /tmp/nodejs-8.17.0-1nodesource.x86_64.rpm

RUN mkdir -p /easymock
WORKDIR /easymock
COPY . /easymock

RUN npm install
RUN npm run build

ENTRYPOINT ["npm", "run"]
CMD ["start"]
