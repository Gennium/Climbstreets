#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@interface AbstractDAO : NSObject{
    NSString * table;
    NSString * dataBase;
}
@property(nonatomic, retain) NSString * table;
@property(nonatomic, retain) NSString * dataBase;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


-(id)initWithTable:(NSString*)table_ dataBase:(NSString*)dataBase_;


-(NSEntityDescription*)insertNewObjectForEntity;
-(NSEntityDescription*)getEntity;
-(BOOL)saveEntity;
-(NSMutableArray*)loadAll;
@end