//
//  WSMainViewController.h
//  WSCoachMarksViewDemo
//
//  Created by Adrien Long on 16/04/2014.
//  Copyright (c) 2014 Adrien Long. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WSCoachMarksView.h"

@interface WSMainViewController : UIViewController<WSCoachMarksViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *buttonTop;

@property (weak, nonatomic) IBOutlet UIButton *buttonBottom;

- (IBAction)buttonTopTouched:(id)sender;
- (IBAction)buttonBottomTouched:(id)sender;

@end
