//
//  DiskLog.m
//  BaoFeng-iPad
//
//  Created by deng on 12-8-31.
//
//

#import "DiskLog.h"
#include <mach/mach_time.h>
#include <stdint.h>

@implementation DiskLog

+(void)printLogtoDisk:(NSString*)log prefix:(NSString*)pre
{
#ifdef TRACE_LOG
    @synchronized(self)
    {
        NSString *libDirectory = LIBRARY_BFCheetahData_PATH;
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
#endif
}
@end
