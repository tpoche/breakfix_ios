//
//  ElixrTableDataController.m
//  breakfix_ios
//
//  Created by Trent Poche on 4/28/13.
//  Copyright (c) 2013 Team Breakfix. All rights reserved.
//

#import "ElixrTableDataController.h"
#import "ElixrPrescription.h"
#import <RestKit/RestKit.h>

@interface ElixrTableDataController ()

@property (nonatomic, copy, readwrite) NSMutableArray *list;

- (void)createInitialData;

@end

@implementation ElixrTableDataController

@synthesize list;

- (id)init {
    
    if (self = [super init]) {
        [self createInitialData];
    }    
    return self;    
}

// Custom set accessor to ensure the new list is mutable.
- (void)setList:(NSMutableArray *)newList {
    
    if (list != newList) {
        list = [newList mutableCopy];
    }    
}

// Accessor methods for list.
- (unsigned)countOfList {
    
    return [list count];    
}



- (ElixrPrescription *)objectInListAtIndex:(unsigned)theIndex {
    
    return [list objectAtIndex:theIndex];    
}

- (void)createInitialData {
    
    // Load the object model via RestKit
    RKObjectManager *objectManager = [RKObjectManager sharedManager];
    
    [objectManager getObjectsAtPath:@"/prototype/prescriptions.json"
                         parameters:nil
                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                NSArray* scriptArray = [mappingResult array];
                                NSLog(@"Loaded users: %@", scriptArray);
                                
                                if([scriptArray count] > 0) {
                                    NSLog(@"Array populated with values, setting to table data now...");
                                    list = [NSMutableArray arrayWithArray:scriptArray];
                                }
                            }
                            failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                                message:[error localizedDescription]
                                                                               delegate:nil
                                                                      cancelButtonTitle:@"OK"
                                                                      otherButtonTitles:nil];
                                [alert show];
                                NSLog(@"Hit error: %@", error);
                            }];
}

@end
