//
//  UserSingleton.h
//  iConnect
//
//  Created by student on 1/23/16.
//  Copyright © 2016 Mallikarjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserSingleton : NSObject

@property(nonatomic,strong) NSString *userType;
@property(nonatomic,strong) NSString *userId;
@property(nonatomic,strong) NSString *fullName;
@property(nonatomic,strong) NSString *jobId;
@property(nonatomic,strong) NSArray *userTags;
@property(nonatomic,strong) NSArray *companyTags;
@property(nonatomic,strong) NSString *username;
@property(nonatomic,strong) NSString *email;
@property(nonatomic,strong) NSString *phoneNumber;
@property(nonatomic,strong) NSString *designation;
@property(nonatomic,strong) NSString *companyName;


+(UserSingleton*)instance;

@end
