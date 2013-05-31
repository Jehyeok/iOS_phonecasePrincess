//
//  ViewController.h
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 5/24/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>
{
    CGFloat _lastScale;
    CGFloat _firstX;
    CGFloat _firstY;
    
    UIImageView *photoImageView;
    UIImageView *tappedImageView;
    UIView *canvas;
    UIView *subCanvas;
    
    CAShapeLayer *_marque;
}

@property (nonatomic, retain) IBOutlet UIView *canvas;
@property (nonatomic, retain) IBOutlet UIView *subCanvas;
@property (nonatomic, retain) IBOutlet UIImageView *photoImageView;
@property (nonatomic, retain) IBOutlet UIImageView *tappedImageView;

@end
