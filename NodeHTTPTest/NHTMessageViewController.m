//
//  NHTMessageViewController.m
//  NodeHTTPTest
//
//  Created by Alex Egan on 12/16/13.
//  Copyright (c) 2013 AEgan. All rights reserved.
//

#import "NHTMessageViewController.h"

@interface NHTMessageViewController ()

@end

@implementation NHTMessageViewController

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
    // Do any additional setup after loading the view from its nib.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    [self setTitle:@"New Message"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)putRequest:(id)sender {
    NSString *postString = [NSString stringWithFormat:@"%@ says %@", [self.authorField text], [self.messageTextView text]];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Post" message:postString delegate:nil cancelButtonTitle:@"cancelButtonTitle" otherButtonTitles:nil];
    [alert show];
}

-(void)dismissKeyboard {
    [self.messageTextView resignFirstResponder];
    [self.authorField resignFirstResponder];
}
@end
