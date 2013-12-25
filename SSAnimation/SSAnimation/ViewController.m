//
//  ViewController.m
//  SSAnimation
//
//  Created by vienta on 13-12-25.
//  Copyright (c) 2013年 Candy. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Action.h"

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
    
//    [testView runAction:[SSMove actionWithDuration:5 from:CGPointMake(100, 100) to:CGPointMake(200, 300)]];
//    [testView runAction:[SSScale actionWithDuration:5 scale:2]];
//    [testView runAction:[SSRotate actionWithDuration:5 degree:45]];
//    [testView runAction:[SSSequence actions:[SSMove actionWithDuration:4 from:CGPointMake(100, 100) to:CGPointMake(400, 500)],[SSRotate actionWithDuration:2 degree:45], nil]];
//    [testView runAction:[SSScale actionWithDuration:2 scale:.5]];
//    [testView runAction:[SSDelayTime actionWithDuration:4]];
//    [testView runAction:[SSFade actionDuration:5 opacity:.1]];
//    [testView runAction:[SSSequence actions:[SSFade actionDuration:5 opacity:.1], nil]];
//    [testView runAction:[SSFadeIn actionWithDuration:5]];
//    [testView runAction:[SSFadeOut actionWithDuration:5]];
//    [testView runAction:[SSSequence actions:[SSFadeOut actionWithDuration:5], nil]];
    
//    [testView runAction:[SSScale actionWithDuration:4 scaleX:.5]];
//    [testView runAction:[SSScale actionWithDuration:4 scaleY:.5]];
    
//    [testView runAction:[SSSequence actions:[SSFadeOut actionWithDuration:4],[SSFadeIn actionWithDuration:4],[SSScale actionWithDuration:2 scale:.5],[SSDelayTime actionWithDuration:4],[SSMove actionWithDuration:4 from:testView.center to:CGPointMake(100, 500)], nil]];
    
//    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 80)];
//    [self.view addSubview:lbl];
//    lbl.center = self.view.center;
//    lbl.backgroundColor = [UIColor redColor];
//    
//    lbl.text = @"Hello world";
//    lbl.textAlignment = NSTextAlignmentCenter;
//    [lbl runAction:[SSScale actionWithDuration:4 scale:2]];
}
- (IBAction)clickStopAllActBtn:(id)sender
{
    [testView stopAllActions];
}
- (IBAction)clickSequenceBtn:(id)sender
{
    [testView runAction:[SSSequence actions:
                         [SSMove actionWithDuration:4 from:testView.center to:CGPointMake(self.view.center.x, self.view.center.y - 100)],
                         [SSRotate actionWithDuration:4 degree:45],
                         [SSFadeOut actionWithDuration:4],
                         [SSFadeIn actionWithDuration:4],
                         [SSDelayTime actionWithDuration:4],
                         [SSScale actionWithDuration:4 scale:1.5],
                         [SSScale actionWithDuration:4 scale:1],
                         [SSMove actionWithDuration:4 from:CGPointMake(self.view.center.x, self.view.center.y - 100) to:self.view.center],
                         [SSRotate actionWithDuration:4 degree:0],
                         nil]];
    
}
- (IBAction)clickSameTimeBtn:(id)sender
{
    [testView runAction:[SSMove actionWithDuration:4 from:testView.center to:CGPointMake(self.view.center.x, self.view.center.y - 200)]];
    [testView runAction:[SSScale actionWithDuration:4 scale:1.2]];
    [testView runAction:[SSRotate actionWithDuration:4 degree:90]];
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
