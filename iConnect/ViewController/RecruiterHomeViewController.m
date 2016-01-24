//
//  RecruiterHomeViewController.m
//  iConnect
//
//  Created by student on 1/23/16.
//  Copyright © 2016 Mallikarjun. All rights reserved.
//

#import "RecruiterHomeViewController.h"
#import <Parse/Parse.h>
#import "JobDetailViewController.h"
#import "UserSingleton.h"
#import "RecruiterDetailViewController.h"

@interface RecruiterHomeViewController ()
@property(nonatomic,strong) NSMutableArray *array;
@end

@implementation RecruiterHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.array = [NSMutableArray array];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Jobs"];
    [query whereKey:@"companyId" equalTo:[[UserSingleton instance] userId]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error)
        {
            for (PFObject *object in objects) {
                [self.array addObject:object];
            }
            
            [self.recruiterTableView reloadData];
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecruiterCell"];
    
    
    cell.textLabel.text = object[@"designation"];
    cell.detailTextLabel.text = object[@"companyname"];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    PFObject *object = [self.array objectAtIndex:indexPath.row];
    RecruiterDetailViewController *recruiterDetailViewController = (RecruiterDetailViewController *)[storyboard instantiateViewControllerWithIdentifier:@"RecruiterDetail"];
    recruiterDetailViewController.jobId = object[@"jobid"];
    [self.navigationController pushViewController:recruiterDetailViewController animated:NO];
}

@end
