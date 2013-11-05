#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@interface AbstractDAO : NSObject{
    NSString * table;
    NSManagedObjectContext *managedObjectModel;
}
@property(nonatomic, retain) NSString * table;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property(nonatomic, retain) NSManagedObjectContext *managedObjectModel;

-(id)initWithTable:(NSString*)table_;

-(NSEntityDescription*)insertNewObjectForEntity;
-(NSEntityDescription*)getEntity;
-(BOOL)saveEntity;
-(NSMutableArray*)loadAll;
@end