//
//  UIView+tools.m
//  Wawaji
//
//  Created by yecongcong on 2017/10/17.
//  Copyright © 2017年 lotogram. All rights reserved.
//

#import "UIView+tools.h"

@implementation UIView (tools)

- (UIImage *)screenShot
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii {
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    
    self.layer.mask = shape;
}

- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect {
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    self.layer.mask = shape;
}

- (void)addRoundedCornersWithType:(RoundedCornerType)type
                        withRadii:(CGSize)radii
                         viewRect:(CGRect)rect
{
    if (self.tag == type)
    {
        return;
    }
    if (self.layer.mask) {
        [self.layer.mask removeFromSuperlayer];
        self.layer.mask = nil;
    }
    if (type == RoundedCornerTypeTop)
    {
        [self addRoundedCorners:UIRectCornerTopLeft|UIRectCornerTopRight withRadii:radii viewRect:rect];
    }
    else if (type == RoundedCornerTypeBottom)
    {
        [self addRoundedCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight withRadii:radii viewRect:rect];
    }
    else if (type == RoundedCornerTypeAll)
    {
        [self addRoundedCorners:UIRectCornerAllCorners withRadii:radii viewRect:rect];
    }
    self.tag = type;
}

- (void)addRoundedCornersWithType:(RoundedCornerType)type
                        withRadii:(CGSize)radii
{
    if (self.tag == type)
    {
        return;
    }
    if (self.layer.mask) {
        [self.layer.mask removeFromSuperlayer];
        self.layer.mask = nil;
    }
    if (type == RoundedCornerTypeTop)
    {
        [self addRoundedCorners:UIRectCornerTopLeft|UIRectCornerTopRight withRadii:radii];
    }
    else if (type == RoundedCornerTypeBottom)
    {
        [self addRoundedCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight withRadii:radii];
    }
    else if (type == RoundedCornerTypeAll)
    {
        [self addRoundedCorners:UIRectCornerAllCorners withRadii:radii];
    }
    self.tag = type;
}

@end
