//
//  UIView+Action.h
//  SSAnimation
//
//  Created by vienta on 13-12-25.
//  Copyright (c) 2013年 Candy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VIAction.h"

@interface UIView (Action)
- (id)runAction:(VIAction *)action;
- (void)stopAllActions;
- (void)stopAction:(VIAction *)action;
- (void)pauseActions;
- (void)resumeActions;

@end
