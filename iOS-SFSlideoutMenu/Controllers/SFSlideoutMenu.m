//
//  SFSlideoutMenu.m
//  iOS-SFSlideoutMenu
//
//  Created by Scott Freschet on 8/2/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import "SFSlideoutMenu.h"

///////////////////////////////////////
#pragma mark - Notification Constants
///////////////////////////////////////
NSString* const NOTIFICATION_SLIDEOUT_SHOW = @"notification_slideout_show";
NSString* const NOTIFICATION_SLIDEOUT_SHOW_DK_SCREENSHOT = @"notification_slideout_show_dk_screenshot";
NSString* const NOTIFICATION_SLIDEOUT_CLOSE_FOR_NEWPAGE = @"notification_slideout_close_for_newpage";
NSString* const NOTIFICATION_SLIDEOUT_CLOSE_FOR_NEWPAGE_DK_SCREENSHOT = @"notification_slideout_close_for_newpage_dk_screenshot";
NSString* const NOTIFICATION_SLIDEOUT_CLOSE_FOR_NEWPAGE_DK_PAGE  = @"notification_slideout_close_for_newpage_dk_page";
NSString* const NOTIFICATION_TRANSITION_TO_NEWPAGE = @"notification_transition_to_newpage";
NSString* const NOTIFICATION_TRANSITION_TO_NEWPAGE_DK_SCREENSHOT = @"notification_transition_to_newpage_dk_screenshot";
NSString* const NOTIFICATION_TRANSITION_TO_NEWPAGE_DK_PAGE  = @"notification_transition_to_newpage_dk_page";
//NSString* const NOTIFICATION_BACK_TRANSITION = @"notification_back_transition";
//NSString* const NOTIFICATION_BACK_TRANSITION_DK_SCREENSHOT = @"notification_back_transition_dk_screenshot";


@interface SFSlideoutMenu ()
@end

@implementation SFSlideoutMenu

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
    
    // Instantiate Variables.
    self.xScreenshotUtils = [[ScreenshotUtils alloc]init];
    
    // Register notification callbacks.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification_Slideout_Show:) name:NOTIFICATION_SLIDEOUT_SHOW object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

///////////////////////////////////////////////////////////////////
#pragma mark - Notification Handlers
///////////////////////////////////////////////////////////////////

-(void)notification_Slideout_Show:(NSNotification*) notification
{
    NSLog(@"notification_Slideout_Show");
    
    // Grab the notification data.
    NSDictionary* data = [notification object];
    
    // Prepare slideOut.
    self.xImageView_Slideout = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.xImageView_Slideout.userInteractionEnabled = YES;
    self.xImageView_Slideout.image = [data objectForKey:NOTIFICATION_SLIDEOUT_SHOW_DK_SCREENSHOT];
    [self.view addSubview:self.xImageView_Slideout];
    
    // Create a UITapGestureRecognizer to detect when the screenshot recieves a single tap
    UITapGestureRecognizer* slideoutTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(slideoutTapped:)];
    [self.xImageView_Slideout addGestureRecognizer:slideoutTap];
    
    // Create a UIPanGestureRecognizer to detect when the screenshot is touched and dragged
    UIPanGestureRecognizer* slideoutPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(slideoutPanGestured:)];
    [slideoutPanGesture setMaximumNumberOfTouches:2];
    [slideoutPanGesture setDelegate:self];
    [self.xImageView_Slideout addGestureRecognizer:slideoutPanGesture];
    
    // Annimate view.
    [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^
     {
         [self.xImageView_Slideout setFrame:CGRectMake(265, 0, self.view.frame.size.width, self.view.frame.size.height)];
     }
                     completion:^(BOOL finished){  }];
}


///////////////////////////////////////////////////////////
#pragma mark - IBAction methods
///////////////////////////////////////////////////////////

-(IBAction)viewController1Tapped:(id)sender
{
    // Transition to appropriate page.
    [self closeSlideOutForNewPage:@"viewController1"];
}

-(IBAction)viewController2Tapped:(id)sender
{
    // Transition to appropriate page.
    [self closeSlideOutForNewPage:@"viewController2"];
}
-(IBAction)viewController3Tapped:(id)sender
{
    // Transition to appropriate page.
    [self closeSlideOutForNewPage:@"viewController3"];
    
}
-(IBAction)viewController4Tapped:(id)sender
{
    // Transition to appropriate page.
    [self closeSlideOutForNewPage:@"viewController4"];
}


/////////////////////////////////////////////////////////
#pragma mark - Helper methods
/////////////////////////////////////////////////////////

- (void)slideoutTapped:(UITapGestureRecognizer *)gestureRecognizer
{
    [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^
     {
         [self.xImageView_Slideout setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
     }
                     completion:^(BOOL finished){
                         [self dismissViewControllerAnimated:NO completion:nil];
                     }];
}
-(void)slideoutPanGestured:(UIPanGestureRecognizer *)gesture;
{
    UIView *piece = [gesture view];
    
    if ([gesture state] == UIGestureRecognizerStateBegan || [gesture state] == UIGestureRecognizerStateChanged)
    {
        CGPoint translation = [gesture translationInView:[piece superview]];
        // I edited this line so that the image view cannont move vertically
        [piece setCenter:CGPointMake([piece center].x + translation.x, [piece center].y)];
        [gesture setTranslation:CGPointZero inView:[piece superview]];
    }
    else if ([gesture state] == UIGestureRecognizerStateEnded)
    {
        
        [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^
         {
             [self.xImageView_Slideout setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
         }
                         completion:^(BOOL finished){
                             [self dismissViewControllerAnimated:NO completion:nil];
                         }];
    }
}

-(void)closeSlideOutForNewPage:(NSString*)newPage
{
    
    // Get screenshot.
    UIImage* screenshot = [self.xScreenshotUtils getScreenshotImage:self];
    
    // Prepare notification with data.
    NSDictionary* data = [[NSDictionary alloc] initWithObjectsAndKeys:
                          screenshot, NOTIFICATION_SLIDEOUT_CLOSE_FOR_NEWPAGE_DK_SCREENSHOT,
                          newPage, NOTIFICATION_SLIDEOUT_CLOSE_FOR_NEWPAGE_DK_PAGE,
                          nil];
        
    [self dismissViewControllerAnimated:NO completion:^
     {
         [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SLIDEOUT_CLOSE_FOR_NEWPAGE object:data];
         
     }];
}

@end
