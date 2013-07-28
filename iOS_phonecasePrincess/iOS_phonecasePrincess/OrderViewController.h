//
//  OrderViewController.h
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 6/5/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Address.h"

@interface OrderViewController : UIViewController
{
    UITextField *address;
    NSMutableArray *itemList;
    
    NSMutableString *currentValue;
}

@property (nonatomic, retain) IBOutlet UIView *customerInfo;
@property (nonatomic, retain) IBOutlet UIScrollView *orderInfo;

@property (strong, nonatomic) IBOutlet UITextField *address;
@property NSMutableData *data_for_network;
@property (strong, nonatomic) NSMutableArray *itemList;
@property (strong, nonatomic) NSMutableString *currentValue;

- (IBAction)onAddressBtn:(UITextField*)sender;

@end