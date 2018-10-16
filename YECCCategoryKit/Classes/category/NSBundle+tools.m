//
//  NSBundle+tools.m
//  Wawaji
//
//  Created by yecongcong on 2017/9/25.
//  Copyright © 2017年 lotogram. All rights reserved.
//

#import "NSBundle+tools.h"

@implementation NSBundle (tools)

//display name
- (NSString *)appDisplayName
{
    return [self objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}

//app version
- (NSString *)appVersion
{
    return [self objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

//build version
- (NSString *)appBuildVersion
{
    return [self objectForInfoDictionaryKey:@"CFBundleVersion"];
}

//build identifier
- (NSString *)appBundleId
{
    return [self objectForInfoDictionaryKey:@"CFBundleIdentifier"];
}

- (BOOL)isEqualVersion:(NSString *)version
{
    NSString *currentVersion = [self appVersion];
    return [currentVersion compare:version options:NSNumericSearch] == NSOrderedSame;
}

- (BOOL)isGreaterVersion:(NSString *)version
{
    NSString *currentVersion = [self appVersion];
    return [currentVersion compare:version options:NSNumericSearch] == NSOrderedDescending;
}

- (BOOL)isLessVersion:(NSString *)version
{
    NSString *currentVersion = [self appVersion];
    return [currentVersion compare:version options:NSNumericSearch] == NSOrderedAscending;
}

- (BOOL)istest
{
    return YES;
}

@end
