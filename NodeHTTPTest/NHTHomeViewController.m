//
//  NHTHomeViewController.m
//  NodeHTTPTest
//
//  Created by Alex Egan on 12/15/13.
//  Copyright (c) 2013 AEgan. All rights reserved.
//

#import "NHTHomeViewController.h"
#import "NHTMessageViewController.h"

@interface NHTHomeViewController ()

@end

@implementation NHTHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    UIBarButtonItem *newMessageItem = [[UIBarButtonItem alloc] initWithTitle:@"Post" style:UIBarButtonItemStyleBordered target:self action:@selector(pushMessageController:)];
    [self.navigationItem setRightBarButtonItem:newMessageItem];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitle:@"RESTest"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 * Makes an HTTP get request to my node server and displays the response message in
 * the label on the view. Make sure server is running or you get a rude error message.
 */
- (IBAction)makeHTTPRequest:(id)sender {
    NSMutableURLRequest *getRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:12345/json"]];
    [getRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [getRequest setHTTPMethod:@"GET"];
    NSError *err1;
    NSError *err2;
    NSData *returnData = [NSURLConnection sendSynchronousRequest:getRequest returningResponse:nil error:&err1];
    if(err1) {
        //deal with not getting a response
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error connecting to the server. Make sure it is turned on you idiot" delegate:nil cancelButtonTitle:@"oops lol" otherButtonTitles:nil];
        [alert show];
    }
    else {
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableContainers error:&err2];
        if(err2) {
            // deal with json parsing issues I suppose
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error with the json parsing I think. No idea what to do here lol gl" delegate:nil cancelButtonTitle:@"oops lol" otherButtonTitles:nil];
            [alert show];
        }
        else {
            // update the label
            [self.dataLabel setText:[jsonDictionary valueForKey:@"message"]];
        }
    }
    
}

-(IBAction)pushMessageController:(id)sender {
    NHTMessageViewController *messageView = [[NHTMessageViewController alloc] initWithNibName:@"NHTMessageViewController" bundle:nil];
    [self.navigationController pushViewController:messageView animated:YES];
}

@end
