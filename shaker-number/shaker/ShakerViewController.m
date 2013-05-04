//
//  FinderViewController.m
//  finder
//
//  Created by zhaolei on 13-3-24.
//  Copyright (c) 2013年 zhaolei. All rights reserved.
//

#import "ShakerViewController.h"


@interface ShakerViewController ()

@end

@implementation ShakerViewController


-(ShakerUtil *)findUtil{
    if (!_findUtil) {
        _findUtil = [[ShakerUtil alloc] init];
    }
    return _findUtil;
}


-(void)viewDidAppear:(BOOL)animated{
    
    maxNumber = [self.findUtil getMaxNumber];
    if (maxNumber == 0) {
        maxNumber = 50;
        [self.findUtil updateMaxNumber:50];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"shake" ofType:@"mp3"];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &soundID);
    
}





- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{

    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (motion == UIEventSubtypeMotionShake) {
        [self playSound];
    }
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (motion == UIEventSubtypeMotionShake) {
        [self updateDisplay];
        
        if ([self.timer isValid]) {
            [self.findUtil stopTimer:self.timer];
            self.timer =nil;
        }else{
            // 每隔70ms更新displayLabel一次
            self.timer = [self.findUtil startTimer:0.07 target:self selector:@selector(updateDisplay)];
        }
    }
}

// 必须覆盖，否则UIEventSubtypeMotionShake事件无法响应
-(BOOL)canBecomeFirstResponder{
    return YES;
}

-(void)playSound{
    AudioServicesPlaySystemSound(soundID);
    NSLog(@"playing sound...");
}

-(void) updateDisplay{
    int number = [self getRandomNumber:1 to:maxNumber];
    self.display.text = [NSString stringWithFormat:@"%d",number];
}

// 获取随机数
-(int)getRandomNumber:(int)from to:(int)to{
    return (int)(from + (arc4random() % (to - from + 1)));
}


@end
