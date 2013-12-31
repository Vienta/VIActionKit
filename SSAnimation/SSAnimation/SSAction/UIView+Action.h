//
//  UIView+Action.h
//  SSAnimation
//
//  Created by vienta on 13-12-25.
//  Copyright (c) 2013年 Candy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSAction.h"

@interface UIView (Action)
- (id)runAction:(SSAction *)action;
- (void)stopAllActions;
- (void)stopAction:(SSAction *)action;
- (void)pauseActions;
- (void)resumeActions;

@end
