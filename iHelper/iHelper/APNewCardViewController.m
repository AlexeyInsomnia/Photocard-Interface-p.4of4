//
//  APNewCardViewController.m
//  iHelper
//
//  Created by Alex on 26.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "APNewCardViewController.h"


@interface APNewCardViewController () <UITextFieldDelegate, UITextViewDelegate>



@end

@implementation APNewCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNeedsStatusBarAppearanceUpdate];
    [self preferredStatusBarStyle];
    
    [self.newcardTitleTextField becomeFirstResponder];
    
    self.newcardDescriptionTextView.delegate = self;
    
    self.newcardTitleTextField.delegate = self;
    
    
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Actions

- (IBAction)closeAction:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [self hideKeyboard];
    
}

- (IBAction)addQuestionAction:(UIBarButtonItem *)sender {
    
#warning CREATE NEW CARD IN A PARSE
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [self hideKeyboard];
    
}

- (IBAction)selectImageAction:(UIButton *)sender {
   
  self.photoTakingHelper = [[PhotoTakingHelper alloc] initWith:self callback:^(UIImage*  image){
      if (image) {
          self.cardImage = image;
          self.imageView.image = self.cardImage;
          NSLog(@"we got an image%@", self.cardImage);
      }
  }];
    
}

- (void) hideKeyboard {
 
    if ([self.newcardDescriptionTextView isFirstResponder]) {
        [self.newcardDescriptionTextView resignFirstResponder];
    } else if ([self.newcardTitleTextField isFirstResponder]) {
        [self.newcardTitleTextField resignFirstResponder];
        
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ( ![textField.text isEqualToString:@""]){
        
        [self.newcardDescriptionTextView becomeFirstResponder];
        
    } else if ([self.newcardTitleTextField.text  isEqual: @""]) {
        [textField resignFirstResponder];
    }
    
    return YES;
    // called when 'return' key pressed. return NO to ignore.
}

#pragma mark - UITextViewDelegate


- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    
    textView.text = @"";
    return YES;
    
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"Description";
    }

    return YES;
}


@end
