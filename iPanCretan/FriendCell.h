//
//  FriendCell.h
//  iPanCretan
//
//  Copyright (c) 2013 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: Custom table view cell for the friend finder
//

#import <UIKit/UIKit.h>

@interface FriendCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgFriendPic;
@property (weak, nonatomic) IBOutlet UILabel *lblFirstLastName;
@property (weak, nonatomic) IBOutlet UILabel *lblFriendPhone;
@property (weak, nonatomic) IBOutlet UILabel *lblFriendEmail;

@property (weak, nonatomic) IBOutlet UILabel *lblFriendDateStart;
@property (weak, nonatomic) IBOutlet UILabel *lblFriendDateEnd;

@end
