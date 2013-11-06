//
//  GuidebooksViewController.m
//  ClimbStreets
//
//  Created by 4g on 10/30/13.
//  Copyright (c) 2013 gennium. All rights reserved.
//

#import "GuidebooksViewController.h"
#import "UserBO.h"
#import "User.h"
@interface GuidebooksViewController ()

@end

@implementation GuidebooksViewController

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
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)openAreaView{
    [self presentViewController:[
                                 [UIStoryboard storyboardWithName:@"Main" bundle:nil]
                                 instantiateViewControllerWithIdentifier:@"AreaView"] animated:YES completion:nil];
}

@end
