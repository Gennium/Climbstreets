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
#import <QuartzCore/QuartzCore.h>

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
    }
}

-(void)onClickEvent:(NSNotification *) sender{
    if([[sender name] isEqualToString:@"Click"] ){
        MenuButton *b = (MenuButton*)[sender object];
        
        NSString *identifier = [NSString stringWithFormat:@"%@", b.nome];
        
        UIViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
        [self trocaTela:newTopViewController];
    }
}

-(void) trocaTela:(UIViewController *) newTopViewController
{
    UIViewController *TopViewController    = self.slidingViewController.topViewController;
    self.slidingViewController.topViewController= newTopViewController;
    
    
    UIView *from = [TopViewController view];
    UIView *to   = [newTopViewController view];
    [self.view addSubview: from];
    
    CGRect original  = CGRectMake(0, 0, from.frame.size.width, from.frame.size.height);
    CGRect fromFrame = original;
    CGRect toFrame   = original;
    
    fromFrame.origin.y = [UIScreen mainScreen].bounds.size.height;
    toFrame.origin.y   = -[UIScreen mainScreen].bounds.size.height;
    from.layer.zPosition= 2;
    
    to.frame= toFrame;
    
    [UIView animateWithDuration:0.3f delay:0 usingSpringWithDamping:0.8f initialSpringVelocity:3 options:kNilOptions animations:^{
        from.frame= original;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.2f delay:0 usingSpringWithDamping:1.8f initialSpringVelocity:3 options:kNilOptions animations:^{
            to.frame= original;
        } completion:nil];
        [UIView animateWithDuration:1.5f delay:0.1f usingSpringWithDamping:1.8f initialSpringVelocity:3 options:kNilOptions animations:^{
            from.frame= fromFrame;
        } completion:nil];
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
