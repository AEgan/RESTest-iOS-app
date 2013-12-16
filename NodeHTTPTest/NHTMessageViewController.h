//
//  NHTMessageViewController.h
//  NodeHTTPTest
//
//  Created by Alex Egan on 12/16/13.
//  Copyright (c) 2013 AEgan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHTMessageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *authorField;
@property (weak, nonatomic) IBOutlet UITextView *messageTextView;
- (IBAction)putRequest:(id)sender;

@end
