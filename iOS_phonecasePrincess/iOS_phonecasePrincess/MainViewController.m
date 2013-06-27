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

@synthesize tabBarBgView, contentView;
@synthesize homeButton, myButton, cameraButton, settingButton, discountButton;
@synthesize gridViewController, myOrderListViewController, makeCustomCaseViewController, settingViewController, joyHubViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self) {
        self.navigationItem.title = @"폰케이스 공짜로 주는 앱";
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        
        gridViewController = [[GridViewController alloc] initWithNibName:@"GridViewController" bundle:nil];
        myOrderListViewController = [[MyOrderListViewController alloc] initWithNibName:@"MyOrderListViewController" bundle:nil];
        makeCustomCaseViewController = [[MakeCustomCaseViewController alloc] initWithNibName:@"MakeCustomCaseViewController" bundle:nil];
        settingViewController = [[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:nil];
        joyHubViewController = [[JoyHubViewController alloc] initWithNibName:@"JoyHubViewController" bundle:nil];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.contentView addSubview:gridViewController.view];
    [self.contentView addSubview:myOrderListViewController.view];
    [self.contentView addSubview:makeCustomCaseViewController.view];
    [self.contentView addSubview:settingViewController.view];
    
    // default view : grid view
    myOrderListViewController.view.hidden = YES;
    makeCustomCaseViewController.view.hidden = YES;
    settingViewController.view.hidden = YES;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(UIButton*)sender
{
    self.homeButton.selected = NO;
    self.myButton.selected = NO;
    self.cameraButton.selected = NO;
    self.settingButton.selected = NO;
    self.discountButton.selected = NO;
    
    sender.selected = YES;
    
    if([sender isEqual:self.homeButton])
    {
        gridViewController.view.hidden = NO;
        myOrderListViewController.view.hidden = YES;
        makeCustomCaseViewController.view.hidden = YES;
        settingViewController.view.hidden = YES;
    }
    else if([sender isEqual:self.myButton])
    {
        gridViewController.view.hidden = YES;
        myOrderListViewController.view.hidden = NO;
        makeCustomCaseViewController.view.hidden = YES;
        settingViewController.view.hidden = YES;
    }
    else if([sender isEqual:self.cameraButton])
    {
        gridViewController.view.hidden = YES;
        myOrderListViewController.view.hidden = YES;
        makeCustomCaseViewController.view.hidden = NO;
        settingViewController.view.hidden = YES;
    }
    else if([sender isEqual:self.settingButton])
    {
        gridViewController.view.hidden = YES;
        myOrderListViewController.view.hidden = YES;
        makeCustomCaseViewController.view.hidden = YES;
        settingViewController.view.hidden = NO;
    }
    else if([sender isEqual:self.discountButton])
    {
        [self.navigationController pushViewController:joyHubViewController animated:YES];
    }
}

@end
