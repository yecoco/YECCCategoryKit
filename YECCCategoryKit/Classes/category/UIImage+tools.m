//
//  UIImage+tools.m
//  Wawaji
//
//  Created by yecongcong on 2017/10/17.
//  Copyright © 2017年 lotogram. All rights reserved.
//

#import "UIImage+tools.h"

@implementation UIImage (tools)

-(UIImage*)scaleImageToSize:(CGSize)newSize
{
    CGSize scaledSize = newSize;
    float scaleFactor = 1.0;
    if( self.size.width < self.size.height ) {
        scaleFactor = self.size.width / self.size.height;
        scaledSize.width = newSize.width;
        scaledSize.height = (int)(newSize.height / scaleFactor);
    }
    else {
        scaleFactor = self.size.height / self.size.width;
        scaledSize.height = newSize.height;
        scaledSize.width = (int)(newSize.width / scaleFactor);
    }
    
    UIGraphicsBeginImageContextWithOptions( scaledSize, NO, 1.0 );
    CGRect scaledImageRect = CGRectMake( 0.0, 0.0, scaledSize.width, scaledSize.height );
    [self drawInRect:scaledImageRect];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (UIImage*)grayImage {
    int width = self.size.width;
    int height = self.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate (nil, width, height,8,0, colorSpace,kCGImageAlphaNone);
    CGColorSpaceRelease(colorSpace);
    if (context ==NULL) {
        return nil;
    }
    CGContextDrawImage(context,CGRectMake(0,0, width, height), self.CGImage);
    CGImageRef imgRef = CGBitmapContextCreateImage(context);
    UIImage *grayImage = [UIImage imageWithCGImage:imgRef];
    CGImageRelease(imgRef);
    CGContextRelease(context);
    return grayImage;
}

@end
