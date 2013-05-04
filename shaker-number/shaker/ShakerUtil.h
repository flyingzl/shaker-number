//
//  FinderUtil.h
//  finder
//
//  Created by zhaolei on 13-3-24.
//  Copyright (c) 2013年 zhaolei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShakerUtil : NSObject

@property (assign) NSUserDefaults *userDefaults;

-(void)updateMaxNumber:(int)number;
-(int)getMaxNumber;

-(NSTimer *)startTimer: (double)interval target:(id)target  selector:(SEL)selector;

-(void)stopTimer:(NSTimer *)timer;

@end
