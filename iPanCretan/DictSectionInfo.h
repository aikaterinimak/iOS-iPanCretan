//
//  DictSectionInfo.h
//  iPanCretan
//
//  Copyright (c) 2013 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: This object is put in place to configure the section views
//



#import <Foundation/Foundation.h>



//Import classes from set of Dictionary Classes
@class DictDefinition;
@class DictSectionView;


@interface DictSectionInfo : NSObject

//Is the section open?
@property (assign) BOOL open;

//Hold specific definition, and the dictionary section (letter of the dictionary)
@property (strong) DictDefinition *definition;
@property (strong) DictSectionView *dictSection;

//array for the heights of the rows in the section
@property (nonatomic,strong,readonly) NSMutableArray *rowHeights;

//Number of items in rowHeights array
- (NSUInteger)countOfRowHeights;
- (id)objectInRowHeightsAtIndex:(NSUInteger)idx;

//Perform insert, remove, replace at a specific index of the rowHeights array
- (void)insertObject:(id)anObject inRowHeightsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromRowHeightsAtIndex:(NSUInteger)idx;
- (void)replaceObjectInRowHeightsAtIndex:(NSUInteger)idx withObject:(id)anObject;

//Perform insert, remove, replace for multiple items in the rowHeights array
- (void)insertRowHeights:(NSArray *)rowHeightArray atIndexes:(NSIndexSet *)indexes;
- (void)removeRowHeightsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceRowHeightsAtIndexes:(NSIndexSet *)indexes withRowHeights:(NSArray *)rowHeightArray;

@end
