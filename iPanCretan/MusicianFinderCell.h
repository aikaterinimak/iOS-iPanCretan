//
//  MusicianFinderCell.h
//  iPanCretan
//
//  Copyright (c) 2014 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: Custom table view cell for the friend finder
//

#import <UIKit/UIKit.h>

@interface MusicianFinderCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *imgMusicianPic;
@property (weak, nonatomic) IBOutlet UILabel *lblMusicianLastFirstName;
@property (weak, nonatomic) IBOutlet UILabel *lblMusicianPhone;
@property (weak, nonatomic) IBOutlet UILabel *lblMusicianEmail;
@property (weak, nonatomic) IBOutlet UILabel *lblMusicianStartDate;
@property (weak, nonatomic) IBOutlet UILabel *lblMusicianEndDate;


@end
