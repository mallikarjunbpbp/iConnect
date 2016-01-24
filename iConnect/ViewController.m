//
//  ViewController.m
//  iConnect
//
//  Created by Mallikarjun Patil on 1/23/16.
//  Copyright © 2016 Mallikarjun. All rights reserved.
//

#import "ViewController.h"
#import "JobSeekerHomeViewController.h"
#import "RecruiterHomeViewController.h"
#import <Parse/Parse.h>
#import "UserSingleton.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextField *password = (UITextField *)[self.view viewWithTag:102];
    password.secureTextEntry = YES;
}

-(void)viewWillAppear:(BOOL)animated{
    
    
    //    // Request to reload table view data
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:self];
    //
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginBtnPressed:(id)sender {
    
    UITextField *username = (UITextField *)[self.view viewWithTag:101];
    NSString *theUser = username.text;
    UITextField *password = (UITextField *)[self.view viewWithTag:102];
    NSString *thePass = password.text;
    UserSingleton *singleton = [UserSingleton instance];
    
    
    if ((theUser!=nil && ![theUser isEqualToString:@""]) && (thePass!=nil && ![thePass isEqualToString:@""])) {
        [PFUser logInWithUsernameInBackground:theUser password:thePass
                                        block:^(PFUser *user, NSError *error) {
                                            if (user) {
                                                // Do stuff after successful login.
                                                if([user[@"role"] isEqualToString:@"R"])
                                                {
                                                    
                                                    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                                                    
                                                    RecruiterHomeViewController *recruiterHomeViewController = (RecruiterHomeViewController *)[storyboard instantiateViewControllerWithIdentifier:@"RecruiterHome"];
                                                    
                                                    
                                                    [self.navigationController pushViewController:recruiterHomeViewController animated:NO];
                                                }
                                                
                                                else if ([user[@"role"] isEqualToString:@"C"])
                                                {
                                                    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                                                    JobSeekerHomeViewController *jobSeekerHomeViewController = (JobSeekerHomeViewController *)[storyboard instantiateViewControllerWithIdentifier:@"JobSeekerHome"];
                                                    [self.navigationController pushViewController:jobSeekerHomeViewController animated:NO];
                                                }
                                                
                                                [singleton setUsername:user[@"username"]];
                                                [singleton setFullName:user[@"Fullname"]];
                                                [singleton setUserType:user[@"role"]];
                                                [singleton setUserId:user[@"userId"]];
                                                
                                            } else {
                                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                                                [alert show];
                                            }
                                        }];
    }
    
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"One or more fields empty." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
}

@end
