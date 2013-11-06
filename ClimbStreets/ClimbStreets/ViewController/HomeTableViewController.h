//
//  HomeTableViewController.h
//  ClimbStreets
//
//  Created by 4g on 11/4/13.
//  Copyright (c) 2013 gennium. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewController : UITableViewController
@property (strong, nonatomic) NSArray *_images;


-(NSString *) getTypeImage;
-(NSString *) getTypeText;
@end
