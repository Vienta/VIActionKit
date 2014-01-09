    //
//  SSAction.m
//  SSAnimation
//
//  Created by vienta on 13-12-25.
//  Copyright (c) 2013年 Candy. All rights reserved.
//

#import "SSAction.h"


@implementation CAAnimation (times)

@dynamic times;

@end

@implementation SSAction

- (id)init
{
    if ((self = [CAAnimation animation])) {
        
    }
    return self;
}

@end


@implementation SSMove

+ (id)actionWithDuration:(CFTimeInterval)duration from:(CGPoint)fp to:(CGPoint)tp
{
    return [[self alloc] initWithDuration:duration from:fp to:tp];
}

- (id)initWithDuration:(CFTimeInterval)duration from:(CGPoint)fp to:(CGPoint)tp
{
    if (self = [super init]) {
        CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        moveAnimation.duration = duration;
        moveAnimation.beginTime = CACurrentMediaTime();
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, fp.x, fp.y);
        CGPathAddLineToPoint(path, NULL, tp.x, tp.y);
        moveAnimation.path = path;
        moveAnimation.fillMode = kCAFillModeForwards;
        moveAnimation.removedOnCompletion = NO;
        CGPathRelease(path);
        
        self = (id)moveAnimation;
        
    }
    return self;
}

+ (id)actionWithDuration:(CFTimeInterval)duration path:(CGPathRef)path
{
    return [[self alloc] initWithDuration:duration path:path];
}

- (id)initWithDuration:(CFTimeInterval)duration path:(CGPathRef)path
{
    if (self = [super init]) {
        CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        moveAnimation.duration= duration;
        moveAnimation.beginTime = CACurrentMediaTime();
        moveAnimation.path = path;
        moveAnimation.fillMode = kCAFillModeForwards;
        moveAnimation.removedOnCompletion = NO;
        
        self = (id)moveAnimation;
    }
    return self;
}

@end


@implementation SSRotate

+ (id)actionWithDuration:(CFTimeInterval)duration degree:(float)degree
{
    return [[self alloc] initWithDuration:duration degree:degree];
}

- (id)initWithDuration:(CFTimeInterval)duration degree:(float)degree
{
    if (self = [super init]) {
        CABasicAnimation *angleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        angleAnimation.toValue = @(degree * M_PI / 180);
        angleAnimation.duration = duration;
        angleAnimation.beginTime = CACurrentMediaTime();
        angleAnimation.fillMode = kCAFillModeForwards;
        angleAnimation.removedOnCompletion = NO;
        self = (id)angleAnimation;
    }
    
    return self;
}

@end

@implementation SSScale

+ (id)actionWithDuration:(CFTimeInterval)duration scale:(float)s
{
    return [[self alloc] initWithDuration:duration scale:s];
}

- (id)initWithDuration:(CFTimeInterval)duration scale:(float)s
{
    if (self = [super init]) {
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.toValue = @(s);
        scaleAnimation.duration = duration;
        scaleAnimation.beginTime = CACurrentMediaTime();
        scaleAnimation.fillMode = kCAFillModeBoth;
        scaleAnimation.removedOnCompletion = NO;
        self = (id)scaleAnimation;
    }
    return self;
}

+ (id)actionWithDuration:(CFTimeInterval)duration scaleX:(float)sx
{
    return [[self alloc] initWithDuration:duration scaleX:sx];
}

- (id)initWithDuration:(CFTimeInterval)duration scaleX:(float)sx
{
    if (self = [super init]) {
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
        scaleAnimation.toValue = @(sx);
        scaleAnimation.duration = duration;
        scaleAnimation.beginTime = CACurrentMediaTime();
        scaleAnimation.fillMode = kCAFillModeBoth;
        scaleAnimation.removedOnCompletion = NO;
        
        self = (id)scaleAnimation;
    }
    
    return self;
}

+ (id)actionWithDuration:(CFTimeInterval)duration scaleY:(float)sy
{
    return [[self alloc] initWithDuration:duration scaleY:sy];
}

- (id)initWithDuration:(CFTimeInterval)duration scaleY:(float)sy
{
    if (self = [super init]) {
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
        scaleAnimation.toValue = @(sy);
        scaleAnimation.duration = duration;
        scaleAnimation.beginTime = CACurrentMediaTime();
        scaleAnimation.fillMode = kCAFillModeBoth;
        scaleAnimation.removedOnCompletion = NO;
        
        self = (id)scaleAnimation;
    }
    return self;
}

@end

@implementation SSFade

+ (id)actionDuration:(CFTimeInterval)duration opacity:(float)op
{
    return [[self alloc] initWithDuration:duration opacity:op];
}

- (id)initWithDuration:(CFTimeInterval)duration opacity:(float)op
{
    if (self = [super init]) {
        CABasicAnimation *fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        fadeAnimation.toValue = @(op);
        fadeAnimation.duration = duration;
        fadeAnimation.beginTime = CACurrentMediaTime();
        fadeAnimation.fillMode = kCAFillModeBoth;
        fadeAnimation.removedOnCompletion = NO;
        self = (id)fadeAnimation;
    }
    return self;
}

@end

@implementation SSFadeIn

