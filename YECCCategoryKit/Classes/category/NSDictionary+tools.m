//
//  NSDictionary+tools.m
//  Wawaji
//
//  Created by yecongcong on 2017/9/25.
//  Copyright © 2017年 lotogram. All rights reserved.
//

#import "NSDictionary+tools.h"

@implementation NSDictionary (tools)

- (NSString *)stringOfKey:(id)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSNull class]] || value == NULL || value == nil)
        return nil;
    else
        return [NSString stringWithFormat:@"%@",value];
}

- (NSNumber *)numberForKey:(id)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSNull class]] || value == NULL || value == nil)
        return nil;
    else if ([value isKindOfClass:[NSNumber class]])
        return value;
    else if ([value isKindOfClass:[NSString class]])
    {
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
        return [numberFormatter numberFromString:value];
    }
    else
    {
        return [NSNumber numberWithFloat:[value integerValue]];
    }
}

- (NSArray *)arrayForKey:(id)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSArray class]])
        return value;
    else
        return nil;
}

- (NSDictionary *)dictionaryForKey:(id)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSDictionary class]])
        return value;
    else
        return nil;
}

- (int)intForKey:(id)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSNull class]] || value == NULL || value == nil)
        return 0;
    else
        return [value intValue];
}

- (unsigned int)unsignedIntForKey:(id)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSNull class]] || value == NULL || value == nil)
        return 0;
    else
        return [value unsignedIntValue];
}

- (float)floatForKey:(id)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSNull class]] || value == NULL || value == nil)
        return 0;
    else
        return [value floatValue];
}

- (double)doubleForKey:(id)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSNull class]] || value == NULL || value == nil)
        return 0;
    else
        return [value doubleValue];
}

- (NSInteger)intergerForKey:(id)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSNull class]] || value == NULL || value == nil)
        return 0;
    else
        return [value integerValue];
}

- (NSUInteger)unsignedIntergerForKey:(id)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSNull class]] || value == NULL || value == nil)
        return 0;
    else
        return [value unsignedIntegerValue];
}

- (long long)longLongForKey:(id)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSNull class]] || value == NULL || value == nil)
        return 0;
    else
        return [value longLongValue];
}

- (BOOL)boolValue:(id)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSNull class]] || value == NULL || value == nil)
        return NO;
    else
        return [value boolValue];
}

@end
