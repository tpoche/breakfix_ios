//
//  ElixrFirstViewController.h
//  breakfix_ios
//
//  Created by Trent Poche on 4/26/13.
//  Copyright (c) 2013 Team Breakfix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ElixrUser.h"

@interface ElixrFirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *tvMessage;
@property (weak, nonatomic) IBOutlet UITextField *textFirstName;
@property (weak, nonatomic) IBOutlet UITextField *textLastName;
@property (weak, nonatomic) IBOutlet UITextField *textEmail;
@property (weak, nonatomic) IBOutlet UITextField *textUserId;
@property (copy, nonatomic) NSString *firstName;
@property (copy, nonatomic) NSString *lastName;
@property (copy, nonatomic) NSString *email;
@property (strong, nonatomic) ElixrUser *currentUser;
@property (weak, nonatomic) IBOutlet UINavigationBar *patientNavBar;

- (IBAction)refreshPatientInfo:(id)sender;
- (void)initWithPatient:(ElixrUser *)patient;

@end
