//
//  DetailInterfaceController.m
//  iConnect
//
//  Created by Mallikarjun Patil on 1/23/16.
//  Copyright © 2016 Mallikarjun. All rights reserved.
//

#import "DetailInterfaceController.h"

@interface DetailInterfaceController ()

@end

@implementation DetailInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    // Set the selected quote
//    self.quote = context;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    [_designationLabel setText:@"Software Engineer"];
//    [_companyLogo setImage:[UIImage imageNamed:@"google"]];
    [_nameLabel setText:@"State Farm"];
    [_tagsLabel setText:@"JAVA iOS Android Python"];
    
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



