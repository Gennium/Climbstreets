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
	BOOL imageCell = indexPath.row % 2 == 0;
	
	if (imageCell) {
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ImageCell forIndexPath:indexPath];
		
		cell.imageView.image = _images[(indexPath.row / 2) % _images.count];
		return cell;
	} else {
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TextCell forIndexPath:indexPath];
		cell.textLabel.text = @"Text";
		return cell;
	}
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    UITableView *b = (UITableView*)scrollView;
    
    id a = [b indexPathsForVisibleRows];
	for (NSIndexPath *indexPath in a) {
		BOOL imageCell = indexPath.row % 2 == 0;
		if (imageCell) {
			ParallaxCell *cell = (ParallaxCell *)[b cellForRowAtIndexPath:indexPath];
            
			CGRect cellRect = [b convertRect:[b rectForRowAtIndexPath:indexPath] toView:b.superview];
			cell.offset = cellRect.origin.y;
			cell.totalHeight = b.frame.size.height;
		}
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL imageCell = indexPath.row % 2 == 0;
    NSLog(@"%d", indexPath.row);
    if( imageCell ){
        UIImage *i = _images[indexPath.row % [_images count]];
        NSLog(@" WidthOriginal Image= %f --- HeightOriginal = %f ---- Width tela = %f ", i.size.width, i.size.height, [UIScreen mainScreen].bounds.size.width   );
        return i.size.height / i.size.width * [UIScreen mainScreen].bounds.size.width;
    }
    
    return 30.0f;
}
@end