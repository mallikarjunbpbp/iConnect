//
//  RecruiterHomeViewController.h
//  iConnect
//
//  Created by student on 1/23/16.
//  Copyright © 2016 Mallikarjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecruiterHomeViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *recruiterTableView;

@end
