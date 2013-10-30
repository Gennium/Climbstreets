//
//  MenuViewController.m
//  ClimbStreets
//
//  Created by 4g on 10/30/13.
//  Copyright (c) 2013 gennium. All rights reserved.
//

#import "MenuViewController.h"
#import "ECSlidingViewController.h"
#import "MenuButton.h"

@interface MenuViewController ()
@property  NSArray *menu;
@property  NSMutableArray *buttons;
@end

@implementation MenuViewController
@synthesize menu, buttons;

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
    //self.menu = [NSArray arrayWithObjects:@"Home",@"Find",@"Friends",@"Guidebooks",@"Profile",nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onClickEvent:) name:@"Click" object:nil];
    buttons = [[NSMutableArray alloc] init];
    CGFloat widthScreen = [UIScreen mainScreen].bounds.size.width;
    CGFloat heightScreen = [UIScreen mainScreen].bounds.size.height;
    CGFloat width  = 30*widthScreen/100;

    menu = [NSArray arrayWithObjects:@"Find",@"Friends",@"Guidebooks",@"Profile", nil];

    [self carregaBotoes:width height:heightScreen];
    [self.slidingViewController setAnchorRightRevealAmount:width];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
}

-(void) carregaBotoes:(CGFloat) width  height: (CGFloat)height{
    CGFloat posY = height/ [self.menu count];
    CGFloat _posY = posY - 10;
    
    posY= 35;
    
    for(NSString * b in menu){
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", b]];
        CGRect rect = CGRectMake(0, posY, width, image.size.height/image.size.width*width);
        posY+= _posY;
        MenuButton *button = [[MenuButton alloc] init];
        [self.view addSubview:[button MenuButton:b WithImage:image Rect:rect]];
        [buttons addObject:button];
        NSLog(@"%@ -- %f - %f", b, posY, height);
    }
}

-(void)onClickEvent:(NSNotification *) sender{
    if([[sender name] isEqualToString:@"Click"] ){
        MenuButton *b = (MenuButton*)[sender object];
        
        NSString *identifier = [NSString stringWithFormat:@"%@", b.nome];
        
        UIViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
        
        [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
            CGRect frame = self.slidingViewController.topViewController.view.frame;
            self.slidingViewController.topViewController = newTopViewController;
            self.slidingViewController.topViewController.view.frame = frame;
            [self.slidingViewController resetTopView];
        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
