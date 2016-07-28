    //
//  SSAction.m
//  SSAnimation
//
//  Created by vienta on 13-12-25.
//  Copyright (c) 2013年 Candy. All rights reserved.
//

#import "VIAction.h"


@implementation CAAnimation (times)

@dynamic times;

@end

@implementation VIAction

+ (CABasicAnimation *)basicAnimationWithKeyPath:(NSString *)keyPath fillMode:(NSString *)fillMode
{
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:keyPath];
    basicAnimation.beginTime = CACurrentMediaTime();
    basicAnimation.fillMode = fillMode;
    basicAnimation.removedOnCompletion = NO;
    
    return basicAnimation;
}

+ (CABasicAnimation *)basicAnimationWithKeyPath:(NSString *)keyPath
{
    return [[self class] basicAnimationWithKeyPath:keyPath fillMode:kCAFillModeBoth];
}

+ (CAKeyframeAnimation *)keyframeAnimationWithKeyPath:(NSString *)keyPath
{
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    keyframeAnimation.beginTime = CACurrentMediaTime();
    keyframeAnimation.fillMode = kCAFillModeForwards;
    keyframeAnimation.removedOnCompletion = NO;
    
    return keyframeAnimation;
}

@end


@implementation VIMove

+ (id)actionWithDuration:(CFTimeInterval)duration from:(CGPoint)fp to:(CGPoint)tp
{
    CAKeyframeAnimation *moveAnimation = [[self superclass] keyframeAnimationWithKeyPath:@"position"];
    
    moveAnimation.duration = duration;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, fp.x, fp.y);
    CGPathAddLineToPoint(path, NULL, tp.x, tp.y);
    moveAnimation.path = path;
    CGPathRelease(path);

    return moveAnimation;
}


+ (id)actionWithDuration:(CFTimeInterval)duration path:(CGPathRef)path
{
    CAKeyframeAnimation *moveAnimation = [[self superclass] keyframeAnimationWithKeyPath:@"position"];
    
    moveAnimation.duration = duration;
    moveAnimation.path = path;

    return moveAnimation;
}

@end


@implementation VIRotate

+ (id)actionWithDuration:(CFTimeInterval)duration degree:(float)degree
{
    CABasicAnimation *angleAnimation = [[self superclass] basicAnimationWithKeyPath:@"transform.rotation" fillMode:kCAFillModeForwards];
    angleAnimation.toValue = @(degree * M_PI / 180);
    angleAnimation.duration = duration;

    return angleAnimation;
}


@end

@implementation VIScale

+ (id)actionWithDuration:(CFTimeInterval)duration scale:(float)s
{
    CABasicAnimation *scaleAnimation = [[self superclass] basicAnimationWithKeyPath:@"transform.scale"];
    scaleAnimation.toValue = @(s);
    scaleAnimation.duration = duration;
    
    return scaleAnimation;
}

+ (id)actionWithDuration:(CFTimeInterval)duration scaleX:(float)sx
{
    CABasicAnimation *scaleAnimation = [[self superclass] basicAnimationWithKeyPath:@"transform.scale.x"];
    scaleAnimation.toValue = @(sx);
    scaleAnimation.duration = duration;
    
    return scaleAnimation;
}

+ (id)actionWithDuration:(CFTimeInterval)duration scaleY:(float)sy
{
    CABasicAnimation *scaleAnimation = [[self superclass] basicAnimationWithKeyPath:@"transform.scale.y"];
    scaleAnimation.toValue = @(sy);
    scaleAnimation.duration = duration;
    
    return scaleAnimation;
}


@end

@implementation VIFade

+ (id)actionDuration:(CFTimeInterval)duration opacity:(float)op
{
    CABasicAnimation *fadeAnimation = [[self superclass] basicAnimationWithKeyPath:@"opacity"];
    fadeAnimation.toValue = @(op);
    fadeAnimation.duration = duration;

    return fadeAnimation;
}

@end

@implementation VIFadeIn

+ (id)actionWithDuration:(CFTimeInterval)duration
{
    CABasicAnimation *fadeInAnimation = [[self superclass] basicAnimationWithKeyPath:@"opacity"];
    fadeInAnimation.toValue = @1.0;
    fadeInAnimation.duration = duration;
    
    return fadeInAnimation;
}


@end

@implementation VIFadeOut

+ (id)actionWithDuration:(CFTimeInterval)duration
{
    CABasicAnimation *fadeOutAnimation = [[self superclass] basicAnimationWithKeyPath:@"opacity"];
    fadeOutAnimation.toValue = @.0;
    fadeOutAnimation.duration = duration;

    return fadeOutAnimation;
}

@end


@implementation VIDelayTime

