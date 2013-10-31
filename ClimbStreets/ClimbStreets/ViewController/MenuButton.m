//
//  MenuButton.m
//  ClimbStreets
//
//  Created by 4g on 10/30/13.
//  Copyright (c) 2013 gennium. All rights reserved.
//

#import "MenuButton.h"

@implementation MenuButton
@synthesize nome;
@synthesize imageView;

-(UIImageView *)MenuButton:(NSString *)_nome WithImage:(UIImage *)_image Rect:(CGRect)rect {
    nome= _nome;
    
    imageView = [[UIImageView alloc] initWithFrame:rect];
    imageView.image= _image;
    [self setGesture];
    
    return imageView;
}
-(void) setGesture{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Click)];
    tap.numberOfTapsRequired= 1;
    [imageView addGestureRecognizer:tap];
    imageView.userInteractionEnabled= YES;
}
-(void)Click {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Click" object:self];
}
@end
