//
//  TimeLineViewController.h
//  iHelper
//
//  Created by Alex on 18.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"

@interface TimeLineViewController : UIViewController


@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIImageView *backGroundImageView;
@property (weak, nonatomic) IBOutlet UIButton *currentUserFullNameButton;


@property (strong, nonatomic) NSMutableArray* questionsArray;


@end
