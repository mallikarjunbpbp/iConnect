//
//  InterfaceController.h
//  iConnect WatchKit Extension
//
//  Created by Mallikarjun Patil on 1/23/16.
//  Copyright © 2016 Mallikarjun. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController

@property(nonatomic) NSMutableArray *jobsArray;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *jobsTableView;


@end
