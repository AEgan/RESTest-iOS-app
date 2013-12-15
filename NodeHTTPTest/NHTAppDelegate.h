//
//  NHTAppDelegate.h
//  NodeHTTPTest
//
//  Created by Alex Egan on 12/15/13.
//  Copyright (c) 2013 AEgan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NHTHomeViewController.h"

@interface NHTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NHTHomeViewController *homeViewController;

@end
