//
//  CategoryPickerViewController.m
//  iPanCretan
//
//  Copyright (c) 2013 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: This is the UIPickerView for the category picker on the manthinades tab
//



#import "CategoryPickerViewController.h"



@interface CategoryPickerViewController ()

@end



@implementation CategoryPickerViewController

//The array to hold the categories the user may select
@synthesize arrCategorySelection;
@synthesize selectedCategory;
@synthesize arrMantinades;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //function call to grab the categories for the Category Picker
    [self setCategories];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Set the categories the user can choose from
- (void)setCategories {
    
    arrCategorySelection = [[NSMutableArray alloc] init];
    
    //initialize array with catagories
    for(NSArray *theMantinada in arrMantinades)
    {
        [arrCategorySelection addObject:[theMantinada objectAtIndex:2]];
    }
    
    //remove duplicate categories
    NSOrderedSet *setToRemoveDuplicateCategories = [[NSOrderedSet alloc] initWithArray:arrCategorySelection];
    arrCategorySelection = [[NSMutableArray alloc] initWithArray:[setToRemoveDuplicateCategories array]];
    
    //sort in alphabetical order
    [arrCategorySelection sortUsingSelector:@selector(caseInsensitiveCompare:)];
    
    //Add "All" to the list of categories as the first item
    [arrCategorySelection insertObject:@"All Categories" atIndex:0];
}


/*********************************/
#pragma mark -
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
    return arrCategorySelection.count;
}

//return the corresponding caregory
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return arrCategorySelection[row];
}

/*********************************/
#pragma mark -
#pragma mark PickerView Delegate

//Delegate method for the category picker
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //grab the selected category as a string
    //selectedCategory = arrCategorySelection[row];
    [self.delegateCategory addItemViewController:self didFinishEnteringItem:arrCategorySelection[row]];
    
}


@end
