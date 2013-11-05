//
//  User.h
//  ClimbStreets
//  Classe representa 
//  Created by 4g on 11/4/13.
//  Copyright (c) 2013 gennium. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSData * photo;
@property (nonatomic, retain) NSString * myhash;

@end
