# Demo.ProtocolBuffer
 一个 ProtocolBuffer 的小工程
总体来说需要两部分：

1. protocol buffer 的命令包，用来将 .proto 文件生成指定的 .h 和 .m 文件
2. - 命令包的获取方式
   - - 手动编译，进入刚 protobuf 执行  $ objectivec/DevTools/full_mac_build.sh 命令生成 src/目录，里面就有各种目录。
     - 直接获取，其实就是下面步骤里的方法，
     - - brew install automake & brew install libtool  & brew install protobuf
       - ln -s /usr/local/Cellar/protobuf/2.6.1/bin/protoc /usr/local/bin.
3. 运行时文件，也就是从 github 上 down 下来的 git 仓库，需要将里面 OC 部分拷贝到我们的 Xcode 工程中去。这样序列化生成的.h 和.m 文件。让 protocol buffer 真正运行起来。

- #Fan's Note# 命令包其实也是 .git 仓库编译出来的，也可以直接下载。

具体步骤如下:

1. 获取 ProtocolBuffer 的全部源代码
2. - https://github.com/google/protobuf/releases/tag/v3.5.0  或 https://github.com/google/protobuf  
   - #Fan's Note# 
   - - 俩内容的区别在于，前者是正式发布的包，后者还在继续开发中..
3. 我们其实是想要为 OC 语言定义类，所以去 https://github.com/google/protobuf/tree/master/objectivec 这里看下如何为 OC 类生成代码。
4. - readme 部分其实写的还挺详细.
5. 创建 demo 工程，创建 .proto 文件，如图
6. - 
7. 安装 protobuffer 必备的包 brew install automake & brew install libtool  & brew install protobuf 
8. 执行这句 ln -s /usr/local/Cellar/protobuf/2.6.1/bin/protoc /usr/local/bin，创建一个软连接，这样执行 protoc 命令的时候就不会报找不到错误了。
9. 执行命令 protoc *.proto --objc_out=../pbclass  则刚由 *.proto 文件生成的类定义位于了上一级目录的 pbclass 目录下。
10. - 
    - #Fan's Note#
    - - Person.pbojbc.h 和  Person.pbojbc.m 即为生成的文件
11. 然后将指定的文件拖进你的工程，然后编译。有下面两种方式，
12. - \1. Add objectivec/*.h & objectivec/GPBProtocolBuffers.m to your project.
    - \2. Add objectivec/*.h & objectivec/*.m except for objectivec/GPBProtocolBuffers.m to your project.
    - \3. 使用 .framework 的形式..  //objective-c 目录下有对应的工程文件.

- #Fan's Note# 
- - 这部分其实是为了构建 protocolbuffer 的运行时环境，让你的工程跑起来。
  - 引入头文件和.m 文件后需要进行工程配置: 1. header file search path 2. 所有 protobuffer 的 .m 文件  -fno-objc-arc 配置
  - 如果编译出现失败，duplicate symbols 的话，检查是否按照上面方式添加的.

1. 编写代码，开始编译
2. - 
   - 执行结果: 
   - 

#参考地址# 

- https://github.com/alexeyxo/protobuf-objc
- http://www.cnblogs.com/tandaxia/p/6181534.html
