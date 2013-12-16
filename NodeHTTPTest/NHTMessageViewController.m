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
    NSString *authorString = [self.authorField text];
    NSString *messageString = [self.messageTextView text];
    NSString *url = [NSString stringWithFormat:@"http://localhost:12345/put?author=%@&message=%@", authorString, messageString];
    NSURL *fullURL = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:fullURL];
    [request setHTTPMethod:@"PUT"];
    NSError *err;
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&err];
    if(err) {
        UIAlertView *err1Alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Error connecting to server, check that it's running pls" delegate:nil cancelButtonTitle:@"Got it" otherButtonTitles:nil];
        [err1Alert show];
    }
    else {
        NSError *err2;
        NSDictionary *jsonDictonary = [NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingAllowFragments error:&err2];
        if(err2) {
            UIAlertView *jsonAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Some JSON error lol god damn it" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [jsonAlert show];
        }
        else {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

-(void)dismissKeyboard {
    [self.messageTextView resignFirstResponder];
    [self.authorField resignFirstResponder];
}
@end
