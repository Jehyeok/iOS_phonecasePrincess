//
//  IPhone5_ViewController.m
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 7/1/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import "IPhone5ViewController.h"

@interface IPhone5ViewController ()

@end

@implementation IPhone5ViewController

@synthesize canvas, subCanvas, photoImageView, tappedImageView, confirmBuyingViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        confirmBuyingViewController = [[ConfirmBuyingViewController alloc] initWithNibName:@"ConfirmBuyingViewController" bundle:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    subCanvas.layer.cornerRadius = 28;
    subCanvas.layer.masksToBounds = YES;
    self.title = @"나만의 케이스 만들기";
    UIBarButtonItem *completeButton = [[UIBarButtonItem alloc] initWithTitle:@"완료" style:UIBarButtonItemStylePlain target:self action:@selector(goToOrderViewController:)];
    self.navigationItem.rightBarButtonItem = completeButton;
    
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scale:)];
    [pinchRecognizer setDelegate:self];
    [self.view addGestureRecognizer:pinchRecognizer];
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
    [panRecognizer setMinimumNumberOfTouches:1];
    [panRecognizer setMaximumNumberOfTouches:1];
    [panRecognizer setDelegate:self];
    [self.view addGestureRecognizer:panRecognizer];
    
    // 케이스 작업대 iphone5_bg.png 추가
    UIImageView *iphone5Bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"480x800_나만의케이스_작업대_iphone5_bg.png"]];
    iphone5Bg.frame = CGRectMake(0, 45, 320, 428);
    iphone5Bg.alpha = 1;
    
    // 케이스 작업대 iphone5_phone_bg.png 추가
    UIImageView *iphone5PhoneBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"480x800_나만의케이스_작업대_iphone5_phonebg"]];
    iphone5PhoneBg.frame = CGRectMake(0, 45, 320, 428);
    iphone5PhoneBg.alpha = 1;
    
    // 케이스 작업대 iphone5_phone_top.png 추가
    UIImageView *iphone5PhoneTop = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"480x800_나만의케이스_작업대_iphone5_phonetop"]];
    iphone5PhoneTop.frame = CGRectMake(0, 45, 320, 428);
    iphone5PhoneTop.alpha = 0.8;
    
    // 케이스 작업대 iphone5 바깥선 추가
    tappedImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"480x800_나만의케이스_작업대_iphone5_guide"]];
    tappedImageView.frame = CGRectMake(0, 45, 320, 428);
    tappedImageView.hidden = YES;
    tappedImageView.alpha = 1;
    
    UIImage *photoImage = [UIImage imageNamed:@"seed.png"];
    photoImageView = [[UIImageView alloc]initWithImage:photoImage];
    photoImageView.frame = CGRectMake(0, 60, 200, 200);
    photoImageView.alpha = 1.0;
    
    [self.view addSubview:iphone5Bg];
    [self.view addSubview:iphone5PhoneBg];
    [self.view addSubview:subCanvas];
    [subCanvas addSubview:photoImageView];
    [self.view addSubview:iphone5PhoneTop];
    [self.view addSubview:tappedImageView];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private Methods

- (void)scale:(id)sender
{
    if([(UIPinchGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        _lastScale = 1.0;
    }
    
    CGFloat scale = 1.0 - (_lastScale - [(UIPinchGestureRecognizer*)sender scale]);
    
    CGAffineTransform currentTransform = photoImageView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
    
    [photoImageView setTransform:newTransform];
    
    _lastScale = [(UIPinchGestureRecognizer*)sender scale];
    
    tappedImageView.hidden = NO;
    subCanvas.layer.masksToBounds = NO;
    
    if([(UIPinchGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded)
    {
        tappedImageView.hidden = YES;
        subCanvas.layer.masksToBounds = YES;
    }
}

- (void)move:(id)sender
{
    CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:canvas];
    
    if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan)
    {
        _firstX = [photoImageView center].x;
        _firstY = [photoImageView center].y;
    }
    
    translatedPoint = CGPointMake(_firstX + translatedPoint.x, _firstY + translatedPoint.y);
    
    [photoImageView setCenter:translatedPoint];
    
    tappedImageView.hidden = NO;
    subCanvas.layer.masksToBounds = NO;
    
    if([(UIPinchGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded)
    {
        tappedImageView.hidden = YES;
        subCanvas.layer.masksToBounds = YES;
    }
}

- (IBAction)backBtn:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)confirmBuying:(id)sender
{
//    [self.view addSubview:confirmBuyingViewController.view];
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 548)];
    [self.view addSubview:v1];
}

@end