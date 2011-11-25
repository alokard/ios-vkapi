//
//  ViewController.h
//  VKAPI
//
//  Created by Zhenia Tulusha on 25.11.11.
//  Copyright (c) 2011 DIMALEX LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VKAPIConnectDelegate <NSObject>

- (void) authComplete;

@end

@interface VKAPIConnect : NSObject {
    
    NSString *appID;
    BOOL isAuth;
    BOOL isCaptcha;
    
    id <VKAPIConnectDelegate> rootViewController;
}

@property (nonatomic, retain) NSString *appID;
@property (nonatomic, assign) id <VKAPIConnectDelegate> rootViewContrller;
@property (nonatomic, readonly) BOOL isAuth;

- (id)initWithRootViewController:(UIViewController*)aViewController;

- (void)doAuth;
- (void) authComplete;
- (void)logout;

- (NSDictionary *) sendRequest:(NSString *)reqURl withCaptcha:(BOOL)captcha;
- (NSDictionary *) sendPOSTRequest:(NSString *)reqURl withImageData:(NSData *)imageData;
- (NSString *) URLEncodedString:(NSString *)str;

- (void) sendText:(NSString*)text;
- (void) sendText:(NSString*)text andLink:(NSString*)link;
- (void) sendImage:(UIImage*)image withText:(NSString*)text;
- (void) getMyProfile;

- (void) sendFailedWithError:(NSString *)error;
- (void) sendSuccessWithMessage:(NSString *)message;

@end
