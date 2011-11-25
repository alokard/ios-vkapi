//
//  MUViewController.h
//  test
//
//  Created by Zhenya Tulusha on 25.11.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VKAPIConnect.h"


@interface MUViewController : UIViewController <VKAPIConnectDelegate, UITextFieldDelegate>
{
    VKAPIConnect* vkConnect;
    
    IBOutlet UITextField* textField;
    IBOutlet UIButton* loginButton;
    IBOutlet UIButton* getProfileButton;
    IBOutlet UIButton* postTextButton;
    IBOutlet UIButton* postTextAndURLButton;
    IBOutlet UIButton* postPictureButton;
    IBOutlet UIButton* enterGroupeButton;
}

@end
