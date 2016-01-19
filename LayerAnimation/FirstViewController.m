//
//  FirstViewController.m
//  LayerAnimation
//
//  Created by 林伟池 on 16/1/13.
//  Copyright © 2016年 林伟池. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (nonatomic , strong) IBOutlet UIImageView* myImageView;
@end

@implementation FirstViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self customView];
    [self customNotify];
}

#pragma mark - view init

- (void)customView {
//    self.tabBarController.tabBar.hidden = YES;
}

#pragma mark - ibaction

- (IBAction)onOpacity:(id)sender {
    CABasicAnimation* base;
    
    base = [CABasicAnimation animationWithKeyPath:@"opacity"];
    base.fromValue = @(0);
    base.toValue = @(1);
    base.duration = 2;
    base.fillMode = kCAFillModeBackwards;
    base.beginTime = CACurrentMediaTime() + 1;
    [self.myImageView.layer addAnimation:base forKey:nil];
    
//    base = [CABasicAnimation animationWithKeyPath:@"position.x"];
//    base.fromValue = @(self.myImageView.layer.position.x - 10);
//    base.toValue = @(self.myImageView.layer.position.x + 50);
//    base.duration = 1;
//    base.fillMode = kCAFillModeForwards;
//    [self.myImageView.layer addAnimation:base forKey:nil];
    
}

- (IBAction)onGroup:(id)sender {
    CAAnimationGroup* group = [[CAAnimationGroup alloc] init];
    group.removedOnCompletion = NO;
    group.beginTime = CACurrentMediaTime() + 0.5;
    group.fillMode = kCAFillModeBoth;
    group.delegate = self;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    group.duration = 2;
    CABasicAnimation* position = [CABasicAnimation animationWithKeyPath:@"position.x"];
    position.fromValue = @(10);
    position.toValue = @(100);
    CABasicAnimation* scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.fromValue = @(0.5);
    scale.toValue = @(2);
    group.animations = @[position, scale];
    [self.myImageView.layer addAnimation:group forKey:nil];
}


- (IBAction)onKeyAnimation:(id)sender {
    CAKeyframeAnimation* keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    keyFrame.values = @[@(20), @(40), @(100), @(10), @(200)];
    keyFrame.fillMode = kCAFillModeBoth;
    keyFrame.calculationMode = kCAAnimationCubic;
    keyFrame.duration = 3;
    [self.myImageView.layer addAnimation:keyFrame forKey:nil];
}

- (IBAction)onTransition:(id)sender {
//    CATransform3D transition = CATransform3DMakeRotation(45, 1, 1, 1);
//    self.myImageView.layer.transform = transition;
    CATransition* transition = [CATransition animation];
    transition.duration = 2;
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromTop;
    transition.fillMode = kCAFillModeBoth;
    transition.delegate = self;
    [self.myImageView.layer addAnimation:transition forKey:nil];
    [self.myImageView setImage:[UIImage imageNamed:@"second"]];
}
#pragma mark - ui



#pragma mark - delegate

- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"start %@", self.myImageView);
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"end %@", self.myImageView);
}

#pragma mark - notify

- (void)customNotify {
    
}

@end
