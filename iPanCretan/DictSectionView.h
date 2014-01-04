//
//  DictSectionView.h
//  iPanCretan
//
//  Copyright (c) 2013 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: Handles the sections of the collapsible table (Cretan Dictionary)
//



#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>



@protocol DictSectionView;



@interface DictSectionView : UIView

//This label is for the letter of the section
@property (nonatomic, retain) UILabel *sectionLetter;

//Each section header acts as a button; btnSection shows the current status of the section (open/closed)
@property (nonatomic, retain) UIButton *btnSection;

//property for the section number selected
@property (nonatomic, assign) NSInteger sectionNum;

//Reference to the delegate; informs of user interaction when needed
@property (nonatomic, weak) id<DictSectionView> delegate;

//populate the selected section with the proper details, passed in as parameters
- (id)initWithFrame:(CGRect)frame WithTitle: (NSString *) title Section:(NSInteger)sectionNumber delegate: (id <DictSectionView>) delegate;

//Methods to handle user interaction with the table
- (void) btnSection_Pressed : (id) sender;
- (void) btnToggle_Pressed : (BOOL) flag;


@end

@protocol DictSectionView <NSObject>

@optional
//Delegate methods indicating when to add/remove rows from the section
- (void) sectionClosed : (NSInteger) section;
- (void) sectionOpened : (NSInteger) section;

@end
