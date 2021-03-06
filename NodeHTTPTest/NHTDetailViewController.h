//
//  NHTDetailViewController.h
//  NodeHTTPTest
//
//  Created by Alex Egan on 12/30/13.
//  Copyright (c) 2013 AEgan. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "NHTEditViewController.h"

@interface NHTDetailViewController : UIViewController

@property (strong, nonatomic) NSDictionary *message;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
- (IBAction)deletePressed:(id)sender;
-(IBAction)pushMessageController:(id)sender;

@end
