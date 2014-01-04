//
//  MusicianFinderViewController.h
//  iPanCretan
//
//  Copyright (c) 2014 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: This is the musician finder, which allows the user to see which musicians are in US/Canada for a specified start/end date
//



#import <UIKit/UIKit.h>



@interface MusicianFinderViewController : UIViewController

//Press event for the start and end date buttons
- (IBAction)btnSelectStartDate_Press:(id)sender;
- (IBAction)btnSelectEndDate_Press:(id)sender;

//Labels for start and end date
@property (weak, nonatomic) IBOutlet UILabel *lblStartDate;
@property (weak, nonatomic) IBOutlet UILabel *lblEndDate;

//container view for date picker
@property (weak, nonatomic) IBOutlet UIView *viewDatePicker;

//table view for found musicians
@property (weak, nonatomic) IBOutlet UITableView *tblFoundMusicians;

@end
