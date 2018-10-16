//
//  NSString+tools.h
//  Wawaji
//
//  Created by yecongcong on 2017/10/20.
//  Copyright © 2017年 lotogram. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (tools)

- (BOOL)isMobileString;
- (NSString *)signWithMD5;
- (BOOL)isEmailString;
- (BOOL)isValidUrl;
- (BOOL)isGifImage;
@end
