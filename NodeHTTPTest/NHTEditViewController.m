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
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    [self.authorField setText:[self.message valueForKey:@"author"]];
    [self.messageField setText:[self.message valueForKey:@"message"]];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismissKeyboard {
    [self.messageField resignFirstResponder];
    [self.authorField resignFirstResponder];
}

- (IBAction)submitPressed:(id)sender {
//    NSString *authorString = [self.authorField text];
//    NSString *messageString = [self.messageField text];
//    NSString *fixedStr = [messageString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
//    NSString *urlStr = [NSString stringWithFormat:@"http://localhost:12345?author=%@&message=%@", authorString, fixedStr];
//    NSURL *url = [NSURL URLWithString:urlStr];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    [request setHTTPMethod:@"POST"];
//    NSError *err1;
//    NSData *returnedData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&err1];
//    if(err1){
//        UIAlertView *connectionAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Unable to connect to API. Check that the server is running" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
//        [connectionAlert show];
//    }
//    else {
//        [self.navigationController popViewControllerAnimated:YES];
//    }
}
@end
