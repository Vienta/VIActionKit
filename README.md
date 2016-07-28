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


### SSMove 
Move from one point to another, and also you can desgn your own path.

    + (id)actionWithDuration:(CFTimeInterval)duration from:(CGPoint)fp to:(CGPoint)tp;
    + (id)actionWithDuration:(CFTimeInterval)duration path:(CGPathRef)path;
    
In demo, you can touch move button:

    [testView runAction:[SSMove actionWithDuration:4 from:testView.center to:CGPointMake(testView.center.x, testView.center.y - 200)]];
    
testView will move from <i>testView.center</i> to  <i>CGPointMake(testView.center.x, testView.center.y - 200)</i>.

### SSFade SSFadeIn SSFadeOut
Change layer's opacity.In demo, you can touch Fade FadeIn and Fadeout Buttons.

### SSScale
Change layer's scale.

### SSDelayTime
Use this method:

    [SSDelayTime actionWithDuration:duration],
    
you can control the animation's delay time.

### SSSequence
Actions in sequence would action one by one.In demo, you can touch Sequence button.

    [testView runAction:[SSSequence actions:
                         [SSMove actionWithDuration:4 from:testView.center to:CGPointMake(self.view.center.x, self.view.center.y - 100)],
                         [SSRotate actionWithDuration:4 degree:45],
                         [SSDelayTime actionWithDuration:4],
                         [SSScale actionWithDuration:4 scale:1.5],
                         nil]];
                         
In above method,first action is move, then rotate, and then delaytime,scale at last.

    








