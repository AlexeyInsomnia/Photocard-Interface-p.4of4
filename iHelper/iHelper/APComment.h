//
//  APComment.h
//  iHelper
//
//  Created by Alex on 19.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "APUser.h"


@interface APComment : NSObject

@property (strong, nonatomic)  NSString* idOfComment;
@property (strong, nonatomic)  APUser* user;
@property (strong, nonatomic)  NSString* createdAt;
@property (strong, nonatomic)  NSString* commentText;
@property (assign, nonatomic)  NSInteger numberOfLikes;
@property (strong, nonatomic)  NSString* idOfAQuestion;
@property (assign, nonatomic) BOOL userDidLike;

@end

