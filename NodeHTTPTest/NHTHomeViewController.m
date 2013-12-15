//
//  NHTHomeViewController.m
//  NodeHTTPTest
//
//  Created by Alex Egan on 12/15/13.
//  Copyright (c) 2013 AEgan. All rights reserved.
//

#import "NHTHomeViewController.h"

@interface NHTHomeViewController ()

@end

@implementation NHTHomeViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)makeHTTPRequest:(id)sender {
    NSMutableURLRequest *getRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:12345"]];
    [getRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [getRequest setHTTPMethod:@"GET"];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:getRequest delegate:self];
    if(conn) {
        NSLog(@"good");
    }
    else {
        NSLog(@"bad");
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSString *myString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    [self.dataLabel setText:myString];
}

@end
