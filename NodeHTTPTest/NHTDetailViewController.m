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

/*
 * what happenes when you press the delete button
 */
- (IBAction)deletePressed:(id)sender {
    NSString *urlString = [NSString stringWithFormat:@"http://localhost:12345/destroy?id=%@", [self.message objectForKey:@"_id"]];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"DELETE"];
    NSError *err1;
    NSData *returnedData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&err1];
    if(err1) {
        UIAlertView *errorDeleteingAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error deleting this message" delegate:nil cancelButtonTitle:@"damn" otherButtonTitles:nil];
        [errorDeleteingAlertView show];
    }
    else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
