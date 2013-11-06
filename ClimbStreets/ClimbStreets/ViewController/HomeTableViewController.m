//
//  HomeTableViewController.m
//  ClimbStreets
//
//  Created by 4g on 11/4/13.
//  Copyright (c) 2013 gennium. All rights reserved.
//

#import "HomeTableViewController.h"
#import "ParallaxCell.h"

static NSString *ImageCell = @"Image";
static NSString *TextCell = @"Text";

@interface HomeTableViewController ()

@end

@implementation HomeTableViewController
@synthesize _images;


-(NSString *)getTypeImage{
    return ImageCell;
}
-(NSString *) getTypeText{
    return TextCell;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) loadContents {
    //Load images
	
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [_images count]*2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ImageCell forIndexPath:indexPath];
    
    UIImageView *view = [[UIImageView alloc] initWithImage:_images[indexPath.row % [_images count]]];
    
    [self.view addSubview:view];
    
    cell.textLabel.text=  @"Informacao dos Feeds Amigos";
    cell.textLabel.textAlignment= NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor= [UIColor clearColor];
    cell.backgroundView.layer.contentsRect = CGRectMake(0.4, 0.4, 0.6, 0.6);
    cell.backgroundView= view;
    cell.selectionStyle= UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    UITableView *b = (UITableView*)scrollView;
    
    id a = [b indexPathsForVisibleRows];
	for (NSIndexPath *indexPath in a) {
		ParallaxCell *cell = (ParallaxCell *)[b cellForRowAtIndexPath:indexPath];
        
		CGRect cellRect = [b convertRect:[b rectForRowAtIndexPath:indexPath] toView:b.superview];
		cell.offset = cellRect.origin.y;
		cell.totalHeight = b.frame.size.height;
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIImage *i = _images[indexPath.row % [_images count]];
    return i.size.height / i.size.width * [UIScreen mainScreen].bounds.size.width;
}
@end