//
//  FinderViewController.h
//  finder
//
//  Created by zhaolei on 13-3-24.
//  Copyright (c) 2013年 zhaolei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "ShakerUtil.h"

@interface ShakerViewController : UIViewController{
    SystemSoundID                 soundID;
    int maxNumber;
}

@property (weak, nonatomic) IBOutlet UILabel *display;
@property (strong,nonatomic) ShakerUtil *findUtil;
@property (strong,nonatomic) NSTimer *timer;

@end
