//
//  AppDelegate.h
//  iOSHTTPServer
//
//  Created by Amon Xu on 2018/11/16.
//  Copyright © 2018 com.amonxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HTTPServer;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong) HTTPServer *httpServer;

@end

