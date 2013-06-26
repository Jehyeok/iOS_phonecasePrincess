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

@property (strong, nonatomic) UIButton *homeButton;
@property (strong, nonatomic) UIButton *myButton;
@property (strong, nonatomic) UIButton *cameraButton;
@property (strong, nonatomic) UIButton *settingButton;
@property (strong, nonatomic) UIButton *discountButton;

- (void) addCustomElements;
- (void) selectTab:(int)tabID;

@end
