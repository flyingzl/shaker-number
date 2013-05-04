//
//  FinderUtil.m
//  finder
//
//  Created by zhaolei on 13-3-24.
//  Copyright (c) 2013年 zhaolei. All rights reserved.
//

#import "ShakerUtil.h"

@implementation ShakerUtil

-(id) init{
    
    self = [super init];
    
    if (self) {
        self.userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

-(void)updateMaxNumber:(int)number{
    [self.userDefaults setInteger:number forKey:@"maxNumber"];
    [self.userDefaults synchronize];
}

-(int)getMaxNumber{
    
    return [self.userDefaults integerForKey:@"maxNumber"];
    
}

-(NSTimer *)startTimer: (double)interval target:(id)target  selector:(SEL)selector{
    
    return [NSTimer scheduledTimerWithTimeInterval:interval target:target selector:selector userInfo:nil repeats:YES];
    
}

-(void)stopTimer: (NSTimer *)timer{
    if ([timer isValid]) {
        [timer invalidate];
    }
}

@end
