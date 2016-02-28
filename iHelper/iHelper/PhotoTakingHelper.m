//
//  PhotoTakingHelper.m
//  iHelper
//
//  Created by Alex on 27.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "PhotoTakingHelper.h"



@interface PhotoTakingHelper () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>




@end

@implementation PhotoTakingHelper

- (id)initWith:(UIViewController *) viewController
      callback:(PhotoTakingHelperCallback) callback {
    
    self = [super init];
    
    if (self) {
        self.viewConroller = viewController;
        self.callBack = callback;
        [self showPhotoSourceSelection];
    }
    return self;
    
}




- (void) showPhotoSourceSelection {
 
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:@"where do u want to take your picture from ?"
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    [alertController addAction:cancelAction];
    
    
    UIAlertAction* photoLibraryAction = [UIAlertAction actionWithTitle:@"Photo from library"
                                                                 style:UIAlertActionStyleDefault
                                                               handler:^(UIAlertAction * _Nonnull action) {

                                                                   
                                                                   [self showImagePickerController:UIImagePickerControllerSourceTypePhotoLibrary];
                                                               }];
    
    [alertController addAction:photoLibraryAction];
    
    if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]) {
        
       UIAlertAction*  cameraAction = [UIAlertAction actionWithTitle:@"Photo from Camera"
                                                               style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * _Nonnull action) {
                                                                [self showImagePickerController:UIImagePickerControllerSourceTypeCamera];
                                                             }];
        [alertController addAction:cameraAction];
    }
    
    [self.viewConroller presentViewController:alertController
                                     animated:YES
                                   completion:nil];
    
}

- (void) showImagePickerController:(UIImagePickerControllerSourceType) sourceType {

    
    self.imagePickerController = [UIImagePickerController new];
    
    self.imagePickerController.sourceType = sourceType;
    
    self.imagePickerController.delegate = self;
    
    [self.viewConroller presentViewController:self.imagePickerController
                                     animated:YES
                                   completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0) {
    
    
    [self.viewConroller dismissViewControllerAnimated:NO
                                           completion:^{
                                               
                                               self.callBack(image);
                                               
                                                }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self.viewConroller dismissViewControllerAnimated:NO
                                           completion:^{
                                     
                                           }];
    
}

#pragma mark - UINavigationControllerDelegate


@end
