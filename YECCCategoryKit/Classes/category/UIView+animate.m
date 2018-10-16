//
//  UIView+animate.m
//  Colory
//
//  Created by Ronnie on 8/2/16.
//  Copyright © 2016 lotogram. All rights reserved.
//

#import "UIView+animate.h"

@implementation UIView (animate)

- (void)fadeIn
{
    self.alpha = 0;
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)fadeOut
{
    self.alpha = 1;
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)fadeInWithDuration:(CGFloat)duration completion:(void (^)(BOOL finished))completion
{
    self.alpha = 0;
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
        if (completion) {
            completion(finished);
        }
    }];
}

- (void)fadeOutWithDuration:(CGFloat)duration completion:(void (^)(BOOL finished))completion
{
    self.alpha = 1;
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        self.alpha = 1;
        self.hidden = YES;
        if (completion) {
            completion(finished);
        }
    }];
}

- (void)presentWithOffset:(CGFloat)offset completion:(void (^)(BOOL finished))completion
{
    self.transform = CGAffineTransformMakeTranslation(0, -offset);
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = CGAffineTransformIdentity;
    } completion:completion];
}

- (void)presentWithHOffset:(CGFloat)offset completion:(void (^)(BOOL finished))completion
{
    self.transform = CGAffineTransformMakeTranslation(-offset, 0);
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = CGAffineTransformIdentity;
    } completion:completion];
}

- (void)dismissWithOffset:(CGFloat)offset completion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, offset);
    } completion:completion];
}

- (void)dismissWithHOffset:(CGFloat)offset completion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = CGAffineTransformMakeTranslation(offset, 0);
    } completion:completion];
}

- (void)presentWithBounce
{
    self.hidden = YES;
    [self.layer removeAllAnimations];
    [UIView animateWithDuration:0.1 animations:^{self.hidden = NO;}];
    self.layer.transform = CATransform3DMakeScale(0.8, 0.8, 1.0);
    CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    bounceAnimation.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.8],
                              [NSNumber numberWithFloat:1.1],
                              [NSNumber numberWithFloat:0.9],
                              [NSNumber numberWithFloat:1.0],
                              [NSNumber numberWithFloat:1.0], nil];
    NSArray *times = [NSArray arrayWithObjects:
                      [NSNumber numberWithFloat:0.0f],
                      [NSNumber numberWithFloat:0.1f],
                      [NSNumber numberWithFloat:0.2f],
                      [NSNumber numberWithFloat:0.3f],
                      [NSNumber numberWithFloat:1.0f], nil];
    [bounceAnimation setKeyTimes:times];
    bounceAnimation.duration = 1.0;
    bounceAnimation.repeatCount = 1;
    bounceAnimation.removedOnCompletion = NO;
    [self.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    self.layer.transform = CATransform3DIdentity;
}

@end
