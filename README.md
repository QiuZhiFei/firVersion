firVersion
==========

在使用 fir 的过程中，实现 app 的检测版本号，会提醒 测试人员 更新

效果 
-----------

fir 检测版本，并更新提示

![](http://zhifei.qiniudn.com/fir_1.png)



需要修改的文件
------------
> firConstans.h

```
// App在数据库中生成的id
// 获取方式，pc 点开 app，浏览器 url 中
#define ZFFirOid @"53f712922bbedfc95200088e"

// 用户的token
// 获取方法，pc 点开 用户
#define ZFFirToken @"Sd2wkPVCl3gED9nMnb3AVURz7eocbiwopNfIzyAf"

// app 的 identifier
#define ZFFirIdentifier @"com.nuandao.nuandao.inhouse"

```

使用
------------

```
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
    // 检查版本
    [FirServer checkoutVersionCompletionHandler:^(BOOL isNew, NSString *changelog, NSString *name) {
        
        if (isNew) {
            
            UIAlertView * alert = [[UIAlertView alloc]
                                   initWithTitle:[name stringByAppendingString:@"更新"]
                                   message:changelog
                                   delegate:self
                                   cancelButtonTitle:@"取消"
                                   otherButtonTitles:@"下载", nil];
            [alert show];
            
        }
    }];
}


#pragma mark - alert delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // 下载更新
    if (buttonIndex == 1) {
        
        [FirServer toFirLoad];
    }
}

```

## 作者
* 仇志飞 ([@zhifei](http://weibo.com/718001205))