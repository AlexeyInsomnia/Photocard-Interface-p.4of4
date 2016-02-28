//
//  Question.h
//  iHelper
//
//  Created by Alex on 18.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Question : NSObject

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* descriptionOfQuestion;
@property (assign, nonatomic) NSInteger numberOfComments;
@property (strong, nonatomic) UIImage* questionImage;

@end
