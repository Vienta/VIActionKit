//
//  SSActionManager.h
//  SSAnimation
//
//  Created by vienta on 13-12-25.
//  Copyright (c) 2013年 Candy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSAction.h"

@interface SSActionManager : NSObject

+ (instancetype)sharedSSActionManager;

- (void)addAction:(SSAction *)action target:(id)target;

- (void)removeAllActionsFromTarget:(id)target;

- (void)removeAction:(SSAction *)action fromTaget:(id)target;

- (void)pauseActionFromTarget:(id)target;

- (void)resumeActionFromTarget:(id)target;

@end
