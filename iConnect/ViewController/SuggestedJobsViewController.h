//
//  SuggestedJobsViewController.h
//  iConnect
//
//  Created by student on 1/23/16.
//  Copyright © 2016 Mallikarjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuggestedJobsViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *suggestedJobsTableView;

@end
