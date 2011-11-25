//
//  ViewController.h
//  VKAPI
//
//  Created by Zhenia Tulusha on 25.11.11.
//  Copyright (c) 2011 DIMALEX LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VKAPIConnect : NSObject {
    
    NSString *appID;
    BOOL isAuth;
    BOOL isCaptcha;
    
    UIViewController* rootViewController;
}

@property (nonatomic, retain) NSString *appID;
@property (nonatomic, assign) UIViewController* rootViewContrller;

- (void) authComplete;
- (NSDictionary *) sendRequest:(NSString *)reqURl withCaptcha:(BOOL)captcha;
- (NSDictionary *) sendPOSTRequest:(NSString *)reqURl withImageData:(NSData *)imageData;
- (NSString *) URLEncodedString:(NSString *)str;
- (void) sendText:(NSString*)text;
- (void) sendText:(NSString*)text andLink:(NSString*)link;
- (void) sendFailedWithError:(NSString *)error;
- (void) sendSuccessWithMessage:(NSString *)message;

@end
