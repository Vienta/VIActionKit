//
//  UIView+Action.m
//  SSAnimation
//
//  Created by vienta on 13-12-25.
//  Copyright (c) 2013年 Candy. All rights reserved.
//

#import "UIView+Action.h"
#import "VIActionManager.h"

@implementation UIView (Action)

- (id)runAction:(VIAction *)action
{
    NSAssert(action != nil, @"action can not be nil");
    [[VIActionManager sharedInstance] addAction:action target:self];
    return action;
}

- (void)stopAllActions
{
    [[VIActionManager sharedInstance] removeAllActionsFromTarget:self];
}

- (void)stopAction:(VIAction *)action
{
    [[VIActionManager sharedInstance] removeAction:action fromTaget:self];
}

- (void)pauseActions
{
    [[VIActionManager sharedInstance] pauseActionFromTarget:self];
}

- (void)resumeActions
{
    [[VIActionManager sharedInstance] resumeActionFromTarget:self];
}

@end
