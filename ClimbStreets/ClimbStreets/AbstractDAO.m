//
//  AbstractDAO.m
//  ClimbStreets
// Classe abstrata contendo a modelagem do banco de dados
//  Created by domacoski on 11/1/13.
//  Copyright (c) 2013 gennium. All rights reserved.
//

#import "AbstractDAO.h"
#import "AppDelegate.h"
@implementation AbstractDAO
@synthesize table;
@synthesize managedObjectModel;
//constructor
-(id)initWithTable:(NSString*)table_{
    if(self){
        self.table = table_;
        self.managedObjectModel = ((AppDelegate*)[[UIApplication sharedApplication]delegate]).managedObjectContext;
    }
    return self;
}
// retorna um NSEntityDescription para insercao no banco de dados
-(NSEntityDescription*)insertNewObjectForEntity{
    return [NSEntityDescription insertNewObjectForEntityForName:self.table
                                         inManagedObjectContext:[self managedObjectModel] ];
}
// retorna um NSEntityDescription para consulta no banco de dados
-(NSEntityDescription*)getEntity{
    return [NSEntityDescription entityForName:self.table
                       inManagedObjectContext:[self managedObjectModel] ];
}
// salva a entidade e em caso de erro de execucao lanca erro, caso nao adiciona, retorna NO;
-(BOOL)saveEntity{
    BOOL isSucess = NO;
    @try {
        NSError *er;
        isSucess = [[self managedObjectModel] save:&er];
        if(er){
            @throw [NSException
                    exceptionWithName:[NSString stringWithFormat:@"error with saved %@ ", self.table]
                    reason:[NSString stringWithFormat:@"Stack: %@ ", [er description]]
                    userInfo:nil];
        }
    }
    @catch (NSException *exception) {
        @throw ; // lancamento implicito...
    }
    return isSucess;
}
// carrega uma lista de todas as entidades da tabela...
-(NSMutableArray*)loadAll{
    NSFetchRequest *request =[[NSFetchRequest alloc]init];
    [request  setEntity:[self getEntity]];
    [request setFetchBatchSize:20];
    NSError *error;
    return[[self.managedObjectModel executeFetchRequest:request error:&error]mutableCopy];
    
}


@end
