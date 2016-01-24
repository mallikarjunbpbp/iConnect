//
//  JobDetailViewController.m
//  iConnect
//
//  Created by student on 1/23/16.
//  Copyright © 2016 Mallikarjun. All rights reserved.
//

#import "JobDetailViewController.h"

@interface JobDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *jobTitle;
@property (weak, nonatomic) IBOutlet UILabel *company;
@property (weak, nonatomic) IBOutlet UILabel *matchPercent;
@property (weak, nonatomic) IBOutlet UITextView *jobDescription;
@property (weak, nonatomic) IBOutlet UITextView *relatedTags;

@end

@implementation JobDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
    // Do any additional setup after loading the view.
    self.jobTitle.text = self.object[@"designation"];
    self.company.text = self.object[@"companyname"];
    self.matchPercent.text = @"56 %";
    self.jobDescription.text = self.object[@"Description"];
    self.relatedTags.text = [self.object[@"tags"] componentsJoinedByString:@","];
    
}


-(void)viewDidAppear:(BOOL)animated
{
    [self.jobDescription setScrollEnabled:YES];
    [self.relatedTags setScrollEnabled:YES];
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

@end
