//
//  UserBO.m
//  ClimbStreets
//  Classe contem a regra de negocio do usuario
//  Created by 4g on 11/4/13.
//  Copyright (c) 2013 gennium. All rights reserved.
//

#import "UserBO.h"

@implementation UserBO


-(id)init {
    self =[ super initWithTable:@"User" dataBase:@"user"];
    if(self){
        
    }
    return self;
}


-(User*)loadCurrent{
    
    NSMutableArray *values = [self loadAll];
    
    if([values count] == 0 ){
        [self generateUser];
        values = [self loadAll];
    }
    User *u = [values objectAtIndex:0];
    return u;
}
// isso vai sair....
-(void)generateUser{
    NSEntityDescription * userNew = [self insertNewObjectForEntity];
    [userNew setValue:@"Usuario Teste" forKey:@"name"];
    [userNew setValue: @"121aas5811sdcac" forKey:@"myhash"];
    [self saveEntity];
}

@end
