//
//  LoginViewController.m
//  iPanCretan
//
//  Copyright (c) 2013 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: This view controller will handle user login and authentication.  Nothing implemented yet***
//



#import "LoginViewController.h"



@interface LoginViewController ()

@end



@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

//Dismiss the keyboard
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UIView * txtBox in self.view.subviews){
        if ([txtBox isKindOfClass:[UITextField class]] && [txtBox isFirstResponder]) {
            [txtBox resignFirstResponder];
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnFirstTimeLogin_Press:(id)sender {
    //Dismiss keyboard
    [self.view endEditing:YES];
}

- (IBAction)btnForgotUsername_Press:(id)sender {
    //Dismiss keyboard
    [self.view endEditing:YES];
}

- (IBAction)btnForgotPassword_Press:(id)sender {
    //Dismiss keyboard
    [self.view endEditing:YES];
}

- (IBAction)btnLogin_Press:(id)sender {
    //Dismiss keyboard
    [self.view endEditing:YES];
}
@end
