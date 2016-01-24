//
//  UserDetailViewController.m
//  iConnect
//
//  Created by student on 1/23/16.
//  Copyright © 2016 Mallikarjun. All rights reserved.
//

#import "UserDetailViewController.h"

@interface UserDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *fullName;
@property (weak, nonatomic) IBOutlet UILabel *designation;
@property (weak, nonatomic) IBOutlet UITextView *contactInfo;
@property (weak, nonatomic) IBOutlet UITextView *relatedTags;
@property (weak, nonatomic) IBOutlet UILabel *matchingPercent;

@end

@implementation UserDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.fullName.text = self.object[@"fullname"];
    self.designation.text = self.object[@"designation"];
    self.matchingPercent.text = @"50 %";
    self.contactInfo.text = [NSString stringWithFormat:@"%@\n%@",self.object[@"email"],self.object[@"phone"]];
    
    
//    NSMutableString *tags = [[NSMutableString alloc] init];
//    
//    for (NSString *string in self.object[@"tags"]) {
//        //[tags stringByAppendingString:string];
//        NSLog(@"%@",string);
//    }
    
    self.relatedTags.text = [self.object[@"tags"] componentsJoinedByString:@","];
    
}


-(void)viewDidAppear:(BOOL)animated
{
    [self.contactInfo setScrollEnabled:YES];
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
