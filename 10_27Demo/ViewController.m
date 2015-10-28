//
//  ViewController.m
//  10_27Demo
//
//  Created by nate on 15/10/27.
//  Copyright (c) 2015年 nate. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //[self sendRequst:@"http://www.baidu.com"];
    
    [self testJson];
}

-(void)sendRequst:(NSString*)urlPath{
    NSURL* url = [[NSURL alloc] initWithString:urlPath];
    
    NSURLRequest* req = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:20];
    
    //CGRect rect = //[UIApplication sharedApplication
    UIWebView* webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    
    
    [self.view addSubview:webView];
    
    [webView loadRequest:req];
    
    
}


-(void)testJson{
    NSDictionary* dic = [[NSDictionary alloc] initWithObjectsAndKeys:@"nate",@"name",@"30",@"age" ,nil];
    
    //判断当前的foudition对象是否可以转化成json数据
    if ([NSJSONSerialization isValidJSONObject:dic]) {
        
        NSError* err = nil;
        //把foundition对象 转成 json 对象
        NSData* data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&err];
        
        
        if (err == nil && data && data.length>0) {
            NSLog(@"发送数据");
        }
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
