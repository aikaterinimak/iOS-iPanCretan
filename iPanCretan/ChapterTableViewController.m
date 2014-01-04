//
//  ChapterTableViewController.m
//  iPanCretan
//
//  Copyright (c) 2013 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: Tab with a tableview to hold the chapter information: in later implementation, user will
//         be able to click table cell to get to more chapter information.
//
//  ***Currently populated with data from YouthChapters.plist; data source will eventually be a JSON string returned from a webservice call
//



#import "ChapterTableViewController.h"
#import "ChapterCell.h"



@interface ChapterTableViewController ()

@end



@implementation ChapterTableViewController

//properties to hold chapter data from the plist (data source to change to JSON returned from webservice call)
@synthesize dictListOfChapters;
@synthesize arrChapterName;
@synthesize arrChapterLocation;
@synthesize arrPresName;
@synthesize arrPresPhone;
@synthesize arrPresEmail;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

//Dispose of any resources that can be recreated when low on memory
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/************************************/
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    //get rid of the extra space between the cells
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    //grab the data for the UI;
    //(later implementation will spawn a background thread, as data will be fetched via RESTful service)
    [self fetchData];
    
    [super viewDidLoad];
}

//For now, data derived from plist; later implementation will involve a webservice call returning a JSON string with any changes to the data, to be done in a background thread.
- (void)fetchData
{
    // find location and type of our plist
    NSString *plistFile = [[NSBundle mainBundle] pathForResource:@"YouthChapters" ofType:@"plist"];
    
    // allocate and assign our plist to the variable we synthesized previously
    dictListOfChapters = [[NSDictionary alloc] initWithContentsOfFile:plistFile];
    
    // access the values in our dictionary/plist using the keys
    arrChapterName = [dictListOfChapters objectForKey:@"Name"];  // getting president's name
    arrChapterLocation = [dictListOfChapters objectForKey:@"Location"]; // getting years in office
    arrPresName = [dictListOfChapters objectForKey:@"ContactName"]; // getting vice president
    arrPresPhone = [dictListOfChapters objectForKey:@"ContactPhone"];  // getting party information
    arrPresEmail = [dictListOfChapters objectForKey:@"ContactEmail"];  // getting party information
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

/************************************/
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrChapterName.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Create instance of custom cell
    static NSString *CellIdentifier = @"Cell";
    ChapterCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[ChapterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //Assign data to custom cell
    cell.lblChapter.text = [arrChapterName objectAtIndex:indexPath.row];
    cell.lblChapterLocation.text = [arrChapterLocation objectAtIndex:indexPath.row];
    cell.lblPresName.text = [arrPresName objectAtIndex:indexPath.row];
    cell.lblPresPhone.text = [arrPresPhone objectAtIndex:indexPath.row];
    cell.lblPresEmail.text = [arrPresEmail objectAtIndex:indexPath.row];
    
    [cell.contentView.layer setBorderColor:[UIColor blackColor].CGColor];
    [cell.contentView.layer setBorderWidth:2.0f];
    
    return cell;
}

//Set title for table header
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return @"PYA Chapters";
//}
//
//Set height for table header
-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return  55.0;
}

//Set view for table header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.frame.size.width,30)];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 20, headerView.frame.size.width-120.0, headerView.frame.size.height)];
    
    //Header properties
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.backgroundColor = [UIColor whiteColor];
    headerLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0.4 alpha:1.0];
    headerLabel.text = @"PYA Chapters";
    headerLabel.font = [UIFont fontWithName:@"ArialMT" size:25.0];
    
    [headerView addSubview:headerLabel];
    
    return headerView;
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
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
