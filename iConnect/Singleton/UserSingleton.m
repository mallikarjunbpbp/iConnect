//
//  UserSingleton.m
//  iConnect
//
//  Created by student on 1/23/16.
//  Copyright © 2016 Mallikarjun. All rights reserved.
//

#import "UserSingleton.h"

@implementation UserSingleton

-(id)initSingleton {
    if(self =[super init]) {
        self.userType=nil;
        self.userId=nil;
        self.fullName=nil;
        self.jobId=nil;
        self.userTags=nil;
        self.companyTags=nil;
        self.username=nil;
        self.email=nil;
        self.phoneNumber=nil;
        self.designation=nil;
        self.companyName=nil;
    }
    return self;
}

+(UserSingleton*)instance {
    // Persistent instance.
    static UserSingleton *_default = nil;
    
    // Small optimization to avoid wasting time after the
    // singleton being initialized.
    if (_default != nil)
    {
        return _default;
    }
    
    // Allocates once with Grand Central Dispatch (GCD) routine.
    // It's thread safe.
    static dispatch_once_t safer;
    dispatch_once(&safer, ^(void)
                  {
                      _default = [[UserSingleton alloc] initSingleton];
                  });
    
    return _default;
}


@end
