//
//  ElixrUser.h
//  breakfix_ios
//
//  Created by Trent Poche on 4/27/13.
//  Copyright (c) 2013 Team Breakfix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ElixrUser : NSObject

@property (nonatomic, copy) NSNumber *userID;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *salutation;
@property (nonatomic, copy) NSString *email;

@end
