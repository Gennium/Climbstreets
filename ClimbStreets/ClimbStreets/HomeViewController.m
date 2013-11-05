//
//  HomeViewController.m
//  ClimbStreets
//
//  Created by 4g on 10/30/13.
//  Copyright (c) 2013 gennium. All rights reserved.
//

#import "HomeViewController.h"
#import "ParallaxCell.h"
#import "HomeTableViewController.h"


@interface HomeViewController ()
@end

@implementation HomeViewController{
    HomeTableViewController *homeTableController;
}
@synthesize homeTable;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    homeTableController = [[HomeTableViewController alloc] init];
    
    NSMutableArray *imagesMutable = [[NSMutableArray alloc] init];
	NSArray *imagePaths = [[NSBundle mainBundle] pathsForResourcesOfType:@"jpg" inDirectory:@"Backgrounds"];
	for (NSString *path  in imagePaths) {
		[imagesMutable addObject:[[UIImage alloc] initWithContentsOfFile:path]];
	}
	homeTableController._images = imagesMutable;
    
	[homeTable registerClass:[ParallaxCell class] forCellReuseIdentifier:[homeTableController getTypeImage]];
	[homeTable registerClass:[UITableViewCell class] forCellReuseIdentifier:[homeTableController getTypeText]];
	
	homeTable.rowHeight = 60.0;

    [homeTable setDelegate: homeTableController];
    [homeTable setDataSource:homeTableController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
