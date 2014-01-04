//
//  CretanDictTableViewController.m
//  iPanCretan
//
//  Copyright (c) 2013 Aikaterini Makridakis. All rights reserved.
//
//
//  ABOUT: Cretan Dictionary for for iPanCretan.
//



#import "CretanDictTableViewController.h"
#import "DictDefinition.h"
#import "DictSectionInfo.h"



@interface CretanDictTableViewController ()

//Index of the open section (letter user has selected)
@property (nonatomic, assign) NSInteger openSectionIndex;
//Array to hold all of the words for all the letters (sections)...this will be an array of DictSection
@property (nonatomic, strong) NSMutableArray *sectionsArray;
//Array to hold all of the letters
@property (nonatomic, strong) NSArray *letterList;

//Helper function to get all the words for the selected letter (section)
- (void) setSectionArray;

@end



//Implementation
@implementation CretanDictTableViewController

@synthesize sectionsArray = _sectionsArray;
@synthesize openSectionIndex;
@synthesize letterList;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

// When low on memory, dispose of any resources that can be recreated.
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/************************************/
#pragma mark - View lifecycle
//On load
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Call method to initialize the array with all the definitions
    [self setSectionArray];
    
    //Table header and footer heigts (footer not visible)
    self.tableView.sectionHeaderHeight = 45;
    self.tableView.sectionFooterHeight = 0;
    
    //Start with no sections of the table open
    self.openSectionIndex = NSNotFound;
    
    //self.navigationItem.rightBarButtonItem =
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//Populates array of words for each letter (section) and adds section to sectionsArray
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //grab the data for the UI;
    //(later implementation will spawn a background thread, as data will be fetched via RESTful service)
    [self fetchData];
    
    //Create image for back button (home screen image)
    UIImage* backImage = [UIImage imageNamed:@"home"];
    
    //Create back button
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:backImage style:UIBarButtonItemStyleBordered target:self action:@selector(Back)];
    
    //add back button to navigation bar
    self.navigationItem.leftBarButtonItem = backButton;
}

//Go back to previous view
- (IBAction)Back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//For now, data derived from plist; later implementation will involve a webservice call returning a JSON string with any changes to the data, to be done in a background thread.
- (void)fetchData
{
    //If array doesn't already exist
    if ((self.sectionsArray == nil)|| ([self.sectionsArray count] != [self numberOfSectionsInTableView:self.tableView]))
    {
        //Array will hold all sections (letters) including words for each letter
        NSMutableArray *arrayForDict = [[NSMutableArray alloc] init];
        
        //Iterate through the DictDefinitions and grab the words for each letter (section) and assign words to proper section
        for (DictDefinition *definition in self.letterList)
        {
            DictSectionInfo *section = [[DictSectionInfo alloc] init];
            section.definition = definition;
            section.open = NO;
            
            //Set height and grab word count for section
            NSNumber *defaultHeight = [NSNumber numberWithInt:44];
            NSInteger wordsCount = [[section.definition dictWordsForLetter] count];
            
            //Add words into section for specific letter
            for (NSInteger i= 0; i < wordsCount; i++)
            {
                [section insertObject:defaultHeight inRowHeightsAtIndex:i];
            }
            
            //Add section to the array for the dictionary
            [arrayForDict addObject:section];
        }
        
        //Grab the array of sections just built
        self.sectionsArray = arrayForDict;
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    //Hide the damn toolbar it's so annoying =/
    [self.navigationController setToolbarHidden:YES animated:NO];
    
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

/************************************/
#pragma mark - Table view data source

// Return the number of sections.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.letterList count];
}

// Return the number of rows in the section.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //grab the selected section
    DictSectionInfo *sectionSelected = [self.sectionsArray objectAtIndex:section];

    //grab the number of words for the letter
    NSInteger rows = [[sectionSelected.definition dictWordsForLetter] count];
    
    return (sectionSelected.open) ? rows : 0;
}

//Create cell for word and definition based on idex given
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //use default cell style
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //grab current word and its definition and assign to cell
    DictDefinition *definition = (DictDefinition *)[self.letterList objectAtIndex:indexPath.section];
    cell.textLabel.text = [definition.dictWordsForLetter objectAtIndex:indexPath.row];
    return cell;
}

