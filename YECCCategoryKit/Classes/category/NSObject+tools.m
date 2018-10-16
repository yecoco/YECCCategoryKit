//
//  NSObject+tools.m
//  WawaService
//
//  Created by yecongcong on 2017/11/6.
//  Copyright © 2017年 lotogram. All rights reserved.
//

#import "NSObject+tools.h"
#import <objc/runtime.h>

@implementation NSObject (tools)
- (NSArray *)propertys
{
    u_int count;
    objc_property_t *properties  =class_copyPropertyList([self class], &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count ; i++)
    {
        const char* propertyName =property_getName(properties[i]);
        if (propertyName) {
            [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
        }
    }
    free(properties);
    return propertiesArray;
}
@end
