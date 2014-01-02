//
//  NHTEditViewController.h
//  NodeHTTPTest
//
//  Created by Alex Egan on 12/31/13.
//  Copyright (c) 2013 AEgan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHTEditViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *messageField;
@property (weak, nonatomic) IBOutlet UITextField *authorField;
@property (weak, nonatomic) NSDictionary *message;
- (IBAction)submitPressed:(id)sender;

@end
