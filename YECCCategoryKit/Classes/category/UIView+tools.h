//
//  UIView+tools.h
//  Wawaji
//
//  Created by yecongcong on 2017/10/17.
//  Copyright © 2017年 lotogram. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RoundedCornerType) {
    RoundedCornerTypeNone,
    RoundedCornerTypeTop,
    RoundedCornerTypeBottom,
    RoundedCornerTypeAll,
};

@interface UIView (tools)

- (UIImage *)screenShot;

- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii;

- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect;

//以下方法适用于重用处理，减少性能消耗
//使用以下方法时注意外面是否给view增加tag做特殊处理，如果有就别用下面的方法了
- (void)addRoundedCornersWithType:(RoundedCornerType)type
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect;

- (void)addRoundedCornersWithType:(RoundedCornerType)type
                withRadii:(CGSize)radii;

@end
