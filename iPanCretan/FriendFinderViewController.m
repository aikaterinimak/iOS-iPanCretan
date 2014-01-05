//
//  FriendFinderViewController.m
//  iPanCretan
//
//  Copyright (c) 2013 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: This is the friend finder, which allows the user to see who else is in Crete for a specified start/end date
//

#import "FriendFinderViewController.h"
#import "FriendCell.h"

@interface FriendFinderViewController ()

@end

@implementation FriendFinderViewController

@synthesize lblEndDate;
@synthesize lblStartDate;
@synthesize tblViewFoundFriends;
@synthesize viewDatePicker;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	//function in which all UI elements' appearances are tweaked
    [self initializeVisualElements];
}

- (void)initializeVisualElements {
    lblStartDate.layer.borderColor = [UIColor blackColor].CGColor;
    lblStartDate.layer.borderWidth = 2.0;
    lblEndDate.layer.borderColor = [UIColor blackColor].CGColor;
    lblEndDate.layer.borderWidth = 2.0;
    viewDatePicker.layer.borderColor = [UIColor blackColor].CGColor;
    viewDatePicker.layer.borderWidth = 2.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSelectStartDate_Press:(id)sender {
}

- (IBAction)btnSelectEndDate_Press:(id)sender {
}
- (IBAction)btnSearchForFriends_Press:(id)sender {
}

/************************************/
#pragma mark - Table view data source

//Number of sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//Number of rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

//Add data to cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //Create instance of custom cell
    static NSString *CellIdentifier = @"FCell";
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[FriendCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //Add data to cells
    cell.lblFirstLastName.text = @"Katerina Makridakis";
    cell.lblFriendDateStart.text = @"6/12/14";
    cell.lblFriendDateEnd.text = @"8/15/14";
    cell.lblFriendEmail.text = @"aikaterinimak@hotmail.com";
    cell.lblFriendPhone.text = @"330-554-6340";
    cell.imgFriendPic.image = [UIImage imageNamed:@"kate.png"];
    cell.imgFriendPic.contentMode = UIViewContentModeScaleAspectFit;
    
    //Add border to cells
    [cell.contentView.layer setBorderColor:[UIColor blackColor].CGColor];
    [cell.contentView.layer setBorderWidth:1.5f];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    //Do not allow user interaction (there is no reason to select these cells at this time
    [cell setUserInteractionEnabled:NO];
    
    return cell;
}


@end
