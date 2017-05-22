//
//  AnimationController.m
//  WalletExample
//
//  Created by Jonathan Yeung on 2017-05-21.
//  Copyright © 2017 Jonathan Yeung. All rights reserved.
//

#import "AnimationController.h"

@interface AnimationController ()

@property (nonatomic) CGRect originFrame;

@end

@implementation AnimationController

#pragma mark - <UIViewControllerAnimatedTransitioning>

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 2.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = transitionContext.containerView;
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect initialFrame = self.originFrame;
    CGRect finalFrame = [transitionContext finalFrameForViewController:toViewController];
    
    UIView *snapShot = [toViewController.view snapshotViewAfterScreenUpdates:YES];
    snapShot.frame = initialFrame;
    snapShot.layer.cornerRadius = 25;
    snapShot.layer.masksToBounds = YES;
    
    [containerView addSubview:toViewController.view];
    [containerView addSubview:snapShot];
    
    
}

@end
