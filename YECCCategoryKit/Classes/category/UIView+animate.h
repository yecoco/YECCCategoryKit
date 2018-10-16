//
//  UIView+animate.h
//  Colory
//
//  Created by Ronnie on 8/2/16.
//  Copyright © 2016 lotogram. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (animate)

- (void)fadeIn;
- (void)fadeOut;

- (void)fadeInWithDuration:(CGFloat)duration completion:(void (^)(BOOL finished))completion;
- (void)fadeOutWithDuration:(CGFloat)duration completion:(void (^)(BOOL finished))completion;

- (void)presentWithOffset:(CGFloat)offset completion:(void (^)(BOOL finished))completion;
- (void)presentWithHOffset:(CGFloat)offset completion:(void (^)(BOOL finished))completion;
- (void)dismissWithOffset:(CGFloat)offset completion:(void (^)(BOOL finished))completion;
- (void)dismissWithHOffset:(CGFloat)offset completion:(void (^)(BOOL finished))completion;

- (void)presentWithBounce;
@end
