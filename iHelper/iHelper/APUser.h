//
//  APUser.h
//  iHelper
//
//  Created by Alex on 19.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface APUser : NSObject

@property (strong, nonatomic)  NSString* idOfUser;
@property (strong, nonatomic)  NSString* fullName;
@property (strong, nonatomic)  NSString* email;
@property (strong, nonatomic)  UIImage* profileImage;
@property (strong, nonatomic)  NSMutableArray* cardId;

@end
