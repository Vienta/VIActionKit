//
//  SSActionManager.h
//  SSAnimation
//
//  Created by vienta on 13-12-25.
//  Copyright (c) 2013年 Candy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSAction.h"

/*
typedef struct _hashElement{
    __unsafe_unretained NSMutableDictionary *actions;
    __unsafe_unretained NSString *actionKey;
    __unsafe_unretained NSMutableDictionary *targets;
    __unsafe_unretained NSString *targetKey;
} sHashElement;
*/

@interface SSActionManager : NSObject
{
//    sHashElement *targets;
}

+ (instancetype)sharedSSActionManager;

- (void)addAction:(SSAction *)action target:(id)target;

- (void)removeAllActionsFromTarget:(id)target;

- (void)removeAction:(SSAction *)action fromTaget:(id)target;

@end
