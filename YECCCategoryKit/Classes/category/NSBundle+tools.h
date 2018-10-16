//
//  NSBundle+tools.h
//  Wawaji
//
//  Created by yecongcong on 2017/9/25.
//  Copyright © 2017年 lotogram. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (tools)
//display name
- (NSString *)appDisplayName;
//app version
- (NSString *)appVersion;
//build version
- (NSString *)appBuildVersion;
//build identifier
- (NSString *)appBundleId;

- (BOOL)isEqualVersion:(NSString *)version;

- (BOOL)isGreaterVersion:(NSString *)version;

- (BOOL)isLessVersion:(NSString *)version;
@end
