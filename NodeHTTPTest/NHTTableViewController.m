//
//  NHTTableViewController.m
//  NodeHTTPTest
//
//  Created by Alex Egan on 12/19/13.
//  Copyright (c) 2013 AEgan. All rights reserved.
//

#import "NHTTableViewController.h"

@interface NHTTableViewController ()

@end

@implementation NHTTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.title = @"Messages";
        UIBarButtonItem *newMessageItem = [[UIBarButtonItem alloc] initWithTitle:@"Post" style:UIBarButtonItemStyleBordered target:self action:@selector(pushMessageController:)];
        [self.navigationItem setRightBarButtonItem:newMessageItem];
        self.dataArray = [[NSMutableArray alloc] initWithCapacity:4];
        [self.dataArray insertObject:@"San Fransisco" atIndex:0];
        [self.dataArray insertObject:@"Los Angeles" atIndex:1];
        [self.dataArray insertObject:@"San Diego" atIndex:2];
        [self.dataArray insertObject:@"San Jose" atIndex:3];
        NSString *urlStr = @"http://localhost:12345/list";
        NSURL *url = [NSURL URLWithString:urlStr];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPMethod:@"GET"];
        NSError *err1;
        NSData *returnedData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&err1];
        if(err1) {
            UIAlertView *connectionErrorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Error connecting to the server. Make sure it's running" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [connectionErrorAlertView show];
        }
        else {
            NSError *err2;
            NSArray *vals = [NSJSONSerialization JSONObjectWithData:returnedData options:NSJSONReadingMutableContainers error:&err2];
            if(err2) {
                UIAlertView *jsonErrorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Error parsing JSON. Don't really know what to do here lol" delegate:nil cancelButtonTitle:@"I'll check SO" otherButtonTitles:nil];
                [jsonErrorAlertView show];
            }
            else {
                for(int i = 0; i < [vals count]; i++) {
                    NSLog(@"%@", [vals objectAtIndex:i]);
                }
            }
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)pushMessageController:(id)sender {
    NHTMessageViewController *messageView = [[NHTMessageViewController alloc] initWithNibName:@"NHTMessageViewController" bundle:nil];
    [self.navigationController pushViewController:messageView animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    [cell.textLabel setText:[self.dataArray objectAtIndex:[indexPath row]]];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 
 */

@end
