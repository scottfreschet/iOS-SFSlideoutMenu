//
//  SFLogin.h
//  iOS-SFSlideoutMenu
//
//  Created by Scott Freschet on 8/2/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import <UIKit/UIKit.h>

// Notification Constants
extern NSString* const NOTIFICATION_AUTHENTICATION_PASSED;

@interface SFLogin : UIViewController

// IBOutlets.
@property (strong, nonatomic) IBOutlet UIButton* xButton_Login;

// IBActions.
-(IBAction)loginTapped:(id)sender;


@end
