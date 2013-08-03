//
//  SFRouter.m
//  iOS-SFSlideoutMenu
//
//  Created by Scott Freschet on 8/2/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import "SFRouter.h"
#import "SFSlideoutMenu.h"

@interface SFRouter ()

@end

@implementation SFRouter

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
    
    
    // Register notification callbacks.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification_Authentication_Passed:) name:NOTIFICATION_AUTHENTICATION_PASSED object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification_Transition_To_NewPage:) name:NOTIFICATION_TRANSITION_TO_NEWPAGE object:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/////////////////////////////////////////////////////////////////////
#pragma mark - Notification Callbacks
/////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////
#pragma mark - Notification Handlers
//////////////////////////////////////////////////////

-(void)notification_Authentication_Passed:(NSNotification*) notification
{    
    // Present viewController1
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController* SFViewController1 = [storyboard instantiateViewControllerWithIdentifier:@"SFViewController1"];
    [self presentViewController:SFViewController1 animated:NO completion:nil];
}

-(void)notification_Transition_To_NewPage:(NSNotification*) notification
{
    // Grab the notification data.
    NSDictionary* data = [notification object];
    NSString* page = [data objectForKey:NOTIFICATION_TRANSITION_TO_NEWPAGE_DK_PAGE];
    UIImage* screenshot = [data objectForKey:NOTIFICATION_TRANSITION_TO_NEWPAGE_DK_SCREENSHOT];
    
    // Prepare notification with data.
    NSDictionary* data2 = [[NSDictionary alloc] initWithObjectsAndKeys:
                           screenshot, NOTIFICATION_SLIDEOUT_CLOSE_FOR_NEWPAGE_DK_SCREENSHOT,
                           page, NOTIFICATION_SLIDEOUT_CLOSE_FOR_NEWPAGE_DK_PAGE,
                           nil];
    
    if ([page isEqualToString:@"viewController1"])
    {
        // Present DA010.
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        UIViewController* SFViewController1 = [storyboard instantiateViewControllerWithIdentifier:@"SFViewController1"];
        [self presentViewController:SFViewController1 animated:NO completion:^
         {
             [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SLIDEOUT_CLOSE_FOR_NEWPAGE object:data2];
         }];
    }
    else if ([page isEqualToString:@"viewController2"])
    {
        // Present DA020.
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        UIViewController* SFViewController2 = [storyboard instantiateViewControllerWithIdentifier:@"SFViewController2"];
        [self presentViewController:SFViewController2 animated:NO completion:^
         {
             [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SLIDEOUT_CLOSE_FOR_NEWPAGE object:data2];
         }];
    }
    else if ([page isEqualToString:@"viewController3"])
    {
        // Present DA030.
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        UIViewController* SFViewController3 = [storyboard instantiateViewControllerWithIdentifier:@"SFViewController3"];
        [self presentViewController:SFViewController3 animated:NO completion:^
         {
             [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SLIDEOUT_CLOSE_FOR_NEWPAGE object:data2];
         }];
    }
    else if ([page isEqualToString:@"viewController4"])
    {
        // Present DA040.
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        UIViewController* SFViewController4 = [storyboard instantiateViewControllerWithIdentifier:@"SFViewController4"];
        [self presentViewController:SFViewController4 animated:NO completion:^
         {
             [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SLIDEOUT_CLOSE_FOR_NEWPAGE object:data2];
         }];
    }
}

@end
