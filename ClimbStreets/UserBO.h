//
//  UserBO.h
//  ClimbStreets
//
//  Created by 4g on 11/4/13.
//  Copyright (c) 2013 gennium. All rights reserved.
//

#import "AbstractDAO.h"
#import "User.h"
@interface UserBO : AbstractDAO

-(id)init;
-(User*)loadCurrent;
-(void)generateUser;
@end
