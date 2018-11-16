//
//  AppDelegate.m
//  iOSHTTPServer
//
//  Created by Amon Xu on 2018/11/16.
//  Copyright © 2018 com.amonxu. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "HTTPServer.h"

NSString *url;
@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize httpServer;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self configHTTPServer];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    ViewController *vc = [[ViewController alloc] init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    [httpServer stop];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    [self startServer];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}


- (void)applicationWillTerminate:(UIApplication *)application {
}

#pragma mark Custom method
- (void)configHTTPServer
{
    httpServer = [[HTTPServer alloc] init];

    [httpServer setType:@"_http._tcp."];
    
    NSString *webPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Web"];
    NSLog(@"Setting document root: %@", webPath);
    
    [httpServer setDocumentRoot:webPath];
    
    [self startServer];
}

- (void)startServer
{
    NSError *error;
    if([httpServer start:&error])
    {
        NSLog(@"Started HTTP Server on port %hu", [httpServer listeningPort]);
        url = [NSString stringWithFormat:@"http://localhost:%hu", [httpServer listeningPort]];
    }
    else
    {
        NSLog(@"Error starting HTTP Server: %@", error);
    }
}

@end
