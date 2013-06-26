//
//  MainViewController.m
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 6/25/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize homeButton, myButton, cameraButton, settingButton, discountButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self) {
        self.navigationItem.title = @"폰케이스 공짜로 주는 앱";
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addCustomElements];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) addCustomElements
{
    /******** Background *********/
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"480x800_tabbar_bg.png"]];
    bgView.frame = CGRectMake(0, 355, 320, 60);
    [self.view addSubview:bgView];
    
    /********** Initialize button image **********/
    UIImage *btnImage;
    UIImage *btnImageSelected;
    
    // homebutton
    btnImage = [UIImage imageNamed:@"480x800_tabbar_btn_setting_home.png"];
    btnImageSelected = [UIImage imageNamed:@"480x800_tabbar_btn_setting_home_on.png"];
    
    self.homeButton = [UIButton buttonWithType:UIButtonTypeCustom]; // setup the button
    self.homeButton.frame = CGRectMake(1, 373, 55, 45); // set the frame (size, position) of button
    [self.homeButton setBackgroundImage:btnImage forState:UIControlStateNormal];
    [self.homeButton setBackgroundImage:btnImageSelected forState:UIControlStateHighlighted];
    [self.homeButton setBackgroundImage:btnImageSelected forState:UIControlStateSelected];
    //[self.homeButton setBackgroundImage:btnImageSelected forState:UIControlStateDisabled];
    [self.homeButton setImage:btnImageSelected forState:(UIControlStateHighlighted|UIControlStateSelected)];
    [self.homeButton setTag:101];
    [self.homeButton setSelected:true]; // set this button selected as default
    
    // mybutton
    btnImage = [UIImage imageNamed:@"480x800_tabbar_btn_my.png"];
    btnImageSelected = [UIImage imageNamed:@"480x800_tabbar_btn_my_on.png"];
    
    self.myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.myButton.frame = CGRectMake(58, 373, 55, 45);
    [self.myButton setBackgroundImage:btnImage forState:UIControlStateNormal];
    [self.myButton setBackgroundImage:btnImageSelected forState:UIControlStateHighlighted];
    [self.myButton setBackgroundImage:btnImageSelected forState:UIControlStateSelected];
    //[self.myButton setBackgroundImage:btnImageSelected forState:UIControlStateDisabled];
    [self.myButton setImage:btnImageSelected forState:(UIControlStateHighlighted|UIControlStateSelected)];
    [self.myButton setTag:102];
    
    // camera button
    btnImage = [UIImage imageNamed:@"480x800_tabbar_btn_setting_인증샷.png"];
    btnImageSelected = [UIImage imageNamed:@"480x800_tabbar_btn_setting_인증샷_on.png"];
    
    self.cameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cameraButton.frame = CGRectMake(58+56, 356, 93, 65);
    [self.cameraButton setBackgroundImage:btnImage forState:UIControlStateNormal];
    [self.cameraButton setBackgroundImage:btnImageSelected forState:UIControlStateHighlighted];
    [self.cameraButton setBackgroundImage:btnImageSelected forState:UIControlStateSelected];
    //[self.myButton setBackgroundImage:btnImageSelected forState:UIControlStateDisabled];
    [self.cameraButton setImage:btnImageSelected forState:(UIControlStateHighlighted|UIControlStateSelected)];
    [self.cameraButton setTag:103];
    
    // setting button
    btnImage = [UIImage imageNamed:@"480x800_tabbar_btn_setting.png"];
    btnImageSelected = [UIImage imageNamed:@"480x800_tabbar_btn_setting_on.png"];
    
    self.settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.settingButton.frame = CGRectMake(210, 373, 55, 45);
    [self.settingButton setBackgroundImage:btnImage forState:UIControlStateNormal];
    [self.settingButton setBackgroundImage:btnImageSelected forState:UIControlStateHighlighted];
    [self.settingButton setBackgroundImage:btnImageSelected forState:UIControlStateSelected];
    //[self.myButton setBackgroundImage:btnImageSelected forState:UIControlStateDisabled];
    [self.settingButton setImage:btnImageSelected forState:(UIControlStateHighlighted|UIControlStateSelected)];
    [self.settingButton setTag:104];
    
    // discount button
    btnImage = [UIImage imageNamed:@"480x800_tabbar_btn_setting_joyhubb.png"];
    btnImageSelected = [UIImage imageNamed:@"480x800_tabbar_btn_setting_joyhubb_on.png"];
    
    self.discountButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.discountButton.frame = CGRectMake(210 + 57, 373, 55, 45);
    [self.discountButton setBackgroundImage:btnImage forState:UIControlStateNormal];
    [self.discountButton setBackgroundImage:btnImageSelected forState:UIControlStateHighlighted];
    [self.discountButton setBackgroundImage:btnImageSelected forState:UIControlStateSelected];
    //[self.myButton setBackgroundImage:btnImageSelected forState:UIControlStateDisabled];
    [self.discountButton setImage:btnImageSelected forState:(UIControlStateHighlighted|UIControlStateSelected)];
    [self.discountButton setTag:105];
    
    /********* add my buttons to new *********/
    [self.view addSubview:homeButton];
    [self.view addSubview:myButton];
    [self.view addSubview:cameraButton];
    [self.view addSubview:settingButton];
    [self.view addSubview:discountButton];
    
    /********* setup event handler so that the buttonClicked method will respond to touch up inside event **********/
    [homeButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [myButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cameraButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [settingButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [discountButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)buttonClicked:(id)sender
{
    int tagNum = [sender tag];
    [self selectTab:tagNum];
}

- (void)selectTab:(int)tabID
{
    switch(tabID)
    {
        case 101:
            [homeButton setSelected:true];
            [myButton setSelected:false];
            [cameraButton setSelected:false];
            [settingButton setSelected:false];
            [discountButton setSelected:false];
            break;
        case 102:
            [homeButton setSelected:false];
            [myButton setSelected:true];
            [cameraButton setSelected:false];
            [settingButton setSelected:false];
            [discountButton setSelected:false];
            break;
        case 103:
            [homeButton setSelected:false];
            [myButton setSelected:false];
            [cameraButton setSelected:true];
            [settingButton setSelected:false];
            [discountButton setSelected:false];
            break;
        case 104:
            [homeButton setSelected:false];
            [myButton setSelected:false];
            [cameraButton setSelected:false];
            [settingButton setSelected:true];
            [discountButton setSelected:false];
            break;
        case 105:
            [homeButton setSelected:false];
            [myButton setSelected:false];
            [cameraButton setSelected:false];
            [settingButton setSelected:false];
            [discountButton setSelected:true];
            break;
    }
}

@end
