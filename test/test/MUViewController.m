//
//  MUViewController.m
//  test
//
//  Created by Zhenya Tulusha on 25.11.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MUViewController.h"

@implementation MUViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)dealloc
{
    [vkConnect release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (vkConnect == nil)
    {
        vkConnect = [[VKAPIConnect alloc] initWithRootViewController:self];
    }
    
    if ([vkConnect isAuth])
    {
        [loginButton setTitle:@"logout" forState:UIControlStateNormal];
        
        textField.hidden = NO;
        getProfileButton.hidden = NO;
        postTextButton.hidden = NO;
        postTextAndURLButton.hidden = NO;
        postPictureButton.hidden = NO;
        enterGroupeButton.hidden = NO;
    }
    else
    {
        [loginButton setTitle:@"login" forState:UIControlStateNormal];
        
        textField.hidden = YES;
        getProfileButton.hidden = YES;
        postTextButton.hidden = YES;
        postTextAndURLButton.hidden = YES;
        postPictureButton.hidden = YES;
        enterGroupeButton.hidden = YES;
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -
#pragma mark vk api delegate

- (void)authComplete
{
    if ([vkConnect isAuth])
    {
        [loginButton setTitle:@"logout" forState:UIControlStateNormal];
        
        textField.hidden = NO;
        getProfileButton.hidden = NO;
        postTextButton.hidden = NO;
        postTextAndURLButton.hidden = NO;
        postPictureButton.hidden = NO;
        enterGroupeButton.hidden = NO;
    }
    else
    {
        [loginButton setTitle:@"login" forState:UIControlStateNormal];
        
        textField.hidden = YES;
        getProfileButton.hidden = YES;
        postTextButton.hidden = YES;
        postTextAndURLButton.hidden = YES;
        postPictureButton.hidden = YES;
        enterGroupeButton.hidden = YES;
    }
}

#pragma mark -
#pragma mark actions

- (IBAction)loginPressed:(id)sender
{
    if ([vkConnect isAuth])
    {
        [vkConnect logout];
        if ([vkConnect isAuth])
        {
            [loginButton setTitle:@"logout" forState:UIControlStateNormal];
            
            textField.hidden = NO;
            getProfileButton.hidden = NO;
            postTextButton.hidden = NO;
            postTextAndURLButton.hidden = NO;
            postPictureButton.hidden = NO;
            enterGroupeButton.hidden = NO;
        }
        else
        {
            [loginButton setTitle:@"login" forState:UIControlStateNormal];
            
            textField.hidden = YES;
            getProfileButton.hidden = YES;
            postTextButton.hidden = YES;
            postTextAndURLButton.hidden = YES;
            postPictureButton.hidden = YES;
            enterGroupeButton.hidden = YES;
        }
    }
    else
    {
        [vkConnect doAuth];
    }
}

- (IBAction)postTextPressed:(id)sender
{
    if (textField.text && ![textField.text isEqualToString:@""])
    {
        [vkConnect sendText:textField.text];
    }
}

- (IBAction)postTextWithURLPressed:(id)sender
{
    if (textField.text && ![textField.text isEqualToString:@""])
    {
        [vkConnect sendText:textField.text andLink:@"http://vk.com/id117591288"];
    }
}

- (IBAction)postImagePressed:(id)sender
{
    [vkConnect sendImage:[UIImage imageNamed:@"trollface"] withText:textField.text];
}

- (IBAction)enterGroupePressed:(id)sender
{
    
}

- (IBAction)getMyProfilePressed:(id)sender
{
    [vkConnect getMyProfile];
}

#pragma mark -
#pragma mark textfield delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
}

@end
