//
//  AddMantinadaViewController.h
//  iPanCretan
//
//  Copyright (c) 2013 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: This is the Add Mantinades view of the Mantinades tab; not fully functional (obviously)
//



#import <UIKit/UIKit.h>



@interface AddMantinadaViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

//Text Boxes for mantinada line1 and line2 (Note: author derived from user's account credentials
@property (weak, nonatomic) IBOutlet UITextField *txtMantinadaFirstLine;
@property (weak, nonatomic) IBOutlet UITextField *txtMantinadaSecondLine;

//UI Picker for Categiry selection
@property (weak, nonatomic) IBOutlet UIPickerView *pickerChooseCategory;

//Array for picker values
@property (strong, nonatomic) NSArray *arrPickerManCategories;

//Property to grab selected category
@property (strong, nonatomic) NSString *categoryPicked;

//Submitt Button property and action:
@property (weak, nonatomic) IBOutlet UIButton *btnSubmitMantinada;
- (IBAction)btnSubmitMantinada_Press:(id)sender;

@end
