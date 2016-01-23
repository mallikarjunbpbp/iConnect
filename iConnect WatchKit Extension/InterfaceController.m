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
    _jobsArray=[NSMutableArray array];
    [_jobsArray addObject:@"iOS Developer"];
    [_jobsArray addObject:@"Data Science Engr"];
    [_jobsArray addObject:@"Software Engr"];
    [_jobsArray addObject:@"iOS Developer"];
    [_jobsArray addObject:@"Data Science Engr"];
    [_jobsArray addObject:@"Software Engr"];
    [self setupTable];
}

- (void)setupTable
{
    
    [self.jobsTableView setNumberOfRows:_jobsArray.count withRowType:@"jobs"];
    
    for (NSInteger i = 0; i < _jobsTableView.numberOfRows; i++)
    {
        NSObject *row = [_jobsTableView rowControllerAtIndex:i];
        NSString *jobName = _jobsArray[i];
        JobsRow *jobsRow=(JobsRow*)row;
        [jobsRow.designation setText:jobName];
        
    }
    
}

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex
{
    // Push detail view with selected quote
        [self pushControllerWithName:@"DetailInterfaceController" context:nil];
//        [self pushControllerWithName:@"QuoteDetailInterfaceController" context:[self.quotes objectAtIndex:rowIndex]];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



