# ubuntu 安装 Nacos

### 1、Nacos介绍

Nacos 是阿里巴巴推出的一个新开源项目，它主要是一个更易于构建云原生应用的动态服务发现、配置管理和服务管理平台。

Nacos提供了一组简单易用的特性集，帮助用户快速实现动态服务发现、服务配置、服务元数据及流量管理。

Nacos 的关键特性包括：

- 服务发现和服务健康监测：支持基于 DNS 和基于 RPC 的服务发现，如 Kubernetes Service、gRPC & Dubbo RPC Service 以及Spring Cloud RESTful Service 等主流服务类型。Nacos 还提供实时的健康检查，以阻止向不健康的主机或服务实例发送请求。这包括传输层（如 PING 或 TCP）和应用层（如 HTTP、MySQL、用户自定义）的健康检查，以及针对复杂云环境和网络拓扑环境的两种健康检查模式：agent 上报模式和服务端主动检测。


- 动态配置服务：Nacos 允许用户以中心化、外部化和动态化的方式管理所有环境的配置，从而消除了配置变更时重新部署应用和服务的需要。配置中心化管理使实现无状态服务更简单，也使按需弹性扩展服务更容易。


- 动态 DNS 服务：通过支持权重路由，Nacos 能轻松实现中间层负载均衡、更灵活的路由策略、流量控制以及简单数据中心内网的 DNS 解析服务。

### 2、Nacos 

github [项目地址](https://github.com/alibaba/nacos)

```
https://github.com/alibaba/nacos
```

[官网地址](https://nacos.io/docs/latest/what-is-nacos/)

```
https://nacos.io/docs/latest/what-is-nacos/
```

### 3、安装前准备

[官方安装文档](https://nacos.io/zh-cn/docs/quick-start.html)

```