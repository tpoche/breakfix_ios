//
//  ElixrTableViewController.h
//  breakfix_ios
//
//  Created by Trent Poche on 4/28/13.
//  Copyright (c) 2013 Team Breakfix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

@class ElixrPrescription;

@interface ElixrTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *list;
}

@property (nonatomic, copy, readwrite) NSMutableArray *list;

- (void)getPrescriptionInfo;

@end