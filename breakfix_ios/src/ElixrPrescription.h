//
//  ElixrPrescription.h
//  breakfix_ios
//
//  Created by Trent Poche on 4/27/13.
//  Copyright (c) 2013 Team Breakfix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ElixrSchedule.h"

@interface ElixrPrescription : NSObject

@property (nonatomic, copy) NSNumber *prescriptionId;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *drugName;
@property (nonatomic, copy) NSNumber *dosage;
@property (nonatomic, copy) NSString *specialInfo;
@property (nonatomic, strong) ElixrSchedule *schedule;


@end
