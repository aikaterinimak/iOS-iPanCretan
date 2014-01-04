//
//  DictSectionInfo.m
//  iPanCretan
//
//  Copyright (c) 2013 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: This object is put in place to configure the section views
//



#import "DictSectionInfo.h"



@implementation DictSectionInfo

@synthesize  open;
@synthesize dictSection;
@synthesize definition;
@synthesize rowHeights;

//Initialize and allocate mutable array
- init {
	
	self = [super init];
	if (self) {
		rowHeights = [[NSMutableArray alloc] init];
	}
	return self;
}

//Get number of items in RowHeights
- (NSUInteger)countOfRowHeights {
	return [rowHeights count];
}

//Get a specific item from RowHeights
- (id)objectInRowHeightsAtIndex:(NSUInteger)idx {
	return [rowHeights objectAtIndex:idx];
}

//Insert at a specific index of the rowHeights array
- (void)insertObject:(id)anObject inRowHeightsAtIndex:(NSUInteger)idx {
	[rowHeights insertObject:anObject atIndex:idx];
}

//Insert multiple items into the rowHeights array
- (void)insertRowHeights:(NSArray *)rowHeightArray atIndexes:(NSIndexSet *)indexes {
	[rowHeights insertObjects:rowHeightArray atIndexes:indexes];
}

//Remove from a specific index of the rowHeights array
- (void)removeObjectFromRowHeightsAtIndex:(NSUInteger)idx {
	[rowHeights removeObjectAtIndex:idx];
}

//Remove multiple items from the rowHeights array
- (void)removeRowHeightsAtIndexes:(NSIndexSet *)indexes {
	[rowHeights removeObjectsAtIndexes:indexes];
}

//Replace at a specific index of the rowHeights array
- (void)replaceObjectInRowHeightsAtIndex:(NSUInteger)idx withObject:(id)anObject {
	[rowHeights replaceObjectAtIndex:idx withObject:anObject];
}

//Replace multiple items in the rowHeights array
- (void)replaceRowHeightsAtIndexes:(NSIndexSet *)indexes withRowHeights:(NSArray *)rowHeightArray {
	[rowHeights replaceObjectsAtIndexes:indexes withObjects:rowHeightArray];
}



@end