//Return the height of the current section
-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
    DictSectionInfo *currentSection = [self.sectionsArray objectAtIndex:indexPath.section];
    return [[currentSection objectInRowHeightsAtIndex:indexPath.row] floatValue];
}

//Initialize the section views if they already don’t exist
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //grab the current section
    DictSectionInfo *currentSection  = [self.sectionsArray objectAtIndex:section];
    
    //if section does not already exist
    if (!currentSection.dictSection)
    {
        //grab the letter of the current section
        NSString *title = currentSection.definition.dictLetter;
        
        //make header for the current section
        currentSection.dictSection = [[DictSectionView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 45) WithTitle:title Section:section delegate:self];
    }
    
    return currentSection.dictSection;
}

/************************************/
#pragma mark - Table view delegate

//for selected section
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//For the closing of a section (called when a different section is selected
- (void) sectionClosed : (NSInteger) section{
    /*
     Create an array of the index paths of the rows in the section that was closed, then delete those rows from the table view.
     */
	DictSectionInfo *sectionInfo = [self.sectionsArray objectAtIndex:section];
	
    sectionInfo.open = NO;
    NSInteger countOfRowsToDelete = [self.tableView numberOfRowsInSection:section];
    
    if (countOfRowsToDelete > 0) {
        NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:section]];
        }
        [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:UITableViewRowAnimationTop];
    }
    self.openSectionIndex = NSNotFound;
}

//Called if the user tries to open a section that is not already opened
- (void) sectionOpened : (NSInteger) section
{
    DictSectionInfo *currentSection = [self.sectionsArray objectAtIndex:section];
    
    currentSection.open = YES;
    //grab count of words in section
    NSInteger count = [currentSection.definition.dictWordsForLetter count];
    
    //insert words and definitions into section
    NSMutableArray *indexPathToInsert = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i<count;i++)
    {
        [indexPathToInsert addObject:[NSIndexPath indexPathForRow:i inSection:section]];
    }
    
    NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
    NSInteger previousOpenIndex = self.openSectionIndex;
    
    //Close previously open section and set button toggle to false, and delete items therein
    if (previousOpenIndex != NSNotFound)
    {
        DictSectionInfo *sectionArray = [self.sectionsArray objectAtIndex:previousOpenIndex];
        sectionArray.open = NO;
        
        NSInteger wordCount = [sectionArray.definition.dictWordsForLetter count];
        
        //toggle to closed
        [sectionArray.dictSection btnToggle_Pressed:FALSE];
        
        //delete words for previously opened section
        for (NSInteger i = 0; i < wordCount; i++)
        {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:previousOpenIndex]];
        }
    }
    
    UITableViewRowAnimation insertAnimation;
    UITableViewRowAnimation deleteAnimation;
    
    
    if (previousOpenIndex == NSNotFound || section < previousOpenIndex)
    {
        insertAnimation = UITableViewRowAnimationTop;
        deleteAnimation = UITableViewRowAnimationBottom;
    }
    else
    {
        insertAnimation = UITableViewRowAnimationBottom;
        deleteAnimation = UITableViewRowAnimationTop;
    }
    
    //update table
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:indexPathToInsert withRowAnimation:insertAnimation];
    [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:deleteAnimation];
    [self.tableView endUpdates];
    
    self.openSectionIndex = section;
    
}

//Populate the array that will hold all the sections
- (void) setSectionArray
{
    //plist is the data source for now...
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"DictionaryList" withExtension:@"plist"];
    
    //get contents of plist as an array of dictionaries
    NSArray *mainArray = [[NSArray alloc] initWithContentsOfURL:url];
    
    //Will hold the sections and their words
    NSMutableArray *definitionArray = [[NSMutableArray alloc] initWithCapacity:[mainArray count]];
    
    //grab letter and its words (definition) for each section
    for (NSDictionary *dictionary in mainArray)
    {
        DictDefinition *definition = [[DictDefinition alloc] init];
        definition.dictLetter = [dictionary objectForKey:@"dictLetter"];
        definition.dictWordsForLetter = [dictionary objectForKey:@"dictWords"];
        [definitionArray addObject:definition];
    }
    
    self.letterList = definitionArray;

}

@end
