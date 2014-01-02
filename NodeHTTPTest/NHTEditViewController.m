//
//  NHTEditViewController.m
//  NodeHTTPTest
//
//  Created by Alex Egan on 12/31/13.
//  Copyright (c) 2013 AEgan. All rights reserved.
//

#import "NHTEditViewController.h"

@interface NHTEditViewController ()

@end

@implementation NHTEditViewController

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
    self.title = @"Editing Message";
    [self.authorField setText:[self.message valueForKey:@"author"]];
    [self.messageField setText:[self.message valueForKey:@"message"]];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitPressed:(id)sender {
}
@end
