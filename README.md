# SSAnimation

## Features

- Simple use core animation for UIView and its subclass.
- Simple control the animation duration time.
- Support both actions at same time and sequeue actions.

## Requirements
- Requires iOS6 or later
- Requires ARC

## Demo

Build and run the <i>SSAnimation</i> project in Xcode.The demo will show you same basic animations.

## Usage
 
You can just as simple as possible to drag and drop the <i>/SSAction</i> folder into your project.Make sure that you add them to your target.In your <i>project-Prefix.pch</i>, you can import them so that you would use them anywhere you want.

<br />
<center>
	<img src="https://raw.github.com/Vienta/SSAnimation/master/IMG_0343.PNG">
</center>
<br />

examples: In demo, we use <i>testView</i> for example
<br />


####SSMove 
Move from one point to another, and also you can desgn your own path.

    + (id)actionWithDuration:(CFTimeInterval)duration from:(CGPoint)fp to:(CGPoint)tp;
    + (id)actionWithDuration:(CFTimeInterval)duration path:(CGPathRef)path;
    
In demo, you can touch move button:

    [testView runAction:[SSMove actionWithDuration:4 from:testView.center to:CGPointMake(testView.center.x, testView.center.y - 200)]];
    
testView will move from <i>testView.center</i> to  <i>CGPointMake(testView.center.x, testView.center.y - 200)</i>.

####SSFade SSFadeIn SSFadeOut
Change layer's opacity.In demo, you can touch Fade FadeIn and Fadeout Buttons.

####SSScale
Change layer's scale.

####SSDelayTime
Use this method:

    [SSDelayTime actionWithDuration:duration],
    
you can control the animation's delay time.

####SSSequence
Actions in sequence would action one by one.In demo, you can touch Sequence button.

    [testView runAction:[SSSequence actions:
                         [SSMove actionWithDuration:4 from:testView.center to:CGPointMake(self.view.center.x, self.view.center.y - 100)],
                         [SSRotate actionWithDuration:4 degree:45],
                         [SSDelayTime actionWithDuration:4],
                         [SSScale actionWithDuration:4 scale:1.5],
                         nil]];
                         
In above method,first action is move, then rotate, and then delaytime,scale at last.

## One more thing
When I use core animation, I find it hard to use,because I shoud write many code to implement just one simple animation and most of time it could not animate what I really want (like the original property can not change and so on).I also understand cocos2d and cocos2d's animation is very friendly to developer, so I try to make core animation as friendly as cocos2d's.After all,the project begin! 

Its just begin,So,I hope you can together with me to complete this project! Thank you!

ps:Sorry for my poor English.


    








