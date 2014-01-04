//
//  FriendFinderViewController.h
//  iPanCretan
//
//  Copyright (c) 2013 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: This is the friend finder, which allows the user to see who else is in Crete for a specified start/end date
//



#import <UIKit/UIKit.h>



@interface FriendFinderViewController : UIViewController

//Press events for the start/end date selection buttons
- (IBAction)btnSelectStartDate_Press:(id)sender;
- (IBAction)btnSelectEndDate_Press:(id)sender;

//labels for the start and end date
@property (weak, nonatomic) IBOutlet UILabel *lblStartDate;
@property (weak, nonatomic) IBOutlet UILabel *lblEndDate;

//Button and press event for Search for Friends button
- (IBAction)btnSearchForFriends_Press:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnSearchForFriends;

//container for the UIDatePicker
@property (weak, nonatomic) IBOutlet UIView *viewDatePicker;

//the friends the search has returned
@property (weak, nonatomic) IBOutlet UITableView *tblViewFoundFriends;

@end
