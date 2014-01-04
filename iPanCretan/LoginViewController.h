//
//  LoginViewController.h
//  iPanCretan
//
//  Copyright (c) 2013 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: This view controller will handle user login and authentication.  Nothing implemented yet***
//



#import <UIKit/UIKit.h>



@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnFirstTimeLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnForgotUsername;
@property (weak, nonatomic) IBOutlet UIButton *btnForgotPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;


- (IBAction)btnFirstTimeLogin_Press:(id)sender;
- (IBAction)btnForgotUsername_Press:(id)sender;
- (IBAction)btnForgotPassword_Press:(id)sender;
- (IBAction)btnLogin_Press:(id)sender;

@end
