//
//  APCommentTableViewCell.h
//  iHelper
//
//  Created by Alex on 19.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APComment.h"

@interface APCommentTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *userProfileImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentTextLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;

@property (assign,nonatomic) BOOL currentUserDidLike;

@property (strong, nonatomic) APComment* comment;

- (IBAction)likeButtonClicked:(UIButton *)sender;

- (void) updateUI;

@end
