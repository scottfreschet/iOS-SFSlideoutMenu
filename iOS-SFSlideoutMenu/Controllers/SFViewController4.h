//
//  SFViewController4.h
//  iOS-SFSlideoutMenu
//
//  Created by Scott Freschet on 8/2/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScreenshotUtils.h"
#import "SFSlideoutMenu.h"

@interface SFViewController4 : UIViewController

// Variables.
@property (strong, nonatomic) ScreenshotUtils* xScreenshotUtils;

// IBOutlets.
@property (strong, nonatomic) UIImageView* xImageView_Screenshot;
@property (strong, nonatomic) IBOutlet UIView* xView_MainView;

@property (strong, nonatomic) IBOutlet UIImageView* xImageView_TopBar;
@property (strong, nonatomic) IBOutlet UIImageView* xImageView_SlideoutButton;
@property (strong, nonatomic) IBOutlet UIGestureRecognizer* xGestureRecognizer_SlideoutButtonTap;

// IBActions.
-(IBAction)slideoutButtonTapped:(id)sender;


@end
