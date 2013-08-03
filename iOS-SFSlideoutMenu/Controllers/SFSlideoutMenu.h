//
//  SFSlideoutMenu.h
//  iOS-SFSlideoutMenu
//
//  Created by Scott Freschet on 8/2/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScreenshotUtils.h"

// Notification Constants.
extern NSString* const NOTIFICATION_SLIDEOUT_SHOW;
extern NSString* const NOTIFICATION_SLIDEOUT_SHOW_DK_SCREENSHOT;
extern NSString* const NOTIFICATION_SLIDEOUT_CLOSE_FOR_NEWPAGE;
extern NSString* const NOTIFICATION_SLIDEOUT_CLOSE_FOR_NEWPAGE_DK_SCREENSHOT;
extern NSString* const NOTIFICATION_SLIDEOUT_CLOSE_FOR_NEWPAGE_DK_PAGE;
extern NSString* const NOTIFICATION_TRANSITION_TO_NEWPAGE;
extern NSString* const NOTIFICATION_TRANSITION_TO_NEWPAGE_DK_SCREENSHOT;
extern NSString* const NOTIFICATION_TRANSITION_TO_NEWPAGE_DK_PAGE;
//extern NSString* const NOTIFICATION_BACK_TRANSITION;
//extern NSString* const NOTIFICATION_BACK_TRANSITION_DK_SCREENSHOT;


@interface SFSlideoutMenu : UIViewController <UIGestureRecognizerDelegate>

// Data.
@property (strong, nonatomic) ScreenshotUtils* xScreenshotUtils;

// IBOutlets.
@property (strong, nonatomic) IBOutlet UIImageView* xImageView_Slideout;;

@property (strong, nonatomic) IBOutlet UIButton* xButton_ViewController1;
@property (strong, nonatomic) IBOutlet UIButton* xButton_ViewController2;
@property (strong, nonatomic) IBOutlet UIButton* xButton_ViewController3;
@property (strong, nonatomic) IBOutlet UIButton* xButton_ViewController4;


// IBActions.
-(IBAction)viewController1Tapped:(id)sender;
-(IBAction)viewController2Tapped:(id)sender;
-(IBAction)viewController3Tapped:(id)sender;
-(IBAction)viewController4Tapped:(id)sender;


@end
