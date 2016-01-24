//
//  JobDetailViewController.h
//  iConnect
//
//  Created by student on 1/23/16.
//  Copyright © 2016 Mallikarjun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface JobDetailViewController : UIViewController
@property(nonatomic,strong) PFObject *object;

@end
