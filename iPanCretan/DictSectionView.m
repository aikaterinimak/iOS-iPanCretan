//
//  DictSectionView.m
//  iPanCretan
//
//  Copyright (c) 2013 Aikaterini Makridakis. All rights reserved.
//
//  ABOUT: Handles the sections of the collapsible table (Cretan Dictionary)
//


#import "DictSectionView.h"
#import <QuartzCore/QuartzCore.h>



@implementation DictSectionView

//The title of the section (the letter of the alphabet)
@synthesize sectionLetter;

//The section number selected
@synthesize sectionNum;

//Each section header acts as a button; btnSection for current status of the section (open/closed)
@synthesize btnSection;

//Reference to the delegate; informs of user interaction when needed
@synthesize delegate;

//Gradient class to enhance appearance of the section ;D
+ (Class)layerClass {
    return [CAGradientLayer class];
}

//This method assigns tap gesture to view, assigns section num and label to view, customizes the label and button (header of section ~aka letter of the alphabet), & applies gradient to button
- (id)initWithFrame:(CGRect)frame WithTitle: (NSString *) title Section:(NSInteger)sectionNumber delegate: (id <DictSectionView>) Delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //Title of the section must recognize the tap gesture
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(btnSection_Pressed:)];
        [self addGestureRecognizer:tapGesture];
        
        //Enable user interaction so section expands when the user taps it
        self.userInteractionEnabled = YES;
        
        //Assign section number and delegate to the view
        self.sectionNum = sectionNumber;
        self.delegate = Delegate;
        
        //Prepare frame for label
        CGRect LabelFrame = self.bounds;
        LabelFrame.size.width -= 50;
        CGRectInset(LabelFrame, 0.0, 5.0);
        
        //Customize label
        UILabel *label = [[UILabel alloc] initWithFrame:LabelFrame];
        label.text = title;
        label.font = [UIFont boldSystemFontOfSize:16.0];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentLeft;
        
        //Add label to the view
        [self addSubview:label];
        self.sectionLetter = label;
        
        //Again, each section header acts as a button; here we customize the "button" or section header (letter of dict)
        CGRect buttonFrame = CGRectMake(LabelFrame.size.width, 0, 50, LabelFrame.size.height);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = buttonFrame;
        [button setImage:[UIImage imageNamed:@"carat.png"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"carat-open.png"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(btnSection_Pressed:) forControlEvents:UIControlEventTouchUpInside];
        
        //Add "button" to the view
        [self addSubview:button];
        self.btnSection = button;
        
        //Create some nice looking color/gradient effects to enhance appearance
        static NSMutableArray *colors = nil;
        if (colors == nil) {
            colors = [[NSMutableArray alloc] initWithCapacity:3];
            UIColor *color = nil;
            color = [UIColor colorWithRed:0.61 green:0.74 blue:0.78 alpha:1];
            [colors addObject:(id)[color CGColor]];
            color = [UIColor colorWithRed:0.50 green:0.54 blue:0.58 alpha:1];
            [colors addObject:(id)[color CGColor]];
            color = [UIColor colorWithRed:0.15 green:0.20 blue:0.23 alpha:1];
            [colors addObject:(id)[color CGColor]];
        }
        [(CAGradientLayer *)self.layer setColors:colors];
        [(CAGradientLayer *)self.layer setLocations:[NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.48], [NSNumber numberWithFloat:1.0], nil]];
    }
    return self;
}

//Upon user selection of a header (letter of alphabet)
- (void) btnSection_Pressed : (id) sender
{
    //toggle section set true, call toggle method to expand section
    [self btnToggle_Pressed:TRUE];
}

//This method toggles the state of the button (expanded or collapsed)
- (void) btnToggle_Pressed : (BOOL) flag
{
    
    self.btnSection.selected = !self.btnSection.selected;
    
    if(flag)
    {
        //If button is selected, expand; otherwise collapse
        if (self.btnSection.selected)
        {
            if ([self.delegate respondsToSelector:@selector(sectionOpened:)])
            {
                [self.delegate sectionOpened:self.sectionNum];
            }
        }
        else
        {
            if ([self.delegate respondsToSelector:@selector(sectionClosed:)])
            {
                [self.delegate sectionClosed:self.sectionNum];
            }
        }
    }
}

@end