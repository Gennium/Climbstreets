//
//  ViewController.m
//  ClimbStreets
//
//  Created by 4g on 10/31/13.
//  Copyright (c) 2013 gennium. All rights reserved.
//

#import "ViewController.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"

@interface ViewController ()
@property UIImageView* panArea;
@end

@implementation ViewController
@synthesize panArea;

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
	// Do any additional setup after loading the view.
    
    if( ![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]])
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    
    CGFloat width  = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    panArea = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 5*width/100, height)];
    panArea.userInteractionEnabled= YES;
    
    [panArea addGestureRecognizer:self.slidingViewController.panGesture];
    [self.view addSubview:panArea];
}   

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) Pan:(UIGestureRecognizer *) sender
{
    NSLog(@"Pan");
}
@end
