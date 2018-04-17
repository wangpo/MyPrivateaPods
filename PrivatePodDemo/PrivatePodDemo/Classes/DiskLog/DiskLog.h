//
//  DiskLog.h
//  BaoFeng-iPad
//
//  Created by deng on 12-8-31.
//
//

#import <Foundation/Foundation.h>


#pragma mark -
#pragma mark DiskLog Interface

@interface DiskLog : NSObject

+(void)printLogtoDisk:(NSString*)log prefix:(NSString*)pre;

@end
