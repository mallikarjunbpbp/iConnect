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
    
    if ([WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
        NSLog(@"WCSession is supported from the iPhone");
    }

}

- (void) session:(nonnull WCSession *)session didReceiveApplicationContext:(nonnull NSDictionary<NSString *,id> *)applicationContext {
    
    NSLog(@"%@", applicationContext);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"iConnect"
                                                    message:@"Updating Parse database"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [alert show];
    
    //make a parse call to update to saved
    NSString *item1 = [applicationContext objectForKey:@"save"];
    NSLog(@"Response from the app is %@", item1);
}

-(void)viewWillAppear:(BOOL)animated{

    
    
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
