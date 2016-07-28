//
//  SSActionManager.h
//  SSAnimation
//
//  Created by vienta on 13-12-25.
//  Copyright (c) 2013年 Candy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VIAction.h"

@interface VIActionManager : NSObject

+ (instancetype)sharedInstance;

- (void)addAction:(VIAction *)action target:(id)target;

- (void)removeAllActionsFromTarget:(id)target;

- (void)removeAction:(VIAction *)action fromTaget:(id)target;

- (void)pauseActionFromTarget:(id)target;

- (void)resumeActionFromTarget:(id)target;

@end
