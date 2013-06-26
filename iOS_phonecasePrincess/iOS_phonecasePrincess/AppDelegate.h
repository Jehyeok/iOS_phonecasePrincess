//
//  AppDelegate.h
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 5/24/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//@property (strong, nonatomic) ViewController *viewController;

@property (strong, nonatomic) MainViewController *mainViewController;

@property (strong, nonatomic) UINavigationController *navController;

@end
