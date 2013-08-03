//
//  SFLogin.m
//  iOS-SFSlideoutMenu
//
//  Created by Scott Freschet on 8/2/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import "SFLogin.h"

///////////////////////////////////////
#pragma mark - Notification Constants
///////////////////////////////////////
NSString* const NOTIFICATION_AUTHENTICATION_PASSED = @"notification_authentication_passed";
NSString* const NOTIFICATION_AUTHENTICATION_PASSED_DK_PAGE = @"notification_authentication_passed_dk_page";


@interface SFLogin ()
@end

@implementation SFLogin

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//////////////////////////////////////////////////////////////////////////
#pragma mark - IBActions
//////////////////////////////////////////////////////////////////////////
-(IBAction)loginTapped:(id)sender
{
    NSLog(@"loginTapped");
    
    // Segue user into the application.
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController* SFRouter = [storyboard instantiateViewControllerWithIdentifier:@"SFRouter"];
    [self presentViewController:SFRouter animated:NO completion:^
     {
         [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_AUTHENTICATION_PASSED object:nil];
     }];
    
    
}

@end
