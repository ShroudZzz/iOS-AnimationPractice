//
//  ViewController.m
//  BounsAnimation
//
//  Created by VermouthC on 2017/8/17.
//  Copyright © 2017年 VermouthC. All rights reserved.
//

#import "ViewController.h"
//动画时间
static float const anmationTime = 2.5;

@interface ViewController ()
@property (nonatomic,weak) UIView *picView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setZzz];
}

-(void)setZzz{
    
    //透明度变化
    CABasicAnimation *anmationOpacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anmationOpacity.fromValue = [NSNumber numberWithFloat:1.0];
    anmationOpacity.toValue = [NSNumber numberWithFloat:0];
    
    //bezierOne
    UIBezierPath *bezierPathOne = [[UIBezierPath alloc] init];
    [bezierPathOne moveToPoint:CGPointMake(self.view.frame.size.width - 60, -50)];
    [bezierPathOne addCurveToPoint:CGPointMake(self.view.frame.size.width, self.view.frame.size.height) controlPoint1:CGPointMake(self.view.frame.size.width-60, 50) controlPoint2:CGPointMake(self.view.frame.size.width - 50, self.view.frame.size.height/3*2)];
    //添加一张图片
    CALayer *picLayer = [self createPicLayerName:@"1@2x.png" starPoint:CGPointMake(self.view.frame.size.width - 60, -50)];
    [self.view.layer addSublayer:picLayer];
    //创建关键帧动画
    CAKeyframeAnimation *animation1 = [self createPositionKeyPath:bezierPathOne];
    [self crateAnimationGroupWithLayer:picLayer animationArray:@[animation1,anmationOpacity]];
    
    //bezierTwo
    UIBezierPath *bezierPathTwo = [[UIBezierPath alloc] init];
    [bezierPathTwo moveToPoint:CGPointMake(self.view.frame.size.width/2, 0)];
    [bezierPathTwo addCurveToPoint:CGPointMake(self.view.frame.size.width/2+20, self.view.frame.size.height-80) controlPoint1:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.width/2) controlPoint2:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.width/2)];
    //添加一张图片
    CALayer *picLayerTwo = [self createPicLayerName:@"2@2x.png" starPoint:CGPointMake(self.view.frame.size.width/2, -50)];
    [self.view.layer addSublayer:picLayerTwo];
    //创建关键帧动画
    CAKeyframeAnimation *animation3 = [self createPositionKeyPath:bezierPathTwo];
    [self crateAnimationGroupWithLayer:picLayerTwo animationArray:@[animation3,anmationOpacity]];
    
    //bezierThree
    UIBezierPath *bezierPathThree = [[UIBezierPath alloc] init];
    [bezierPathThree moveToPoint:CGPointMake(self.view.frame.size.width/2-60, 0)];
    [bezierPathThree addCurveToPoint:CGPointMake(self.view.frame.size.width/2+20, self.view.frame.size.height-80) controlPoint1:CGPointMake(self.view.frame.size.width/2-20, self.view.frame.size.width/2-20) controlPoint2:CGPointMake(self.view.frame.size.height/2, self.view.frame.size.height/2)];
    //添加一张图片
    CALayer *picLayerThree = [self createPicLayerName:@"3@2x.png" starPoint:CGPointMake(self.view.frame.size.width/2-60, -50)];
    [self.view.layer addSublayer:picLayerThree];
    //创建关键帧动画
    CAKeyframeAnimation *animation4 = [self createPositionKeyPath:bezierPathThree];
    [self crateAnimationGroupWithLayer:picLayerThree animationArray:@[animation4,anmationOpacity]];
    
    //bezierFour
    UIBezierPath *bezierPathFour = [[UIBezierPath alloc] init];
    [bezierPathFour moveToPoint:CGPointMake(0, 0)];
    [bezierPathFour addCurveToPoint:CGPointMake(0, self.view.frame.size.height) controlPoint1:CGPointMake(self.view.frame.size.width/2-60, self.view.frame.size.width/2-60) controlPoint2:CGPointMake(self.view.frame.size.height/2-100, self.view.frame.size.height/2-100)];
    //添加一张图片
    CALayer *picLayerFour = [self createPicLayerName:@"4@2x.png" starPoint:CGPointMake(0, -50)];
    [self.view.layer addSublayer:picLayerFour];
    //创建关键帧动画
    CAKeyframeAnimation *animation5 = [self createPositionKeyPath:bezierPathFour];
    [self crateAnimationGroupWithLayer:picLayerFour animationArray:@[animation5,anmationOpacity]];
}

#pragma mark- 创建图片Layer
-(CALayer *)createPicLayerName:(NSString *)name starPoint:(CGPoint) point{
    CALayer *picLayer = [CALayer layer];
    picLayer.frame = CGRectMake(0, 0, 80, 100);
    picLayer.position = point;
    picLayer.contents = (__bridge id)[UIImage imageNamed:name].CGImage;
    return picLayer;
}
#pragma mark-创建关键帧动画
-(CAKeyframeAnimation *)createPositionKeyPath:(UIBezierPath *)path{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.path = path.CGPath;
    return animation;
}
#pragma mark- 创建动画组
-(void)crateAnimationGroupWithLayer:(CALayer *) picLayer animationArray:(NSArray *)animationArray{
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = animationArray;
    groupAnimation.duration = anmationTime;
    groupAnimation.removedOnCompletion = NO;
    groupAnimation.fillMode = kCAFillModeForwards;
    [picLayer addAnimation:groupAnimation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
