//
//  ScreenshotUtils.m
//  iOS-SFSlideoutMenu
//
//  Created by Scott Freschet on 8/2/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import "ScreenshotUtils.h"

@implementation ScreenshotUtils

-(UIImage*)getScreenshotImage:(UIViewController*)viewController
{
    // Save screenshot.
    CGSize imageSize = viewController.view.bounds.size;
    if (NULL != UIGraphicsBeginImageContextWithOptions)
        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    else
        UIGraphicsBeginImageContext(imageSize);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    [[viewController.view layer] renderInContext:context];
    CGContextRestoreGState(context);
    UIImage *screenShot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return screenShot;
}


@end
