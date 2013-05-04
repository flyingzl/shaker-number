//
//  ConfigurationViewController.h
//  finder
//
//  Created by zhaolei on 13-3-24.
//  Copyright (c) 2013年 zhaolei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShakerUtil.h"

@interface ConfigurationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *display;

@property (strong,nonatomic) ShakerUtil *findUtil;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end
