//
//  APNewCommentViewController.m
//  iHelper
//
//  Created by Alex on 26.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "APNewCommentViewController.h"

@interface APNewCommentViewController ()

@end

@implementation APNewCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // устанавливаем курсор мыши сразу на него при загрузке
    [self.commentContentTextView becomeFirstResponder];
    self.commentContentTextView.text = @"";
    
    [self setNeedsStatusBarAppearanceUpdate];
    [self preferredStatusBarStyle];
    
    // когда много строк текста вбивается то строки уходят вниз и не видно их - исправляем
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                name:UIKeyboardWillHideNotification
                                               object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    // Do any additional setup after loading the view.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (IBAction)closeAction:(UIBarButtonItem *)sender {
    
    // убираем клаву
    [self.commentContentTextView resignFirstResponder ];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

- (IBAction)addCommentAction:(UIBarButtonItem *)sender {
    
    [self.commentContentTextView resignFirstResponder ];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

- (void) keyboardWillHide:(NSNotification*) notification {
    
    // UIKeyboardWillHideNotification
    
    self.commentContentTextView.contentInset = UIEdgeInsetsZero;
    self.commentContentTextView.scrollIndicatorInsets = UIEdgeInsetsZero;
    
}

- (void) keyboardWillShow:(NSNotification*) notification {
    
    // UIKeyboardWillShowNotification
    
    NSDictionary* userInfo;
    
    if (notification.userInfo) {
        userInfo = notification.userInfo;
    } else {
        userInfo = nil;
    }

    CGRect beginFrame = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    self.commentContentTextView.contentInset = UIEdgeInsetsMake(0, 0, beginFrame.size.height, 0);
    
    self.commentContentTextView.scrollIndicatorInsets = self.commentContentTextView.contentInset ;
    
    
    
}
@end
