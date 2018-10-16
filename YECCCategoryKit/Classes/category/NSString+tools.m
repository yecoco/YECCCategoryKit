//
//  NSString+tools.m
//  Wawaji
//
//  Created by yecongcong on 2017/10/20.
//  Copyright © 2017年 lotogram. All rights reserved.
//

#import "NSString+tools.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (tools)

- (BOOL)isMobileString
{
    NSString *MOBILE = @"^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,3,5-8])|(18[0-9])|166|198|199|(147))\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:self];
}

- (NSString *)signWithMD5
{
    const char *cString = self.UTF8String;
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cString, (CC_LONG)strlen(cString), result);
    NSMutableString *resultString = [[NSMutableString alloc]init];
    for (int i = 0;i < CC_MD5_DIGEST_LENGTH; i++) {
        [resultString appendFormat:@"%02x",result[i]];
    }
    return resultString;
}

- (BOOL)isEmailString
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isValidUrl {
    NSString *regex =@"[a-zA-z]+://[^\\s]*";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [urlTest evaluateWithObject:self];
}

- (BOOL)isGifImage {
    NSString *ext = self.pathExtension.lowercaseString;
    if ([ext isEqualToString:@"gif"]) {
        return YES;
    }
    return NO;
}

+ (BOOL)isGifWithImageData: (NSData *)data {
    if ([[self contentTypeWithImageData:data] isEqualToString:@"gif"]) {
        return YES;
    }
    return NO;
}

+ (NSString *)contentTypeWithImageData: (NSData *)data {
    uint8_t c;
    [data getBytes:&c length:1];
    switch (c) {
        case 0xFF:
            return @"jpeg";
        case 0x89:
            return @"png";
        case 0x47:
            return @"gif";
        case 0x49:
    
        case 0x4D:
            return @"tiff";
        case 0x52:
            if ([data length] < 12) {
                return nil;
            }
            NSString *testString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([testString hasPrefix:@"RIFF"] && [testString hasSuffix:@"WEBP"]) {
                return @"webp";
            }
            return nil;
    }
    return nil;
}

@end
