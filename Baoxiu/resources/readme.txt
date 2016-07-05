1)generatorConfig.xml 可以设置一些路径，，， 用一个控件会复制出xml文件，但是不在resources文件夹下
2)复制 xml 到 resources 并删除之前的xml
3)在 dao 里加 @MyBatisDao 
4)实体类中的 Date 数据类型上加入 @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")

