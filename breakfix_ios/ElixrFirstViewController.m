//
//  ElixrFirstViewController.m
//  breakfix_ios
//
//  Created by Trent Poche on 4/26/13.
//  Copyright (c) 2013 Team Breakfix. All rights reserved.
//

#import "ElixrFirstViewController.h"

@interface ElixrFirstViewController ()

@end

@implementation ElixrFirstViewController

@synthesize firstName = _firstName;
@synthesize lastName  = _lastName;
@synthesize email = _email;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refreshPatientInfo:(id)sender {
}
@end
