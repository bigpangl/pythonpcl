# pythonpcl
 特定版本pythonpcl 供使用
 
 参考自docker 上其他python-pcl 镜像实现方式和python:3.6-slim 版本实现方式，在缩小python:ubuntu 这个样的镜像的情况下，安装python-pcl。
 
 目前镜像大小仍有近2G。
 
 
 在原始python3.6的ubuntu镜像上，约217M，是可以接受的。
 
 pip install 采用了no-cache 的方法，后续尝试进一步缩小镜像大小，可能需要了解在安装后如何尽可能多的删除依赖库或者中间文件。
 
 libpcl 在安装时，所依赖的各种库累计月1600+M 大小需要下载，这占据了镜像的大部分。
