//
//  ScreenshotUtils.h
//  iOS-SFSlideoutMenu
//
//  Created by Scott Freschet on 8/2/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface ScreenshotUtils : NSObject

-(UIImage*)getScreenshotImage:(UIViewController*)viewController;

@end