+ (id)actionWithDuration:(CFTimeInterval)duration
{
    CABasicAnimation *delayAnimation = [CABasicAnimation animation];
    delayAnimation.beginTime = CACurrentMediaTime();
    delayAnimation.duration = duration;
    
    return delayAnimation;
}

@end


@implementation VISequence

+ (id)actions:(VIAction *)action1, ...
{
    NSMutableArray *actions = [NSMutableArray arrayWithCapacity:0];
    CFTimeInterval totalDuration = 0;
    
    VIAction *eachaction;
    va_list params;
    if (action1) {
        action1.beginTime = action1.beginTime - CACurrentMediaTime();
        action1.fillMode = kCAFillModeForwards;
        action1.removedOnCompletion = NO;
        totalDuration = action1.duration + action1.beginTime;
        [actions addObject:action1];
        
        va_start(params,action1);
        
        while ((eachaction = va_arg(params, id))) {
            eachaction.beginTime = totalDuration + eachaction.beginTime - CACurrentMediaTime();
            eachaction.fillMode = kCAFillModeForwards;
            eachaction.removedOnCompletion = NO;
            [actions addObject:eachaction];
            totalDuration = totalDuration + eachaction.duration;
        }
        
        va_end(params);
        
    }
    
    return [[self class] actionWithDuration:totalDuration actions:actions];
}
+ (id)actionWithArray:(NSArray *)arrayOfActions
{
    NSMutableArray *actions = [NSMutableArray arrayWithCapacity:0];
    CFTimeInterval totolDuration = 0;
    
    for (int idx = 0; idx < [arrayOfActions count]; idx++) {
        VIAction *eachaction = (VIAction *)arrayOfActions[idx];
        eachaction.beginTime -= CACurrentMediaTime();
        eachaction.fillMode = kCAFillModeBackwards;
        eachaction.removedOnCompletion = NO;
        [actions addObject:eachaction];
        totolDuration += eachaction.duration + eachaction.beginTime;
    }
    
    return [[self class] actionWithDuration:totolDuration actions:actions];
}

+ (id)actionWithDuration:(CFTimeInterval)duration actions:(NSMutableArray *)actions
{
    CAAnimationGroup *actionGroup = [CAAnimationGroup animation];
    [actionGroup setDuration:duration];
    [actionGroup setAnimations:actions];
    actionGroup.fillMode = kCAFillModeForwards;
    actionGroup.removedOnCompletion = NO;
    return actionGroup;
}

@end


@implementation VISpawn


+ (id)actions:(VIAction *)action1, ...
{
    NSMutableArray *actions = [NSMutableArray arrayWithCapacity:0];
    CFTimeInterval maxDuration = 0;
    VIAction *eachaction;
    
    va_list params;
    if (action1) {
        action1.beginTime = action1.beginTime - CACurrentMediaTime();
        action1.fillMode = kCAFillModeForwards;
        action1.removedOnCompletion = NO;
        maxDuration = action1.duration + action1.beginTime;
        [actions addObject:action1];
        
        va_start(params, action1);
        
        while ((eachaction = va_arg(params, id))) {
            eachaction.beginTime = eachaction.beginTime - CACurrentMediaTime();
            eachaction.fillMode = kCAFillModeForwards;
            eachaction.removedOnCompletion = NO;
            [actions addObject:eachaction];
            if (eachaction.duration >= maxDuration) {
                maxDuration = eachaction.duration;
            }
        }
        
        va_end(params);
    }
    return [[self class] actionWithDuration:maxDuration actions:actions];
}

+ (id)actionWithDuration:(CFTimeInterval)duration actions:(NSMutableArray *)actions
{
    CAAnimationGroup *actionGroup = [CAAnimationGroup animation];
    [actionGroup setDuration:duration];
    [actionGroup setAnimations:actions];
    actionGroup.fillMode = kCAFillModeForwards;
    actionGroup.removedOnCompletion = NO;
    
    return actionGroup;
}

+ (id)actionWithArray:(NSArray *)arrayOfActions
{
    NSMutableArray *actions = [NSMutableArray arrayWithCapacity:0];
    CFTimeInterval maxDuration = 0;
    for (int idx = 0; idx < [arrayOfActions count]; idx++) {
        VIAction *eachAction = arrayOfActions[idx];
        eachAction.beginTime -= CACurrentMediaTime();
        if (eachAction.duration > maxDuration) {
            maxDuration = eachAction.duration;
        }
        eachAction.fillMode = kCAFillModeForwards;
        eachAction.removedOnCompletion = NO;
        [actions addObject:eachAction];
    }
    
    return [[self class] actionWithDuration:maxDuration actions:actions];
}


@end

@implementation VIRepeat

+ (id)actionWithAction:(VIAction *)action times:(NSUInteger)times
{
    action.times = times;
    action.repeatCount = times;

    return action;
}

@end