+ (id)actionWithDuration:(CFTimeInterval)duration
{
    return [[self alloc] initWithDuration:duration];
}

- (id)initWithDuration:(CFTimeInterval)duration
{
    if (self = [super init]) {
        CABasicAnimation *fadeInAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        fadeInAnimation.toValue = @1.0;
        fadeInAnimation.beginTime = CACurrentMediaTime();
        fadeInAnimation.duration = duration;
        fadeInAnimation.fillMode = kCAFillModeBoth;
        fadeInAnimation.removedOnCompletion = NO;
        self = (id)fadeInAnimation;
    }
    return self;
}

@end

@implementation SSFadeOut

+ (id)actionWithDuration:(CFTimeInterval)duration
{
    return [[self alloc] initWithDuration:duration];
}

- (id)initWithDuration:(CFTimeInterval)duration
{
    if (self = [super init]) {
        CABasicAnimation *fadeOutAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        fadeOutAnimation.toValue = @.0;
        fadeOutAnimation.beginTime = CACurrentMediaTime();
        fadeOutAnimation.duration = duration;
        fadeOutAnimation.fillMode = kCAFillModeBoth;
        fadeOutAnimation.removedOnCompletion = NO;
        self = (id)fadeOutAnimation;
    }
    return self;
}

@end


@implementation SSDelayTime

+ (id)actionWithDuration:(CFTimeInterval)duration
{
    return [[self alloc] initWithDuration:duration];
}

- (id)initWithDuration:(CFTimeInterval)duration
{
    if (self = [super init]) {
        CABasicAnimation *delayAnimation = [CABasicAnimation animation];
        delayAnimation.beginTime = CACurrentMediaTime();
        delayAnimation.duration = duration;
        self = (id)delayAnimation;
    }
    return self;
}

@end


@implementation SSSequence

+ (id)actions:(SSAction *)action1, ...
{
    NSMutableArray *actions = [NSMutableArray arrayWithCapacity:0];
    CFTimeInterval totalDuration = 0;
    
    SSAction *eachaction;
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
    
    return [[self alloc] initWithDuration:totalDuration actions:actions];
}
+ (id)actionWithArray:(NSArray *)arrayOfActions
{
    NSMutableArray *actions = [NSMutableArray arrayWithCapacity:0];
    CFTimeInterval totolDuration = 0;
    
    for (int idx = 0; idx < [arrayOfActions count]; idx++) {
        SSAction *eachaction = (SSAction *)arrayOfActions[idx];
        eachaction.beginTime -= CACurrentMediaTime();
        eachaction.fillMode = kCAFillModeBackwards;
        eachaction.removedOnCompletion = NO;
        [actions addObject:eachaction];
        totolDuration += eachaction.duration + eachaction.beginTime;
    }
    
    return [[self alloc] initWithDuration:totolDuration actions:actions];
}

- (id)initWithDuration:(CFTimeInterval)duration actions:(NSMutableArray *)actions
{
    if (self = [super init]) {
        CAAnimationGroup *actionGroup = [CAAnimationGroup animation];
        [actionGroup setDuration:duration];
        [actionGroup setAnimations:actions];
        actionGroup.fillMode = kCAFillModeForwards;
        actionGroup.removedOnCompletion = NO;
        self = (id)actionGroup;
    }
    return self;
}

@end


@implementation SSSpawn


+ (id)actions:(SSAction *)action1, ...
{
    NSMutableArray *actions = [NSMutableArray arrayWithCapacity:0];
    CFTimeInterval maxDuration = 0;
    SSAction *eachaction;
    
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
    
    return [[self alloc] initWithDuration:maxDuration actions:actions];
}

- (id)initWithDuration:(CFTimeInterval)duration actions:(NSMutableArray *)actions
{
    if (self = [super init]) {
        CAAnimationGroup *actionGroup = [CAAnimationGroup animation];
        [actionGroup setDuration:duration];
        [actionGroup setAnimations:actions];
        actionGroup.fillMode = kCAFillModeForwards;
        actionGroup.removedOnCompletion = NO;
        self = (id)actionGroup;
    }
    return self;
}

+ (id)actionWithArray:(NSArray *)arrayOfActions
{
    NSMutableArray *actions = [NSMutableArray arrayWithCapacity:0];
    CFTimeInterval maxDuration = 0;
    for (int idx = 0; idx < [arrayOfActions count]; idx++) {
        SSAction *eachAction = arrayOfActions[idx];
        eachAction.beginTime -= CACurrentMediaTime();
        if (eachAction.duration > maxDuration) {
            maxDuration = eachAction.duration;
        }
        eachAction.fillMode = kCAFillModeForwards;
        eachAction.removedOnCompletion = NO;
        [actions addObject:eachAction];
    }
    
    return [[self alloc] initWithDuration:maxDuration actions:actions];
}


@end

@implementation SSRepeat

+ (id)actionWithAction:(SSAction *)action times:(NSUInteger)times
{
    return [[self alloc] initWithAction:action times:times];
}


- (id)initWithAction:(SSAction *)action times:(NSUInteger)times
{
    if (self = [super init]) {
        self = (id)action;
        self.times = times;
        action.repeatCount = times;
    }
    return self;
}

@end


