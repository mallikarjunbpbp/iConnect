//
//  DetailInterfaceController.h
//  iConnect
//
//  Created by Mallikarjun Patil on 1/23/16.
//  Copyright © 2016 Mallikarjun. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import <WatchConnectivity/WatchConnectivity.h>

@interface DetailInterfaceController : WKInterfaceController<WCSessionDelegate>
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *designationLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *companyLogo;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *nameLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *tagsLabel;
- (IBAction)saveButtonPressed;

@end
