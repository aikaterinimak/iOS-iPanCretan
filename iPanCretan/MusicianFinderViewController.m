//
//  MusicianFinderViewController.m
//  iPanCretan
//
//  Copyright (c) 2014 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: This is the musician finder, which allows the user to see which musicians are in US/Canada for a specified start/end date
//



#import "MusicianFinderViewController.h"
#import "MusicianFinderCell.h"



@interface MusicianFinderViewController ()

@end



@implementation MusicianFinderViewController


@synthesize lblEndDate;
@synthesize lblStartDate;
@synthesize tblFoundMusicians;
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
    static NSString *CellIdentifier = @"MusCell";
    MusicianFinderCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[MusicianFinderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //Add data to cells
    cell.lblMusicianLastFirstName.text = @"Vakakis, Dimitri";
    cell.lblMusicianStartDate.text = @"10/16/14";
    cell.lblMusicianEndDate.text = @"12/3/14";
    cell.lblMusicianEmail.text = @"dvakakis@gmail.com";
    cell.lblMusicianPhone.text = @"555-555-5555";
    cell.imgMusicianPic.image = [UIImage imageNamed:@"dvakakis.png"];
    cell.imgMusicianPic.contentMode = UIViewContentModeScaleAspectFit;
    
    //Add border to cells
    [cell.contentView.layer setBorderColor:[UIColor blackColor].CGColor];
    [cell.contentView.layer setBorderWidth:1.5f];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    //Do not allow user interaction (there is no reason to select these cells at this time
    [cell setUserInteractionEnabled:NO];
    
    return cell;
}

@end
