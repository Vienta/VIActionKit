//
//  ViewController.m
//  SSAnimation
//
//  Created by vienta on 13-12-25.
//  Copyright (c) 2013年 Candy. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Action.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController
{
    UIView *testView ;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    [self.view addSubview:testView];
    testView.center = self.view.center;
    testView.backgroundColor = [UIColor redColor];
    
}
- (IBAction)clickStopAllActBtn:(id)sender
{
    [testView stopAllActions];
}
- (IBAction)clickSequenceBtn:(id)sender
{
    CABasicAnimation *fadeInAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeInAnimation.toValue = @.8;
    fadeInAnimation.beginTime = 0;
    fadeInAnimation.duration = 3;
    fadeInAnimation.fillMode = kCAFillModeBoth;
    fadeInAnimation.removedOnCompletion = NO;

    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnimation.beginTime = 3;
    moveAnimation.duration = 3;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 100, 100);
    CGPathAddLineToPoint(path, NULL, 200, 200);
    moveAnimation.path = path;
    moveAnimation.fillMode = kCAFillModeForwards;
    moveAnimation.removedOnCompletion = NO;
    CGPathRelease(path);
    
    
    CAAnimationGroup *actionGroup = [CAAnimationGroup animation];
    [actionGroup setDuration:6];
    [actionGroup setAnimations:@[fadeInAnimation,moveAnimation]];
    actionGroup.fillMode = kCAFillModeForwards;
    actionGroup.removedOnCompletion = NO;
    
    [CATransaction begin];
    
    
    NSLog(@"testView start center %@", NSStringFromCGPoint(testView.center));
    [CATransaction setCompletionBlock:^{
        CGFloat radians = atan2f(testView.transform.b, testView.transform.a);
        [[testView layer] presentationLayer];
        NSLog(@"radians %f", radians);
        
        CGFloat rotationAngle = [[[testView.layer presentationLayer] valueForKeyPath:@"transform.rotation.z"] floatValue];
        CGFloat degrees = rotationAngle * (180 / M_PI);
        NSLog(@"degrees %f", degrees);
        
        NSLog(@"testView end center %@", NSStringFromCGPoint(testView.center));
        CALayer *layer = [testView.layer presentationLayer];
        NSLog(@"test presenterLayer center %@", NSStringFromCGPoint(layer.position));
        
        CGFloat scale = [[layer valueForKeyPath:@"transform.scale"] floatValue];
        NSLog(@"scale = %f", scale);
        
        CGFloat opacity = layer.opacity;
        NSLog(@"opacity = %f", opacity);
    }];
    
    [testView.layer addAnimation:actionGroup forKey:nil];
    
    [CATransaction commit];
}

- (IBAction)clickSameTimeBtn:(id)sender
{
//    [testView runAction:[SSMove actionWithDuration:4 from:testView.center to:CGPointMake(self.view.center.x, self.view.center.y - 200)]];
//    [testView runAction:[SSScale actionWithDuration:4 scale:1.2]];
//    [testView runAction:[SSRotate actionWithDuration:4 degree:90]];
    
    NSArray *acs = @[[SSMove actionWithDuration:4 from:testView.center to:CGPointMake(self.view.center.x, self.view.center.y - 200)],[SSScale actionWithDuration:4 scale:1.2],[SSRotate actionWithDuration:4 degree:90]];
    /*
    SSSpawn *spawnActio = [SSSpawn actions:[SSMove actionWithDuration:4 from:testView.center to:CGPointMake(self.view.center.x, self.view.center.y - 200)],[SSScale actionWithDuration:4 scale:1.2],[SSRotate actionWithDuration:4 degree:90], nil];
    */
    SSSpawn *spawnActio = [SSSpawn actionWithArray:acs];
    
    
    [testView runAction:spawnActio];
}
- (IBAction)clickMoveBtn:(id)sender {
    [testView runAction:[SSMove actionWithDuration:4 from:testView.center to:CGPointMake(testView.center.x, testView.center.y - 200)]];
}
- (IBAction)clickRotateBtn:(id)sender {
    [testView runAction:[SSRotate actionWithDuration:4 degree:45]];
}
- (IBAction)clickScaleBtn:(id)sender {
    [testView runAction:[SSScale actionWithDuration:4 scale:2]];
}
- (IBAction)clickScale1Btn:(id)sender {
    [testView runAction:[SSScale actionWithDuration:4 scale:.5]];
}
- (IBAction)clickFadeBtn:(id)sender {
    [testView runAction:[SSFade actionDuration:4 opacity:.5]];
}
- (IBAction)clickFadeInBtn:(id)sender {
    [testView runAction:[SSFadeIn actionWithDuration:4]];
}
- (IBAction)clickFadeOutBtn:(id)sender {
    [testView runAction:[SSFadeOut actionWithDuration:4]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
