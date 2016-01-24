//
//  AppliedJobsViewController.m
//  iConnect
//
//  Created by student on 1/23/16.
//  Copyright © 2016 Mallikarjun. All rights reserved.
//

#import "AppliedJobsViewController.h"
#import <Parse/Parse.h>
#import "JobDetailViewController.h"
#import "UserSingleton.h"

@interface AppliedJobsViewController ()
@property(nonatomic,strong) NSMutableArray *array;
@end

@implementation AppliedJobsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
    self.array = [NSMutableArray array];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Candidate"];
    [query whereKey:@"userId" equalTo:[[UserSingleton instance] userId]];
    [query whereKey:@"isapplied" equalTo:[NSNumber numberWithBool:YES]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error)
        {
            
            for (PFObject *object in objects) {
                [self.array addObject:object];
            }
            
            //            dispatch_async(dispatch_get_main_queue(), ^{
            //                [self updateJobs:[NSArray arrayWithArray:sampleArray]];
            //            });
            
            
            [self.appliedJobsTableView reloadData];
        }
        
        else
        {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        
    }];
    
}

-(void)updateJobs:(NSArray *)query
{
    PFQuery *query1 = [PFQuery queryWithClassName:@"Jobs"];
    [query1 whereKey:@"jobid" containedIn:query];
    [query1 findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error)
        {
            for (PFObject *object in objects) {
                [self.array addObject:object];
            }
            
            [self.appliedJobsTableView reloadData];
        }
        
        else
        {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PFObject *object = [self.array objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AppliedJobsCell"];
    
    cell.textLabel.text = object[@"designation"];
    cell.detailTextLabel.text = object[@"companyname"];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    PFObject *object = [self.array objectAtIndex:indexPath.row];
    JobDetailViewController *jobDetailViewController = (JobDetailViewController *)[storyboard instantiateViewControllerWithIdentifier:@"JobDetail"];
    jobDetailViewController.object = object;
    [self.navigationController pushViewController:jobDetailViewController animated:NO];
}

@end
