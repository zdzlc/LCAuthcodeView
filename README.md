#LCAuthcodeView  
#####(中文说明往下拉)  

####Overview
LCAuthcodeView is derived from UIView,which can generate random auth code  
  
![screen shot](https://github.com/zdzlc/LCAuthcodeView/raw/master/screenshot.png)  


####Features
1. It's very simple to use,just put a LCAuthcodeView object on the super view like put a UIView,it will work well;  
2. Generate a new auth code by touch the view;
3. Auth code will rotate a random radian;
4. Generate some bezier curves over the code;
5. The lenth of auth code is 4 by default,you can assign another lenth;
6. Auto resize the text font to fit the size of view;
7. Each time generate a new auth code it can change background color random if you need, using fixed background color by default.
8. It can verify the auth code which user inputted


####Usage  
1. Download LCAuthcodeView.h and LCAuthcodeView.m and add them to your project;
2. If you want to create the view by code,do these steps just like create a UIView object:  
<font color=#3399aa>
	LCAuthcodeView *codeView = [[LCAuthcodeView  
	alloc]initWithFrame:frame];  
	codeView.backgroundColor = [UIColor whiteColor];  
	[self.view addSubView:codeView];
</font>	
3. If you use storyboard to layout UI,just put a view on the super view,then specify the Class with LCAuthcodeView;  
  
    Whatever the method you create the view,once the view  appear,you can see the auth code,touch it to change another auth code.
4. Call <font color=#3399aa>-(BOOL)verifyString:(NSString*)inputCode</font> method to verify the code which user input
5. Set the property <font color=#3399aa>usingRandomBackgroundColor</font> to YES to allow change random background color each time generate auth code, its value is NO by default;
6. Set the property <font color=#3399aa>codeTextLength</font> to change the lenth of auth code,4 by default.  
  
  


#LCAuthcodeView  
####概述  
LCAuthcodeView继承至UIView，能够随机生成验证码  
  
![screen shot](https://github.com/zdzlc/LCAuthcodeView/raw/master/screenshot.png)  
####特性  

1. 使用非常简单，LCAuthcodeView继承至UIView，但没有重写父类的创建和初始化方法，所以只要用你熟悉的方法，像放置UIView一样在界面上放一个LCAuthcodeView，立即就能看到效果；
2. 触摸即可重新生成验证码；
3. 验证码可随机产生顺逆时针的倾斜；
4. 生成贝塞尔曲线作为干扰线；
5. 默认生成4位的验证码，可通过属性指定位数；
6. 根据View的size，自动以合适的字体大小来适配；
7. 提供属性指定是否产生随机的背景色；
8. 自带校验方法，传入用户输入的code，即可返回是否匹配；

####使用方法：

1. 下载LCAuthcodeView.h和LCAuthcodeView.m放入你的工程;  
2. 如果你想用代码创建和初始化，则方法和UIView完全相同，比如:  
<font color=#3399aa>
	LCAuthcodeView *codeView = [[LCAuthcodeView alloc]initWithFrame:frame];  
	codeView.backgroundColor = [UIColor whiteColor];  
	[self.view addSubView:codeView];
</font>
3. 如果用Storyboard布局界面，只需要在界面上放一个view，指定它的类是LCAuthcodeView即可。

   无论上述哪种方法，当它呈现在界面上的时候，就会显示4位的验证码，触摸即可换一个验证码
4. 调用 <font color=#3399aa>-(BOOL)verifyString:(NSString*)inputCode</font>方法即可验证用户输入的验证码和View上显示的是否一致  
5. 设置属性<font color=#3399aa>usingRandomBackgroundColor</font>为YES即可生成随机背景色，默认为固定不变的背景色  
6. 设置<font color=#3399aa>codeTextLength</font>，即可改变验证码长度，默认为4个字符  
  
  