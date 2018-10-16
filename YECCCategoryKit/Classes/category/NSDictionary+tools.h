//
//  NSDictionary+tools.h
//  Wawaji
//
//  Created by yecongcong on 2017/9/25.
//  Copyright © 2017年 lotogram. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (tools)

- (NSString *)stringOfKey:(id)key;
- (NSNumber *)numberForKey:(id)key;
- (NSArray *)arrayForKey:(id)key;
- (NSDictionary *)dictionaryForKey:(id)key;

- (int)intForKey:(id)key;
- (unsigned int)unsignedIntForKey:(id)key;
- (float)floatForKey:(id)key;
- (double)doubleForKey:(id)key;
- (NSInteger)intergerForKey:(id)key;
- (NSUInteger)unsignedIntergerForKey:(id)key;
- (long long)longLongForKey:(id)key;
- (BOOL)boolValue:(id)key;

@end
