//
//  NSDate+tools.m
//  Wawaji
//
//  Created by yecongcong on 2017/12/8.
//  Copyright © 2017年 lotogram. All rights reserved.
//

#import "NSDate+tools.h"

@implementation NSDate (tools)

+ (NSTimeInterval)currentZeroOfDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *now = [self date];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
    NSDate *startDate = [calendar dateFromComponents:components];
    return [startDate timeIntervalSince1970];
}

@end
