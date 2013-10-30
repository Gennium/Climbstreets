//
//  MenuButton.h
//  ClimbStreets
//
//  Created by 4g on 10/30/13.
//  Copyright (c) 2013 gennium. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuButton : NSObject{
    NSString *nome;
    UIImageView  *imageView;
}

@property (retain, nonatomic) NSString *nome;
@property (retain, nonatomic) UIImageView  *imageView;

-(UIImageView *)MenuButton:(NSString *)_nome WithImage:(UIImage *)_image Rect:(CGRect)rect;
-(void)Click;
@end
