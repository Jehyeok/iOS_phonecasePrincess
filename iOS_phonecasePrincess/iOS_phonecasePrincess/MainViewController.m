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
}

@end
