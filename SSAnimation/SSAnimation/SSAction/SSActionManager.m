//
//  SSActionManager.m
//  SSAnimation
//
//  Created by vienta on 13-12-25.
//  Copyright (c) 2013年 Candy. All rights reserved.
//

#import "SSActionManager.h"

@implementation SSActionManager


+ (instancetype)sharedSSActionManager
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedSSActionManager = nil;
    dispatch_once(&pred,^{
        _sharedSSActionManager = [[self alloc] init];
    });
    return _sharedSSActionManager;
}

- (void)addAction:(SSAction *)action target:(id)target
{
    NSAssert(action != nil, @"Action can not be nil");
    NSAssert(target != nil, @"Target can not be nil");
    
    NSString *actionKey = [NSString stringWithFormat:@"%@%@",[target class],[NSNumber numberWithUnsignedLong:[action hash]]];
    UIView *tTarget = (id)target;
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [CATransaction setCompletionBlock:^{
        NSLog(@"animation complete");
        [self decorateTarget:target];
        [tTarget.layer removeAnimationForKey:actionKey];
    }];
    [tTarget.layer addAnimation:action forKey:actionKey];
    
    [CATransaction commit];
}

- (void)removeAllActionsFromTarget:(id)target;
{
    NSAssert(target != nil, @"Target can not be nil");
    
    UIView *tTarget = (id)target;
    [self decorateTarget:tTarget];
    [tTarget.layer removeAllAnimations];
}

- (void)removeAction:(SSAction *)action fromTaget:(id)target
{
    if (!action) {
        return;
    }
    
    NSString *actionKey = [NSString stringWithFormat:@"%@%@",[target class],[NSNumber numberWithUnsignedLong:[action hash]]];
    UIView *tTarget = (id)target;
    [self decorateTarget:target];
    [tTarget.layer removeAnimationForKey:actionKey];
}

- (void)decorateTarget:(id)target
{
    UIView *tTarget = (id)target;
    CALayer *tTargetPresentLayer = [tTarget.layer presentationLayer];
    CGPoint position = tTargetPresentLayer.position;
    CGRect scalebounds = tTargetPresentLayer.bounds;
    CGFloat opacity = tTargetPresentLayer.opacity;
    CGFloat rotationAngle = [[tTargetPresentLayer valueForKeyPath:@"transform.rotation.z"] floatValue];
    CGFloat scaleX = [[tTargetPresentLayer valueForKeyPath:@"transform.scale.x"] floatValue];
    CGFloat scaleY = [[tTargetPresentLayer valueForKeyPath:@"transform.scale.y"] floatValue];
    tTarget.center = position;
    tTarget.bounds = scalebounds;
    tTarget.layer.opacity = opacity;
    tTarget.transform = CGAffineTransformMakeRotation(rotationAngle * M_PI / 180.0);
    tTarget.transform = CGAffineTransformMakeScale(scaleX, scaleY);
}


void MyCGPathApplierFunc (void *info, const CGPathElement *element) {
    NSMutableArray *bezierPoints = (__bridge NSMutableArray *)info;
    
    CGPoint *points = element->points;
    CGPathElementType type = element->type;
    
    switch(type) {
        case kCGPathElementMoveToPoint: // contains 1 point
            [bezierPoints addObject:[NSValue valueWithCGPoint:points[0]]];
            break;
            
        case kCGPathElementAddLineToPoint: // contains 1 point
            [bezierPoints addObject:[NSValue valueWithCGPoint:points[0]]];
            break;
            
        case kCGPathElementAddQuadCurveToPoint: // contains 2 points
            [bezierPoints addObject:[NSValue valueWithCGPoint:points[0]]];
            [bezierPoints addObject:[NSValue valueWithCGPoint:points[1]]];
            break;
            
        case kCGPathElementAddCurveToPoint: // contains 3 points
            [bezierPoints addObject:[NSValue valueWithCGPoint:points[0]]];
            [bezierPoints addObject:[NSValue valueWithCGPoint:points[1]]];
            [bezierPoints addObject:[NSValue valueWithCGPoint:points[2]]];
            break;
            
        case kCGPathElementCloseSubpath: // contains no point
            break;
    }
}



@end
