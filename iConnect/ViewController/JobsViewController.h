//
//  JobsViewController.h
//  iConnect
//
//  Created by student on 1/23/16.
//  Copyright © 2016 Mallikarjun. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol UpdateJobsForCandidateDelegate
//
//-(void)updateJobs:(NSArray *)query;
//
//@end

@interface JobsViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *jobsTableView;
//@property (nonatomic, assign) id<UpdateJobsForCandidateDelegate>delegate;

@end
