//
//  ViewController.m
//  CoreAnimation-Anchor-Position
//
//  Created by 张晓琪 on 2018/9/11.
//  Copyright © 2018年 张晓琪. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *hourDirection;
@property (weak, nonatomic) IBOutlet UIView *minuteDirection;
@property (weak, nonatomic) IBOutlet UIView *secondDirection;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGPoint center;
    CGFloat hourWidth, minuteWidth, secondWidth, hourHeight, minuteHeight, secondHeight;
    CGFloat widthStep = 2.0, heightStep = 20.0;
    
    center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0, [UIScreen mainScreen].bounds.size.height / 2.0);
    hourWidth = 5;
    minuteWidth = hourWidth + widthStep;
    secondWidth = minuteWidth + widthStep;
    hourHeight = 100;
    minuteHeight = hourHeight + heightStep;
    secondHeight = minuteHeight + heightStep;
    
    self.hourDirection.center = center;
    self.hourDirection.bounds = CGRectMake(0, 0, hourWidth, hourHeight);
    self.hourDirection.layer.anchorPoint = CGPointMake(.5, .95);
    
    self.minuteDirection.center = center;
    self.minuteDirection.bounds = CGRectMake(0, 0, minuteWidth, minuteHeight);
    self.minuteDirection.layer.anchorPoint = CGPointMake(.5, .95);
    
    self.secondDirection.center = center;
    self.secondDirection.bounds = CGRectMake(0, 0, secondWidth, secondHeight);
    self.secondDirection.layer.anchorPoint = CGPointMake(.5, .95);
    
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timing:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)timing:(NSTimer *)timer
{
    static int second = 0;
    static int minute = 0;
    static int hour = 0;
    float secondAngle, minuteAngle, hourAngle;
    
    minute = second / 60.0;
    hour = minute / 60.0;
    
    secondAngle = (second % 60) * 2 * M_PI / 60;
    minuteAngle = (minute % 60) * 2 * M_PI / 60;
    hourAngle = (hour % 12) * 2 * M_PI / 60;
    
    self.secondDirection.transform = CGAffineTransformMakeRotation(secondAngle);
    self.minuteDirection.transform = CGAffineTransformMakeRotation(minuteAngle);
    self.hourDirection.transform = CGAffineTransformMakeRotation(hourAngle);
    
    second++;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
