//
//  ViewController.m
//  GradientDonut
//
//  Created by yoever on 15/12/29.
//  Copyright © 2015年 yoever. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CALayer         *_holderLayer;
    CAShapeLayer    *_shapeLayer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self setup];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timerSchedule) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
    
}
#pragma mark - initial
- (void)setup
{
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.frame = CGRectMake(0, 0, 180, 180);
    _shapeLayer.strokeStart = 0;
    _shapeLayer.strokeEnd = 1;
    _shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
    _shapeLayer.fillColor = [UIColor clearColor].CGColor;
    _shapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 180, 180)].CGPath;
    _shapeLayer.lineWidth = 16;
    _shapeLayer.lineCap = kCALineCapRound;
    
    _holderLayer = [CALayer layer];
    _holderLayer.frame = CGRectMake(0, 0, 200, 200);
    _holderLayer.position = self.view.center;
    _holderLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    
    CAGradientLayer *BLLayer = [CAGradientLayer layer];
    BLLayer.frame = CGRectMake(0, _holderLayer.frame.size.height/2, _holderLayer.frame.size.width/2, _holderLayer.frame.size.height/2);
    CGColorRef BLBeginColor = [UIColor grayColor].CGColor;
    CGColorRef BLEndColor = [UIColor greenColor].CGColor;
    BLLayer.colors = @[(__bridge id)BLBeginColor, (__bridge id)BLEndColor];
    BLLayer.startPoint = CGPointMake(1, 1);
    BLLayer.endPoint = CGPointMake(0.2, 0);
    
    CAGradientLayer *TLLayer = [CAGradientLayer layer];
    TLLayer.frame = CGRectMake(0, 0, _holderLayer.frame.size.width/2, _holderLayer.frame.size.height/2);
    CGColorRef TLBeginColor = [UIColor greenColor].CGColor;
    CGColorRef TLEndColor = [UIColor yellowColor].CGColor;
    TLLayer.colors = @[(__bridge id)TLBeginColor, (__bridge id)TLEndColor];
    TLLayer.startPoint = CGPointMake(0.2, 1);
    TLLayer.endPoint = CGPointMake(1, 0.2);
    
    CAGradientLayer *TRLayer = [CAGradientLayer layer];
    TRLayer.frame = CGRectMake(_holderLayer.frame.size.height/2, 0, _holderLayer.frame.size.width/2, _holderLayer.frame.size.height/2);
    CGColorRef TRBeginColor = [UIColor yellowColor].CGColor;
    CGColorRef TREndColor = [UIColor orangeColor].CGColor;
    TRLayer.colors = @[(__bridge id)TRBeginColor, (__bridge id)TREndColor];
    TRLayer.startPoint = CGPointMake(0, 0.2);
    TRLayer.endPoint = CGPointMake(0.8, 1);
    
    CAGradientLayer *BRLayer = [CAGradientLayer layer];
    BRLayer.frame = CGRectMake(_holderLayer.frame.size.width/2, _holderLayer.frame.size.height/2, _holderLayer.frame.size.width/2, _holderLayer.frame.size.height/2);
    CGColorRef BRBeginColor = [UIColor orangeColor].CGColor;
    CGColorRef BREndColor = [UIColor redColor].CGColor;
    BRLayer.colors = @[(__bridge id)BRBeginColor, (__bridge id)BREndColor];
    BRLayer.startPoint = CGPointMake(0.8, 0);
    BRLayer.endPoint = CGPointMake(0, 1);
    
    [_holderLayer addSublayer:BLLayer];
    [_holderLayer addSublayer:TLLayer];
    [_holderLayer addSublayer:TRLayer];
    [_holderLayer addSublayer:BRLayer];
    
    _shapeLayer.position = CGPointMake(_holderLayer.frame.size.width/2, _holderLayer.frame.size.height/2);
    //周长
    CGFloat perimeter = M_PI * _shapeLayer.frame.size.width;
    //偏移量所占用角度
    CGFloat offsetAngle = (_shapeLayer.lineWidth/2)/perimeter * (2 * M_PI);
    // M_PI/2---从底部开始0
    [_shapeLayer setAffineTransform:CGAffineTransformMakeRotation(M_PI/2 + offsetAngle)];
    [_holderLayer setMask:_shapeLayer];
    
    [self.view.layer addSublayer:_holderLayer];
}
#pragma mark - timer action
- (void)timerSchedule
{
//    CGFloat randomValue = arc4random()%100;
//    _shapeLayer.strokeEnd = randomValue/100;
}
#pragma mark - didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
