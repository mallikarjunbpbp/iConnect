//
//  DetailInterfaceController.m
//  iConnect
//
//  Created by Mallikarjun Patil on 1/23/16.
//  Copyright © 2016 Mallikarjun. All rights reserved.
//

#import "DetailInterfaceController.h"

@interface DetailInterfaceController ()
@property(nonatomic, weak)     NSDictionary *dict;
@end

@implementation DetailInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    // Set the selected quote
//    self.quote = context;
    _dict=context;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    [_designationLabel setText:[_dict objectForKey:@"designation"]];
//    [_companyLogo setImage:[UIImage imageNamed:[_dict objectForKey:@"logo"]]];
    [_nameLabel setText:[_dict objectForKey:@"companyname"]];
    [_tagsLabel setText:[_dict objectForKey:@"tags"]];
    
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)saveButtonPressed {
    
    if ([WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
        NSLog(@"WCSession is supported from the watch");
        
        NSError *error;
        [session updateApplicationContext:_dict error:&error];
        
        
    }
    
}
@end



