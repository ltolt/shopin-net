上品折扣项目架构总结
1.缓存策略 
在网站的business层使用memcached集群来进行
缓存
mastercache  slavecache
通过master和slave的配置实现二级缓存机制
使用AOP的MethodInterceptor拦截器集成spring框架
通过钩子程序来实现对方法级缓存和对象级缓存的
控制
使用到得类文件
方法级缓存Annotation:@MethodCache
对象级缓存Annotation:@ObjectCache
二级缓存通过配搭消息平台来减轻前端的压力(很少进入)
通过memcached的缓存机制来减轻数据库查询带来的压力
加快网站前端页面的访问速度 
######
memcached命令行
windows安装telnet client
telnet xxxxxxxxx 11211
flush_all 刷新全部
stats
quit 
2.软件开发的策略
>>测试驱动开发


