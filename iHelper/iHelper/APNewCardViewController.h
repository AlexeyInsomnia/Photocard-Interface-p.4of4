//
//  APNewCardViewController.h
//  iHelper
//
//  Created by Alex on 26.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoTakingHelper.h"

@interface APNewCardViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UITextField *newcardTitleTextField;

@property (weak, nonatomic) IBOutlet UITextView *newcardDescriptionTextView;

@property (weak, nonatomic) IBOutlet UIButton *selectImageButton;

@property (strong, nonatomic) PhotoTakingHelper*  photoTakingHelper;

@property (strong, nonatomic) UIImage* cardImage;

- (IBAction)closeAction:(UIBarButtonItem *)sender;
- (IBAction)addQuestionAction:(UIBarButtonItem *)sender;
- (IBAction)selectImageAction:(UIButton *)sender;

@end
