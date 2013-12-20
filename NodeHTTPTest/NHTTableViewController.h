//
//  NHTTableViewController.h
//  NodeHTTPTest
//
//  Created by Alex Egan on 12/19/13.
//  Copyright (c) 2013 AEgan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NHTMessageViewController.h"

@interface NHTTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *dataArray;

-(IBAction)pushMessageController:(id)sender;

@end
