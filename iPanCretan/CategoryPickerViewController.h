//
//  CategoryPickerViewController.h
//  iPanCretan
//
//  Copyright (c) 2013 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: This is the UIPickerView for the category picker on the manthinades tab
//



#import <UIKit/UIKit.h>



@class CategoryPickerViewController;

@protocol CategoryPickerViewControllerDelegate <NSObject>
    - (void)addItemViewController:(CategoryPickerViewController *)controller didFinishEnteringItem:(NSString *)categorySelected;
@end



@interface CategoryPickerViewController : UIViewController

//delegate for the category picker
@property (nonatomic, weak) id <CategoryPickerViewControllerDelegate> delegateCategory;

//UIPicker for the category
@property (weak, nonatomic) IBOutlet UIPickerView *pckrCategory;

//Array for picker values
@property (strong, nonatomic) NSMutableArray *arrCategorySelection;

//String for the selected category
@property (strong, nonatomic) NSString *selectedCategory;

//array of mantinades from BrowseMantinadesViewController
@property (strong, nonatomic) NSMutableArray *arrMantinades;

@end
