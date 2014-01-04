//
//  ChapterCell.h
//  iPanCretan
//
//  Copyright (c) 2013 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: A custom table cell for the chapters tab
//



#import <UIKit/UIKit.h>



@interface ChapterCell : UITableViewCell

//Properties of the custom cell for the chapters table view in chapters tab
@property (weak, nonatomic) IBOutlet UILabel *lblChapter;
@property (weak, nonatomic) IBOutlet UILabel *lblChapterLocation;
@property (weak, nonatomic) IBOutlet UILabel *lblPresName;
@property (weak, nonatomic) IBOutlet UILabel *lblPresPhone;
@property (weak, nonatomic) IBOutlet UILabel *lblPresEmail;

@end
