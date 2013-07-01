//
//  JoyHubViewController.m
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 6/26/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import "JoyHubViewController.h"

@interface JoyHubViewController ()

@end

@implementation JoyHubViewController

@synthesize joyHubWebViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
// [joyHubWebViewController ShowShopURL];
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
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

- (IBAction)backBtn:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
