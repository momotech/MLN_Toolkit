## MLN开发环境配置
```
扫码预览是一种简洁的方式，但是在真正的开发过程中，我们需要有更高效的方式来进行编写预览，这个时候就需要有一个完整的开发环境和动态刷新的开发方式。经过以下几步操作，配置我们的开发环境。
1. 安装IDE，并安装相关插件  
2. 下载配置模板工程
3. 本地扫码包环境配置，(Debug包是lua源码,Release包是编译后的包，运行效率更高，建议生产环境使用)
4. 热更新方式进行开发
5. 示例
```
#### 一.安装IDE
1. 下载最新的IEEA,推荐社区版本,无需注册码([IEDA](http://www.jetbrains.com/idea/download/#section=mac))
2. 为IDEA安装Lua插件 EmmyLua  
IEDA->Preferences->Plugins, 搜错EmmyLua下载并安装   
3. 为IDEA安装Bash插件 BashSupport  
IDEA->Preferences->Plugins, 搜索BashSupport下载并安装    
4. 为IDEA安装热更新插件LuaNative    
4.1. 下载插件[LuaNative](https://github.com/dingpuyu/MLN_Toolkit/blob/master_image_source/component/LuaNative.zip?raw=true)，注意是zip包才能正确安装  
4.2. IDEA->Preferences->Plugins->⚙->Install plugin from disk, 本地安装    
5. 安装JDK，以便使用Lua的调试工具 [JDK](https://www.oracle.com/technetwork/java/javase/downloads/index.html)

#### 二.下载安装模板工程
1. 克隆MLN模板工程
```
git clone https://github.com/momotech/MLN_Toolkit
```
2. 使用IDEA打开模板工程
启动IDEA-》Open找到MLNTemplate文件就-》Open打开模板工程  
![image.png](https://github.com/dingpuyu/MLN_Toolkit/blob/master_image_source/images/5dc79cda02e92.png?raw=true)  
#### 三.本地扫码包环境配置
1. 初始化Lua编译器
点击IDEA左下角，Terminal选项卡，安装Lua编译器
```
$ cd Utils/Shell/
$ ./setup.sh 电脑密码
按照提示，选择开发环境
```
2. 点击右上角MLNTemplate_Init右边绿三角执行，按照提示输入密码，初始化编译脚本
![image.png](https://github.com/dingpuyu/MLN_Toolkit/blob/master_image_source/images/5dc7c412afb74.png?raw=true)
3. 成功后，我们点击MLNTemplate_Init后会看到如下  
![image.png](https://github.com/dingpuyu/MLN_Toolkit/blob/master_image_source/images/5dc7c4591251c.png?raw=true)  
index是模板工程默认的一个文件，选中indexDebug点击绿三角运行
成功后会弹出一个二维码页面，选择你所编译的文件，使用Demo应用扫码即可
#### 四.热更新方式进行开发
```
在第一步中，我们已经安装了LuaNative插件，现在可以正式开始使用热更新方式进行开发了
```
1. 请先将您的开发设备连接到电脑，并打开Demo应用的热重载页面
2. 点击IDEA左下角的LuaNative选项卡，我们可以看到如下  
![image.png](https://github.com/dingpuyu/MLN_Toolkit/blob/master_image_source/images/5dc7c831ea930.png?raw=true)  
3. 根据您的开发设备系统，从Device Inof下对应的选项中找到并选中您的设备，如果无法找到，请尝试重启IDEA，重新热插拔手机。正常情况下，此时热重载页面会提示连接成功。
4. 选择入口文件，在src目录中，默认会有一个index.lua，此时我们可以选中它，右键展示选项列表点击其中Make As Entry File选项。此时，LuaNative插件处的EntryFile选项卡下，入口文件就更新为index.lua，您可以随意设置src下的文件作为入口文件，进行开发工作。
5. 自动同步功能，开启后，编辑lua文件后会实时进行检查，更新。关闭后，手动点击刷新按钮才会进行更新。
6. 修改一下index.lua中的文件，看一下有没有实时进行更新吧！  
#### 五.示例
```
经以上步骤，我们已经完成了开发环境的搭建，千里之行始于足下，为了能够能够开发出定制化更强的lua控件，我们建议使用lua进行组件的封装，接下来，我将带领大家使用一下lua开发的组件
```
在index.lua中键入以下内容，并点击屏幕测试效果  
```
MLToast = require("LuaComponent.MLToast.MLToast")
window:onClick(function()
MLToast("你好呀！",2,window,-30)
end)
```
效果如图：  
![image.png](https://github.com/dingpuyu/MLN_Toolkit/blob/master_image_source/images/5dc7d709ab662.png?raw=true)  

#### 热重载开发展示  
![image](https://github.com/dingpuyu/MLN_Toolkit/blob/master_image_source/images/mln-hotreload.gif?raw=true)
