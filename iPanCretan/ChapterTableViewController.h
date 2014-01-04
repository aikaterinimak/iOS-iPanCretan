//
//  ChapterTableViewController.h
//  iPanCretan
//
//  Copyright (c) 2013 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: Tab with a tableview to hold the chapter information: in later implementation, user will
//         be able to click table cell to get to more chapter information.
//



#import <UIKit/UIKit.h>



@interface ChapterTableViewController : UITableViewController

//dictionary to hold the plist
@property (strong, nonatomic) NSDictionary *dictListOfChapters;

//arrays for each item in the plist
@property (strong, nonatomic) NSArray *arrChapterName;
@property (strong, nonatomic) NSArray *arrChapterLocation;
@property (strong, nonatomic) NSArray *arrPresName;
@property (strong, nonatomic) NSArray *arrPresPhone;
@property (strong, nonatomic) NSArray *arrPresEmail;

@end
