//
//  SFViewController2.m
//  iOS-SFSlideoutMenu
//
//  Created by Scott Freschet on 8/2/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import "SFViewController2.h"

@interface SFViewController2 ()

@end

@implementation SFViewController2

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
    
    // Initiatlize variables.
    self.xScreenshotUtils = [[ScreenshotUtils alloc]init];
    
    // Setup topBar.
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"SFSlideoutTopBar_View" owner:self options:nil];
    [self.xImageView_TopBar addSubview:[nibs objectAtIndex:0]];
    
    // Register notification callbacks.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification_Slideout_Close_For_NewPage:) name:NOTIFICATION_SLIDEOUT_CLOSE_FOR_NEWPAGE object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

///////////////////////////////////////////////////////////////////
#pragma mark - Notification Handlers
///////////////////////////////////////////////////////////////////

-(void)notification_Slideout_Close_For_NewPage:(NSNotification*) notification
{
    NSLog(@"notification_Slideout_Close_For_NewPage");
    
    // Grab the notification data.
    NSDictionary* data = [notification object];
    NSString* page = [data objectForKey:NOTIFICATION_SLIDEOUT_CLOSE_FOR_NEWPAGE_DK_PAGE];
    NSLog(@"page is: %@", page);
    UIImage* screenshot = [data objectForKey:NOTIFICATION_SLIDEOUT_CLOSE_FOR_NEWPAGE_DK_SCREENSHOT];
    
    // Prepare notification with data.
    NSDictionary* data2 = [[NSDictionary alloc] initWithObjectsAndKeys:
                           screenshot, NOTIFICATION_TRANSITION_TO_NEWPAGE_DK_SCREENSHOT,
                           page, NOTIFICATION_TRANSITION_TO_NEWPAGE_DK_PAGE,
                           nil];
    
    if ([page isEqualToString:@"viewController2"])
    {
        // Setup screenShot.
        self.xImageView_Screenshot = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        self.xImageView_Screenshot.image = [data objectForKey:NOTIFICATION_SLIDEOUT_CLOSE_FOR_NEWPAGE_DK_SCREENSHOT];
        [self.view addSubview:self.xImageView_Screenshot];
        
        // Setup mainView.
        self.xView_MainView.frame = CGRectMake(265, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view bringSubviewToFront:self.xView_MainView];
        
        // Annimate.
        [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^
         {
             [self.xView_MainView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
         }
                         completion:^(BOOL finished){  }];
    }
    else
    {
        [self dismissViewControllerAnimated:NO completion:^
         {
             [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_TRANSITION_TO_NEWPAGE object:data2];
         }];
    }
}

/////////////////////////////////////////////////////////////////////
#pragma mark - IBActions.
/////////////////////////////////////////////////////////////////////

-(IBAction)slideoutButtonTapped:(id)sender
{
    // Get screenshot.
    UIImage* screenshot = [self.xScreenshotUtils getScreenshotImage:self];
    
    // Prepare notification with data.
    NSDictionary* data = [[NSDictionary alloc] initWithObjectsAndKeys:
                          screenshot, NOTIFICATION_SLIDEOUT_SHOW_DK_SCREENSHOT,
                          nil];
    
    // Present SFSlideoutMenu.
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController* SFSlideoutMenu = [storyboard instantiateViewControllerWithIdentifier:@"SFSlideoutMenu"];
    [self presentViewController:SFSlideoutMenu animated:NO completion:^
     {
         [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SLIDEOUT_SHOW object:data];
     }];
}


@end
