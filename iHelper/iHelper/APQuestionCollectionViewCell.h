//
//  APQuestionCollectionViewCell.h
//  iHelper
//
//  Created by Alex on 18.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APUser.h"

@interface APQuestionCollectionViewCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;

@property (weak, nonatomic) IBOutlet UILabel *cardTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *cardDescriptionLabel;

@property (strong,nonatomic) NSMutableArray* allUsers;

@end
