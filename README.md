# VIActonKit

`VIAcitonKit` is an extensible iOS animation library based on CoreAnimation.The actionkit's API was designed as simple as Cocos2d. 

## Features

- Simple use core animation for UIView and its subclass.
- Simple control the animation duration time.
- Support both actions at same time and sequeue actions.

## Requirements
- Requires iOS6 or later
- Requires ARC

## Usage


### VIMove 
Move from one point to another, and also you can desgn your own path.

    + (id)actionWithDuration:(CFTimeInterval)duration from:(CGPoint)fp to:(CGPoint)tp;
    + (id)actionWithDuration:(CFTimeInterval)duration path:(CGPathRef)path;
    
### VIFade

Change view's opacity.

	@interface VIFade : VIAction

	+ (id)actionDuration:(CFTimeInterval)duration opacity:(float)op;

	@end
	
	@interface VIFadeIn : VIAction
	
	+ (id)actionWithDuration:(CFTimeInterval)duration;
	
	@end
	
	@interface VIFadeOut : VIAction
	
	+ (id)actionWithDuration:(CFTimeInterval)duration;
		
	@end


### VIScale

You can scale a view throw below methods.

	+ (id)actionWithDuration:(CFTimeInterval)duration scale:(float)s;

	+ (id)actionWithDuration:(CFTimeInterval)duration scaleX:(float)sx;

	+ (id)actionWithDuration:(CFTimeInterval)duration scaleY:(float)sy;

### VIRotate

Rotate view action.

	@interface VIRotate : VIAction
	
	/**
	 *	rotate 旋转
	 *
	 *	@param	duration	时间
	 *	@param	degree	角度 example:45 表示顺时针45°旋转 145 表示逆时针45°旋转
	+ (id)actionWithDuration:(CFTimeInterval)duration degree:(float)degree;


### VIDelayTime
Use this method:

    [VIDelayTime actionWithDuration:duration],
    
You can control the animation's delay time.

### VISequence

`VIActionKit` support sequence actions.


    [demoView runAction:[SSSequence actions:
                         [SSMove actionWithDuration:4 from:testView.center to:CGPointMake(self.view.center.x, self.view.center.y - 100)],
                         [SSRotate actionWithDuration:4 degree:45],
                         [SSDelayTime actionWithDuration:4],
                         [SSScale actionWithDuration:4 scale:1.5],
                         nil]];
                         
In above method,first action is move, then rotate, and then delaytime,scale at last.All thoes actions happened in sequence.

    








