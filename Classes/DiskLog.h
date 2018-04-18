//
//  DiskLog.h
//  PrivatePodDemo
//
//  Created by wangpo on 2018/4/17.
//  Copyright © 2018年 wangpo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiskLog : NSObject

+(void)printLogtoDisk:(NSString*)log prefix:(NSString*)pre;

@end
