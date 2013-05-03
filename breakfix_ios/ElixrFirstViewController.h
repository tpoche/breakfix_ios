//
//  ElixrFirstViewController.h
//  breakfix_ios
//
//  Created by Trent Poche on 4/26/13.
//  Copyright (c) 2013 Team Breakfix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ElixrFirstViewController : UIViewController
- (IBAction)refreshPatientInfo:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *tvMessage;
@property (weak, nonatomic) IBOutlet UITextField *textFirstName;
@property (weak, nonatomic) IBOutlet UITextField *textLastName;
@property (weak, nonatomic) IBOutlet UITextField *textEmail;
@property (copy, nonatomic) NSString *firstName;
@property (copy, nonatomic) NSString *lastName;
@property (copy, nonatomic) NSString *email;
@property (weak, nonatomic) IBOutlet UINavigationBar *patientNavBar;

@end
