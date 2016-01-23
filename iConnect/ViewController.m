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
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    
    //    NSString *randomNumber = [NSString stringWithFormat:@"%d",arc4random()%2];
    //
    //    if ([randomNumber isEqualToString:@"0"])
    //    {
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    JobSeekerHomeViewController *jobSeekerHomeViewController = (JobSeekerHomeViewController *)[storyboard instantiateViewControllerWithIdentifier:@"JobSeekerHome"];
    [self.navigationController pushViewController:jobSeekerHomeViewController animated:NO];
    
    //    }
    //    else
    //    {
    //
    //        UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    //
    //        RecruiterHomeViewController *recruiterHomeViewController = (RecruiterHomeViewController *)[storyboard instantiateViewControllerWithIdentifier:@"RecruiterHome"];
    //
    //        [self.navigationController pushViewController:recruiterHomeViewController animated:NO];
    //        
    //    }
}

@end
