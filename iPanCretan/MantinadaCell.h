//
//  MantinadaCell.h
//  iPanCretan
//
//  Copyright (c) 2013 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: This is a custom cell for displaying the mantinades in the Browse Mantinades tab
//



#import <UIKit/UIKit.h>



@interface MantinadaCell : UITableViewCell

//Cell properties
@property (weak, nonatomic) IBOutlet UILabel *lblMantinadaLine1;
@property (weak, nonatomic) IBOutlet UILabel *lblMantinadaLine2;
@property (weak, nonatomic) IBOutlet UILabel *lblMantinadaAuthor;
@property (weak, nonatomic) IBOutlet UILabel *lblMantinadaCategory;


@end
