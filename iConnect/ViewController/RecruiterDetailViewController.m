//
//  RecruiterDetailViewController.m
//  iConnect
//
//  Created by student on 1/23/16.
//  Copyright © 2016 Mallikarjun. All rights reserved.
//

#import "RecruiterDetailViewController.h"
#import "UserDetailViewController.h"

@interface RecruiterDetailViewController ()
@property(nonatomic,strong) NSMutableArray *array;
@property (weak, nonatomic) IBOutlet UITableView *recruiterDetailTableView;
@end

@implementation RecruiterDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
    self.array = [NSMutableArray array];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Candidate"];
    [query whereKey:@"jobid" equalTo:self.jobId];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error)
        {
            
            for (PFObject *object in objects) {
                [self.array addObject:object];
            }
            
            //            dispatch_async(dispatch_get_main_queue(), ^{
            //                [self updateJobs:[NSArray arrayWithArray:sampleArray]];
            //            });
            
            
            [self.recruiterDetailTableView reloadData];
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecruiterDetailCell"];
    
    cell.textLabel.text = object[@"fullname"];
    cell.detailTextLabel.text = object[@"designation"];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    PFObject *object = [self.array objectAtIndex:indexPath.row];
    UserDetailViewController *userDetailViewController = (UserDetailViewController *)[storyboard instantiateViewControllerWithIdentifier:@"UserDetail"];
    userDetailViewController.object = object;
    [self.navigationController pushViewController:userDetailViewController animated:NO];
}


@end
