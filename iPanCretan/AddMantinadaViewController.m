//
//  AddMantinadaViewController.m
//  iPanCretan
//
//  Copyright (c) 2013 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: This is the Add Mantinades view of the Mantinades tab; not fully functional (obviously)
//



#import "AddMantinadaViewController.h"
#import "DatePickerViewController.h"



@interface AddMantinadaViewController ()

@end



@implementation AddMantinadaViewController

@synthesize pickerChooseCategory;
@synthesize categoryPicked;
@synthesize arrPickerManCategories;

@synthesize txtMantinadaFirstLine;
@synthesize txtMantinadaSecondLine;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //function call to grab the categories for the Category Picker
    [self setCategories];
}

//Dismiss the keyboard
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UIView * txtBox in self.view.subviews){
        if ([txtBox isKindOfClass:[UITextField class]] && [txtBox isFirstResponder]) {
            [txtBox resignFirstResponder];
        }
    }
}

//Submitt button press
- (IBAction)btnSubmitMantinada_Press:(id)sender {
    //create JSON string, call webservice to post data, form logic around WS response
}

//Set the categories the user can choose from (haven't decided whether or not to allow user to enter a new category...)
- (void)setCategories {
    //initialize array with catagories
    arrPickerManCategories = @[@"Agaph", @"Kriti", @"Ksenuxtia", @"Xorw"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*********************************/
#pragma mark PickerView DataSource

//Below are the functions for the UIPicker:

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}

//count of categories array denotes how many elements the picker will have
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return arrPickerManCategories.count;
}

//return the corresponding caregory
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return arrPickerManCategories[row];
}

/*********************************/
#pragma mark PickerView Delegate

//Delegate method for the category picker
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //grab the selected category as a string
    categoryPicked = arrPickerManCategories[row];
}

@end
