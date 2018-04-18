//
//  DiskLog.h
//  PrivatePodDemo
//
//  Created by wangpo on 2018/4/17.
//  Copyright © 2018年 wangpo. All rights reserved.
//

#import "DiskLog.h"
#include <mach/mach_time.h>
#include <stdint.h>

@implementation DiskLog

+(void)printLogtoDisk:(NSString*)log prefix:(NSString*)pre
{
    @synchronized(self)
    {
        NSString *libDirectory = [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"DiskLogData"];
        NSString *logPath= [libDirectory stringByAppendingPathComponent:@"log.txt"];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        if (![fileManager fileExistsAtPath:logPath])
        {
            BOOL result = [fileManager createFileAtPath:logPath contents:nil attributes:nil];
            if(!result){
                NSLog(@"log file create error");
            }
        }
        
        NSDate *date = [NSDate date];
        NSTimeZone *zone = [NSTimeZone systemTimeZone];
        NSInteger interval = [zone secondsFromGMTForDate: date];
        NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
        
        NSString *logContent = [NSString stringWithFormat:@"%@ : %@ -- %@\n\n",localeDate,pre,log];
        NSData *data =[logContent dataUsingEncoding:NSUTF8StringEncoding];
        
        NSFileHandle *handle = [NSFileHandle fileHandleForWritingAtPath:logPath];
        [handle seekToEndOfFile];
        [handle writeData:data];
        [handle closeFile];
    }
}
@end
