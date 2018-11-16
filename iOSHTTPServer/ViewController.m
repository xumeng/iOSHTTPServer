//
//  ViewController.m
//  iOSHTTPServer
//
//  Created by Amon Xu on 2018/11/16.
//  Copyright © 2018 com.amonxu. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

extern NSString *url;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}


@end
