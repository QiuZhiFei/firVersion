//
//  FirServer.h
//  Test
//
//  Created by mac on 8/22/14.
//  Copyright (c) 2014 (zhifei - qiuzhifei521@gmail.com). All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FirServer : NSObject

+ (BOOL)checkoutVersionCompletionHandler:(void(^)(BOOL isNew , NSString * changelog, NSString * name))completion;

+ (BOOL)toFirLoad;

@end
