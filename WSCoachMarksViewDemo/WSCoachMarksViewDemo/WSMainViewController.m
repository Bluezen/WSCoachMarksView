//
//  WSMainViewController.m
//  WSCoachMarksViewDemo
//
//  Created by Adrien Long on 16/04/2014.
//  Copyright (c) 2014 Adrien Long. All rights reserved.
//

#import "WSMainViewController.h"




@interface WSMainViewController ()

@property (nonatomic, strong) WSCoachMarksView *coachMarksView;

@end



@implementation WSMainViewController

@synthesize coachMarksView=_coachMarksView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self.coachMarksView start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    if (_coachMarksView) {
        [self.coachMarksView willRotateTo:toInterfaceOrientation];
    }
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    
    
    if (_coachMarksView) {
        CGRect frame = (CGRect) {{0.f,0.f}, self.view.bounds.size};
        
        [self.coachMarksView didRotateFrom:fromInterfaceOrientation
                              toCoachMarks:[self coachMarks]
                      inContainerViewFrame:frame];
    }
}

-(WSCoachMarksView *)coachMarksView
{
    if (!_coachMarksView)
    {
        CGRect frame = (CGRect) {{0.f,0.f}, self.view.bounds.size};
        
        _coachMarksView = [[WSCoachMarksView alloc]
                           initWithFrame:frame
                           coachMarks:[self coachMarks]];
        
        _coachMarksView.delegate = self;
        
        [self.view addSubview:_coachMarksView];
    }
    return _coachMarksView;
}

-(NSArray *)coachMarks
{
    return @[
             @{
                 @"rect": [NSValue valueWithCGRect:[self.buttonTop frame]],
                 @"caption": @"This is top button!"
                 },
             @{
                 @"rect": [NSValue valueWithCGRect:[self.buttonBottom frame]],
                 @"caption": @"This is bottom button! (With UIEdgeInsets)"
                 },
             ];
}

- (IBAction)buttonTopTouched:(id)sender
{
    [self.coachMarksView start];
}

- (IBAction)buttonBottomTouched:(id)sender
{
    self.coachMarksView.enableContinueLabel = NO;
    
    [self.coachMarksView start];
}

#pragma mark - WSCoachMarksViewDelegate

- (void)coachMarksView:(WSCoachMarksView*)coachMarksView willNavigateToIndex:(NSUInteger)index
{
    
}

- (void)coachMarksView:(WSCoachMarksView*)coachMarksView didNavigateToIndex:(NSUInteger)index
{
    
}

- (void)coachMarksViewWillCleanup:(WSCoachMarksView*)coachMarksView
{
    
}

- (void)coachMarksViewDidCleanup:(WSCoachMarksView*)coachMarksView
{
    _coachMarksView = nil;
}


@end



