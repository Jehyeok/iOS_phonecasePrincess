//
//  OrderViewController.m
//  iOS_phonecasePrincess
//
//  Created by Jehyeok on 6/5/13.
//  Copyright (c) 2013 aurumplanet. All rights reserved.
//

#import "OrderViewController.h"

@interface OrderViewController ()

@end

@implementation OrderViewController

@synthesize customerInfo;
@synthesize orderInfo;
@synthesize address, data_for_network;
@synthesize itemList, currentValue;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"OrderViewController" bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.currentValue = nil;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    customerInfo.layer.cornerRadius = 10;
    
    UIScrollView *sc = orderInfo;
    sc.contentSize = ((UIView*)[sc.subviews objectAtIndex:0]).bounds.size;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onAddressBtn:(UITextField *)sender
{
    if(!([self.address.text isEqual: @""] || self.address.text==nil))
    {
        NSString* strURL = @"http://biz.epost.go.kr/KpostPortal/openapied?regkey=861394877e6c97c4e1346297408364&target=post&query=";
        
        NSString *queryString = [self.address.text stringByAddingPercentEscapesUsingEncoding:-2147481280];
        
        
        NSURL *url = [NSURL URLWithString:[strURL stringByAppendingString:queryString]];
        
        NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
        
        
        [theRequest setValue:@"ko" forHTTPHeaderField:@"accept-language"];
        
        self.data_for_network=nil;
        
        [NSURLConnection connectionWithRequest:theRequest delegate:self];
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"입력창확인" message:@"입력창이 비었습니다." delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil, nil];
        [alert show];
    }    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if(!self.data_for_network)
    {
        self.data_for_network = [[NSMutableData alloc] init];
    }
    
    [self.data_for_network appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *str = [[NSString alloc] initWithData:self.data_for_network encoding:0x80000000 + kCFStringEncodingDOSKorean];
    // NSString *str = [[NSString alloc] initWithData:self.data_for_network encoding:-2147481280];
    NSLog(@"%@",str);
    
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:self.data_for_network];
    
    [xmlParser setDelegate:self];
    [xmlParser parse];
}

- (void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if([elementName isEqualToString:@"itemlist"])
    {
        itemList = [[NSMutableArray alloc] init];
    }
    else if([elementName isEqualToString:@"item"])
    {
        Address *addr = [[Address alloc] init];
    }
}

- (void)parser:(NSXMLParser*)parser foundCharacters:(NSString *)string
{
    NSString *checkBlank = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if(![checkBlank isEqualToString:@""])
    {
        if(!currentValue)
        {
            currentValue = [[NSMutableString alloc] initWithString:string];
            [currentValue appendString:@"\n"];
        }
        else
        {
            [currentValue appendString:string];
        }
    }
}

- (void)parser:(NSXMLParser*)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"itemlist"])
    {
        return;
    }
    
    if ([elementName isEqualToString:@"item"])
    {

        
    }
}
@end

