//
//  MainViewController.h
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 6/25/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridViewController.h"
#import "MyOrderListViewController.h"
#import "MakeCustomCaseViewController.h"
#import "SettingViewController.h"
#import "JoyHubViewController.h"

@interface MainViewController : UIViewController
{
    UIButton *homeButton;
    UIButton *myButton;
    UIButton *cameraButton;
    UIButton *settingButton;
    UIButton *discountButton;
    
    GridViewController *gridViewController;
    MyOrderListViewController *myOrderListViewController;
    MakeCustomCaseViewController *makeCustomCaseViewController;
    SettingViewController *settingViewController;
    JoyHubViewController *joyHubViewController;
    
    UIView *contentView;
}

@property (strong, nonatomic) GridViewController *gridViewController;
@property (strong, nonatomic) MyOrderListViewController *myOrderListViewController;
@property (strong, nonatomic) MakeCustomCaseViewController *makeCustomCaseViewController;
@property (strong, nonatomic) SettingViewController *settingViewController;
@property (strong, nonatomic) JoyHubViewController *joyHubViewController;

@property (strong, nonatomic) IBOutlet UIButton *homeButton;
@property (strong, nonatomic) IBOutlet UIButton *myButton;
@property (strong, nonatomic) IBOutlet UIButton *cameraButton;
@property (strong, nonatomic) IBOutlet UIButton *settingButton;
@property (strong, nonatomic) IBOutlet UIButton *discountButton;

@property (strong, nonatomic) IBOutlet UIImageView *tabBarBgView;
@property (strong, nonatomic) IBOutlet UIView *contentView;

- (IBAction)buttonClicked:(UIButton*)sender;

@end
