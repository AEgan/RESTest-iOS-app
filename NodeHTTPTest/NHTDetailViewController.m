//
//  NHTDetailViewController.m
//  NodeHTTPTest
//
//  Created by Alex Egan on 12/30/13.
//  Copyright (c) 2013 AEgan. All rights reserved.
//

#import "NHTDetailViewController.h"

@interface NHTDetailViewController ()

@end

@implementation NHTDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Details";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.authorLabel setText:[self.message objectForKey:@"author"]];
    [self.messageLabel setText:[self.message objectForKey:@"message"]];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
