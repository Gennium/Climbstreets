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
@synthesize dataBase;

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
//constructor
-(id)initWithTable:(NSString*)table_ dataBase:(NSString*)dataBase_{
    if(self){
        self.table = table_;
        self.dataBase = dataBase_;
    }
    return self;
}
// retorna um NSEntityDescription para insercao no banco de dados
-(NSEntityDescription*)insertNewObjectForEntity{
    return [NSEntityDescription insertNewObjectForEntityForName:self.table
                                         inManagedObjectContext:[self managedObjectContext] ];
}
// retorna um NSEntityDescription para consulta no banco de dados
-(NSEntityDescription*)getEntity{
    return [NSEntityDescription entityForName:self.table
                       inManagedObjectContext:[self managedObjectContext] ];
}
// salva a entidade e em caso de erro de execucao lanca erro, caso nao adiciona, retorna NO;
-(BOOL)saveEntity{
    BOOL isSucess = NO;
    @try {
        NSError *er;
        isSucess = [[self managedObjectContext] save:&er];
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
    return[[[self managedObjectContext] executeFetchRequest:request error:&error]mutableCopy];
    
}
// salva o contexto....
- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Lojas" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Lojas.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}



@end
