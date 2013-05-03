//
//  ElixrTableDataController.h
//  breakfix_ios
//
//  Created by Trent Poche on 4/28/13.
//  Copyright (c) 2013 Team Breakfix. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ElixrPrescription;

@interface ElixrTableDataController : UIViewController <UITableViewDataSource>

- (unsigned)countOfList;

- (ElixrPrescription *)objectInListAtIndex:(unsigned)theIndex;

- (void)setList:(NSMutableArray *)newList;

@end
