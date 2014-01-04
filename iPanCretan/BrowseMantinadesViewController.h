//
//  BrowseMantinadesViewController.h
//  iPanCretan
//
//  Copyright (c) 2013 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: This is the Browse Mantinades view of the Mantinades tab.
//



#import <UIKit/UIKit.h>
#import "CategoryPickerViewController.h"



@interface BrowseMantinadesViewController : UIViewController <CategoryPickerViewControllerDelegate>

//Property for the tableview
@property (weak, nonatomic) IBOutlet UITableView *tblViewMantinades;

//button to select a category and it's press event
- (IBAction)lblMantinadaCategory_Press:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnSelectMantinadaCategory;

//label to display the category
@property (weak, nonatomic) IBOutlet UILabel *lblCategory;
@property (nonatomic, retain) NSString *selectedCategory;

//Array of arrays to hold the plist (initial and filtered)
@property (strong, nonatomic) NSMutableArray *arrListOfMantinadesFiltered;
@property (strong, nonatomic) NSMutableArray *arrListOfMantinades;

//Array for picker values
@property (strong, nonatomic) NSMutableArray *arrCategorySelection;

//the UIView for the category picker
@property (weak, nonatomic) IBOutlet UIView *containerForCategoryPicker;


@end
