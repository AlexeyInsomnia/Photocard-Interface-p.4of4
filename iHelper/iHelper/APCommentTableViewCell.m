//
//  APCommentTableViewCell.m
//  iHelper
//
//  Created by Alex on 19.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "APCommentTableViewCell.h"

@implementation APCommentTableViewCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self updateUI];
        self.currentUserDidLike = NO;
    }
    return self;
}

- (void) updateUI {
    
    self.userProfileImageView.image = self.comment.user.profileImage;
    self.userNameLabel.text = self.comment.user.fullName;
    self.createdAtLabel.text = self.comment.createdAt;
    self.commentTextLabel.text = self.comment.commentText;
    
    self.userProfileImageView.layer.cornerRadius = self.userProfileImageView.bounds.size.width /2;
    self.userProfileImageView.clipsToBounds = true;
    
    [self.likeButton setTitle:  [NSString stringWithFormat:@"❤️ %ld",self.comment.numberOfLikes] forState:UIControlStateNormal];
    
}

#pragma mark - Actions


- (IBAction)likeButtonClicked:(UIButton *)sender {
    
    self.comment.userDidLike = !self.comment.userDidLike;
    
    if (self.comment.userDidLike) {
        self.comment.numberOfLikes++;
        
    } else {
        self.comment.numberOfLikes--;
    }
    
    [self.likeButton setTitle:  [NSString stringWithFormat:@"❤️ %ld",self.comment.numberOfLikes] forState:UIControlStateNormal];
    
    self.currentUserDidLike = self.comment.userDidLike;
    
    if (self.comment.userDidLike) {
        self.likeButton.tintColor = [UIColor redColor];
    } else {
        self.likeButton.tintColor = [UIColor blueColor];

    }
    

    
}


@end
