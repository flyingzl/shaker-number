//
//  ConfigurationViewController.m
//  finder
//
//  Created by zhaolei on 13-3-24.
//  Copyright (c) 2013年 zhaolei. All rights reserved.
//

#import "ConfigurationViewController.h"

@interface ConfigurationViewController ()

@end

@implementation ConfigurationViewController
@synthesize slider;
@synthesize display;


-(ShakerUtil *)findUtil{
    if (!_findUtil) {
        _findUtil = [[ShakerUtil alloc] init];
    }
    return _findUtil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int maxValue = [self.findUtil getMaxNumber];
    self.slider.value = maxValue;
    [self update:maxValue];
    
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setDisplay:nil];
    [self setSlider:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)slideChanged:(UISlider *)sender {
    int value = [sender value];
    [self update:value];
}


-(void) update: (int)value{
    
    [self.findUtil updateMaxNumber:value];
    self.display.text = [NSString stringWithFormat:@"%d",value ];
    
}

@end
