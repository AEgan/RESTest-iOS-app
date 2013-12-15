//
//  NHTHomeViewController.h
//  NodeHTTPTest
//
//  Created by Alex Egan on 12/15/13.
//  Copyright (c) 2013 AEgan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHTHomeViewController : UIViewController <NSURLConnectionDelegate>
@property (weak, nonatomic) IBOutlet UIButton *makeCallButton;
- (IBAction)makeHTTPRequest:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;

@end
