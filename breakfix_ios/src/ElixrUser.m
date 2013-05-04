//
//  ElixrUser.m
//  breakfix_ios
//
//  Created by Trent Poche on 4/27/13.
//  Copyright (c) 2013 Team Breakfix. All rights reserved.
//

#import "ElixrUser.h"

@implementation ElixrUser

//@synthesize userID;
//@synthesize firstName;
//@synthesize lastName;
//@synthesize email;
//@synthesize salutation;

-(id)initWithName:(NSString *)first last:(NSString *)last email:(NSString *)email
{
    self = [super init];
    if(self)
    {
        _firstName = first;
        _lastName = last;
        _email = email;
        _salutation = @"Sir";
        _userID = [NSNumber numberWithInt: -1];
        return self;
    }
    return nil;
}

@end
