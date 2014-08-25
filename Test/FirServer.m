//
//  FirServer.m
//  Test
//
//  Created by mac on 8/22/14.
//  Copyright (c) 2014 (zhifei - qiuzhifei521@gmail.com). All rights reserved.
//

#import "FirServer.h"
#import "FirConstans.h"

@implementation FirServer

+ (BOOL)checkoutVersionCompletionHandler:(void (^)(BOOL, NSString *, NSString *))completion
{
    void (^block_action)() = [completion copy];
    
    
    NSString * url_str = [NSString stringWithFormat:@"http://fir.im/api/v2/app/version/%@?token=%@",
                          ZFFirIdentifier,
                          ZFFirToken];
    
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url_str]]
                                       queue:[NSOperationQueue new]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   
                                   NSDictionary * status = [NSJSONSerialization JSONObjectWithData:data
                                                                                           options:kNilOptions
                                                                                             error:nil];
                                   
                                   // 服务端 version 与 本地 version
                                   NSString * version = [status objectForKey:@"versionShort"];
                                   NSString * localVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
                                   
                                   BOOL isNew = NO;
                                   if ([localVersion compare:version options:NSNumericSearch] == NSOrderedAscending) {
                                       
                                       isNew = YES;
                                   }
                                   
                                   if (block_action) {
                                       
                                       block_action(isNew, [status objectForKey:@"changelog"], [status objectForKey:@"name"]);
                                   }
                                   
                               });
                               
                           }];
    
    return YES;
}

+ (BOOL)toFirLoad
{
    NSString * item_servers = @"itms-services://?action=download-manifest&url=";
    
    NSString * url_str = [NSString stringWithFormat:@"https://fir.im/api/v2/app/install/%@?token=%@",
                          ZFFirOid,
                          ZFFirToken];
    
    // 转码
    url_str = [url_str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    url_str = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef) url_str,NULL,(CFStringRef) @"!*'();:@&=+$,/?%#[]",kCFStringEncodingUTF8));
    
    url_str = [item_servers stringByAppendingString:url_str];
    
    NSURL * url = [NSURL URLWithString:url_str];
    
    return [[UIApplication sharedApplication] openURL:url];
}

@end
