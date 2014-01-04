//
//  DictDefinition.h
//  iPanCretan
//
//  Copyright (c) 2013 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: Object for a dictionary definition in the CretanDictTableView
//



#import <Foundation/Foundation.h>



@interface DictDefinition : NSObject

//This string describes the specific letter of the alphabet for the dictionary
@property (nonatomic, retain) NSString *dictLetter;
//This is the array of words for the specific letter
@property (nonatomic, retain) NSArray *dictWordsForLetter;

@end
