//
//  BrowseMantinadesViewController.m
//  iPanCretan
//
//  Copyright (c) 2013 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: This is the Browse Mantinades view of the Mantinades tab; not fully functional**
//



#import "BrowseMantinadesViewController.h"
#import "CategoryPickerViewController.h"
#import "MantinadaCell.h"



@interface BrowseMantinadesViewController ()

@end



@implementation BrowseMantinadesViewController

//array for mantinades from plist
@synthesize arrListOfMantinadesFiltered;
@synthesize arrListOfMantinades;

//UI Items
//tableview, category button, container for category view, and category label
@synthesize tblViewMantinades;
@synthesize btnSelectMantinadaCategory;
@synthesize lblCategory;
@synthesize containerForCategoryPicker;

//string for category
@synthesize selectedCategory;

//array of categories
@synthesize arrCategorySelection;

- (void)viewDidLoad
{
    
    //grab the data for the UI;
    //(later implementation will spawn a background thread, as data will be fetched via RESTful service)
    [self fetchData];
    
    //format table and select category button
    [self formatMantinadesTable];
    
    //Category picker is initially invisible until called forth by the category button
    [self CollapseCategoryPicker:YES];
    
    [super viewDidLoad];
    
}

//For now, data derived from plist; later implementation will involve a webservice call returning a JSON string, to be done in a background thread.
- (void)fetchData
{
    //make sure array in question is empty
    if(arrListOfMantinadesFiltered == nil)
    {
        // find location and type of our plist
        NSString *plistFile = [[NSBundle mainBundle] pathForResource:@"MantinadesList" ofType:@"plist"];
    
        //grab mantinades from plist and put them in the array
        arrListOfMantinades = [NSArray arrayWithContentsOfFile:plistFile];
        arrListOfMantinadesFiltered = arrListOfMantinades;
    }
}

//Various formatting for the mantinades table and the select category button
- (void)formatMantinadesTable
{
    //get rid of the space between cells, I already gave the cells a border in code below
    [self.tblViewMantinades setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    
    //The code bellow is to add a gradient to the Category button:
    // Add Border
    CALayer *layer = btnSelectMantinadaCategory.layer;
    layer.masksToBounds = YES;
    layer.borderWidth = 1.0f;
    layer.borderColor = [UIColor colorWithWhite:0.5f alpha:0.2f].CGColor;
    
    // Add Shine
    CAGradientLayer *shineLayer = [CAGradientLayer layer];
    shineLayer.frame = layer.bounds;
    shineLayer.colors = [NSArray arrayWithObjects:
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:0.75f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:0.4f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         nil];
    shineLayer.locations = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:0.0f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.8f],
                            [NSNumber numberWithFloat:1.0f],
                            nil];
    [layer addSublayer:shineLayer];
    btnSelectMantinadaCategory.titleLabel.textColor = [UIColor whiteColor];    
}

//Method to hide/show the Category Picker
- (void)CollapseCategoryPicker:(BOOL)isCategoryPickerCollapsed {
    
    CGRect newFrame = containerForCategoryPicker.frame;
    
    //if category picker is to be collapsed, set frame to height of zero
    if(isCategoryPickerCollapsed)
    {
        containerForCategoryPicker.hidden=YES;
        //collapse with animation
        newFrame.size.height = 0;
        [UIView animateWithDuration:0.50 animations:^(void){
            containerForCategoryPicker.frame = newFrame;
        }];
    }
    else
    {
        containerForCategoryPicker.hidden=NO;
        
        //expand with animation
        newFrame.size.height = 200;
        [UIView animateWithDuration:0.25 animations:^(void){
            containerForCategoryPicker.frame = newFrame;
        }];
        
        //black border
        containerForCategoryPicker.layer.borderWidth = 2.0f;
        containerForCategoryPicker.layer.borderColor = [UIColor blackColor].CGColor;
        
    }
}

//overload prepareForSegue method to pass mantinada data to the CategoryPickerViewController in the Container
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"ShowCategoryPicker"])
    {
        //make sure arrListOfMantinades is not empty
        if(arrListOfMantinades == nil)
            [self fetchData];
        
        CategoryPickerViewController *theCategoryPicker = (CategoryPickerViewController *)segue.destinationViewController;
        theCategoryPicker.delegateCategory = self;
        theCategoryPicker.arrMantinades = [NSMutableArray arrayWithArray:arrListOfMantinadesFiltered];
    }
}

//delegate method for the category picker view
- (void)addItemViewController:(CategoryPickerViewController*)controller didFinishEnteringItem:(NSString *)categorySelected
{
    //set the label to the category selected by the user
    lblCategory.text = categorySelected;
    
    //save the string for filtering the mantinades after the user dismisses the category picker
    selectedCategory = categorySelected;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Handles the Category button press
- (IBAction)lblMantinadaCategory_Press:(id)sender {
    
    if(containerForCategoryPicker.hidden == NO)
    {
        [self CollapseCategoryPicker:YES];
        [self filterCategories];
    }
    else
        [self CollapseCategoryPicker:NO];
}

- (void)filterCategories {
    
    NSMutableArray *filteredMantinades = [NSMutableArray array];
    
    if([selectedCategory isEqualToString:@"All Categories"])
             arrListOfMantinadesFiltered = arrListOfMantinades;
    else
    {
        for (NSMutableArray *theMantinada in arrListOfMantinades)
        {
            if (theMantinada[2] == selectedCategory)
                [filteredMantinades addObject:theMantinada];
        }
        
        arrListOfMantinadesFiltered = filteredMantinades;
    }
    
    [tblViewMantinades reloadData];
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
    return arrListOfMantinadesFiltered.count;
}

//Add data to cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Indexes for the array holding each mantinada
    NSInteger indexManLine1=0, indexManLine2=1, indexManCategory=2, indexManAuthor=3;
    
    //Create instance of custom cell
    static NSString *CellIdentifier = @"MCell";
    MantinadaCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[MantinadaCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //Add data to cells
    cell.lblMantinadaLine1.text = [[arrListOfMantinadesFiltered objectAtIndex:indexPath.row] objectAtIndex:indexManLine1];
    cell.lblMantinadaLine2.text = [[arrListOfMantinadesFiltered objectAtIndex:indexPath.row] objectAtIndex:indexManLine2];
    cell.lblMantinadaAuthor.text = [[arrListOfMantinadesFiltered objectAtIndex:indexPath.row] objectAtIndex:indexManAuthor];
    cell.lblMantinadaCategory.text = [[arrListOfMantinadesFiltered objectAtIndex:indexPath.row] objectAtIndex:indexManCategory];
    
    //Add border to cells
    [cell.contentView.layer setBorderColor:[UIColor blackColor].CGColor];
    [cell.contentView.layer setBorderWidth:1.5f];
    
    //Do not allow user interaction (there is no reason to select these cells at this time
    [cell setUserInteractionEnabled:NO];
    
    return cell;
}

@end