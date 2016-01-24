//
//  InterfaceController.m
//  iConnect WatchKit Extension
//
//  Created by Mallikarjun Patil on 1/23/16.
//  Copyright © 2016 Mallikarjun. All rights reserved.
//

#import "InterfaceController.h"
#import "JobsRow.h"

@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    NSArray *keys = @[@"designation", @"companyname",
                      @"logo", @"tags"];
    NSArray *values = @[@"iOS Developer", @"Google", @"googlew", @"iOS Linux Python"];
    NSArray *values2 = @[@"Data Engr", @"Google", @"googlew", @"Hadoop Spark Python"];
    NSArray *values3 = @[@"Software Engr", @"Google", @"googlew", @"node.js JAVA Python"];
    NSArray *values4 = @[@"iOS Developer", @"Google", @"googlew", @"iOS Linux Python"];
    NSArray *values5 = @[@"Data Engr", @"Google", @"googlew", @"Hadoop Spark Python"];
    NSArray *values6 = @[@"Software Engr", @"Google", @"googlew", @"node.js JAVA Python"];
    
    _jobsArray=[NSMutableArray arrayWithObjects:[NSDictionary dictionaryWithObjects:values forKeys:keys],[NSDictionary dictionaryWithObjects:values2 forKeys:keys], [NSDictionary dictionaryWithObjects:values3 forKeys:keys], [NSDictionary dictionaryWithObjects:values4 forKeys:keys], [NSDictionary dictionaryWithObjects:values5 forKeys:keys], [NSDictionary dictionaryWithObjects:values6 forKeys:keys], nil];

    [self setupTable];
}
//
//-(void)handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)localNotification{
//    
//    
//}
//
//-(void)handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)remoteNotification{
//    if ([identifier isEqualToString:@"firstButtonAction"]) {
//        NSLog(@"Save button action caught from the notification view");
//        
////        if ([WCSession isSupported]) {
////            WCSession *session = [WCSession defaultSession];
////            session.delegate = self;
////            [session activateSession];
////            NSLog(@"WCSession is supported");
////            
////            NSError *error;
////            [session updateApplicationContext:@{@"success": @"yes"} error:&error];
////            
////        }
//    }
//}

- (void)setupTable
{
    
    [self.jobsTableView setNumberOfRows:_jobsArray.count withRowType:@"jobs"];
    
    for (NSInteger i = 0; i < _jobsTableView.numberOfRows; i++)
    {
        NSObject *row = [_jobsTableView rowControllerAtIndex:i];
        NSString *jobName = [[_jobsArray objectAtIndex:i] objectForKey:@"designation"];
        JobsRow *jobsRow=(JobsRow*)row;
        [jobsRow.designation setText:jobName];
        
        
    }
    
}

-(id)contextForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex{
    return  [_jobsArray objectAtIndex:rowIndex];
}

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex
{
    // Push detail view with selected quote
    [self pushControllerWithName:@"DetailInterfaceController" context:[_jobsArray objectAtIndex:rowIndex]];
    //        [self pushControllerWithName:@"QuoteDetailInterfaceController" context:[self.quotes objectAtIndex:rowIndex]];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



