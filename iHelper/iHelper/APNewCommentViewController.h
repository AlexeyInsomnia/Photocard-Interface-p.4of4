//
//  APNewCommentViewController.h
//  iHelper
//
//  Created by Alex on 26.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APNewCommentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UIImageView *currentUserProfileImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UITextView *commentContentTextView;
- (IBAction)closeAction:(UIBarButtonItem *)sender;
- (IBAction)addCommentAction:(UIBarButtonItem *)sender;

@end
