//
//  ElixrFirstViewController.m
//  breakfix_ios
//
//  Created by Trent Poche on 4/26/13.
//  Copyright (c) 2013 Team Breakfix. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "ElixrFirstViewController.h"

@interface ElixrFirstViewController ()

@end

@implementation ElixrFirstViewController

@synthesize currentUser;
@synthesize firstName = _firstName;
@synthesize lastName  = _lastName;
@synthesize email = _email;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.patientNavBar pushNavigationItem:self.navigationItem animated:NO];
}

- (void)initWithPatient:(ElixrUser *)patient
{
    if(patient)
    {
        NSLog(@"ElixrFirstViewController: Valid currentUser found, populating text fields");
        self.textFirstName.text = patient.firstName;
        self.textLastName.text = patient.lastName;
        self.textEmail.text = patient.email;
        self.textUserId.text = [NSString stringWithFormat:@"%@", patient.userID];
        
        // set currentUser variable
        if(!currentUser)
            self.currentUser = patient;
    }
    else
    {
        // report error
        NSLog(@"ElixrFirstViewController: initWithPatient loaded with invalid patient object");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refreshPatientInfo:(id)sender {
    
    // Load the object model via RestKit
    RKObjectManager *objectManager = [RKObjectManager sharedManager];
    
    [objectManager getObjectsAtPath:@"/prototype/users.json"
                   parameters:nil
                   success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult)
                   {
                        NSArray* userArray = [mappingResult array];
                        NSLog(@"Loaded users: %@", userArray);
                       
                        if([userArray count] > 0)
                        {
                            NSLog(@"Array populated with values, setting to text fields now...");
                            ElixrUser *u = userArray[0];
                            self.textFirstName.text = u.firstName;
                            self.textLastName.text  = u.lastName;
                            self.textEmail.text     = u.email;
                            self.textUserId.text    = [NSString stringWithFormat:@"%@", u.userID];
                        }
                    }
                    failure:^(RKObjectRequestOperation *operation, NSError *error)
                    {
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
