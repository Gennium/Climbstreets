//
//  AreaViewController.h
//  ClimbStreets
//
//  Created by 4g on 11/5/13.
//  Copyright (c) 2013 gennium. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface AreaViewController : UIViewController<UITextViewDelegate,UIScrollViewDelegate>{
    IBOutlet UIView * buttonsCanvas;
    IBOutlet UITableView *tableCanvas;
    IBOutlet UIButton *selectSectors;
    IBOutlet UIButton *selectRoutes;
    IBOutlet UITextView *descricao;
    IBOutlet UILabel *areaName;
    IBOutlet UIWebView *photosCanvas;
 
}

-(IBAction)backAction;
-(NSString*)simulateText;
@property(nonatomic, retain)IBOutlet UIView * buttonsCanvas;
@property(nonatomic, retain)IBOutlet UITableView *tableCanvas;
@property(nonatomic, retain)IBOutlet UIButton *selectSectors;
@property(nonatomic, retain)IBOutlet UIButton *selectRoutes;
@property(nonatomic, retain)IBOutlet UITextView *descricao;
@property(nonatomic, retain)IBOutlet UILabel *areaName;
@property(nonatomic, retain)IBOutlet UIWebView *photosCanvas; 
@end
