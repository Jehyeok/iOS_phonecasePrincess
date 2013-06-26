//
//  MainViewController.h
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 6/25/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
{
    UIButton *homeButton;
    UIButton *myButton;
    UIButton *cameraButton;
    UIButton *settingButton;
    UIButton *discountButton;
}

@property (strong, nonatomic) IBOutlet UIButton *homeButton;
@property (strong, nonatomic) IBOutlet UIButton *myButton;
@property (strong, nonatomic) IBOutlet UIButton *cameraButton;
@property (strong, nonatomic) IBOutlet UIButton *settingButton;
@property (strong, nonatomic) IBOutlet UIButton *discountButton;

- (IBAction)buttonClicked:(UIButton*)sender;

@end
