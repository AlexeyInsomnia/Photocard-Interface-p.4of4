//
//  PhotoTakingHelper.h
//  iHelper
//
//  Created by Alex on 27.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef  void(^PhotoTakingHelperCallback)(UIImage*);

@interface PhotoTakingHelper : NSObject

//View controller on which AlertViewCintroller and UIImagePickerController are presented
@property (weak, nonatomic) UIViewController* viewConroller;
@property (strong, nonatomic) UIImagePickerController* imagePickerController;


@property (copy, nonatomic) PhotoTakingHelperCallback callBack;

- (void) showPhotoSourceSelection ;

- (void) showImagePickerController:(UIImagePickerControllerSourceType*) sourceType;

- (id)initWith:(UIViewController *) viewController
      callback:(PhotoTakingHelperCallback) callback;
          


@end
