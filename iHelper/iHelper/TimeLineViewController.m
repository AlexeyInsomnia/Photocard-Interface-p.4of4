//
//  TimeLineViewController.m
//  iHelper
//
//  Created by Alex on 18.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "TimeLineViewController.h"
#import "APQuestionCollectionViewCell.h"
#import "APQuestionViewController.h"

@interface TimeLineViewController () <UICollectionViewDataSource>

@end

@implementation TimeLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Question* question1 = [[Question alloc] init];
    question1.title = @"picture one";
    question1.descriptionOfQuestion = @"we like it ?";
    question1.questionImage = [UIImage imageNamed:@"apa"];
    
    Question* question2 = [[Question alloc] init];
    question2.title = @"picture second";
    question2.descriptionOfQuestion = @"we love it ?";
    question2.questionImage = [UIImage imageNamed:@" 6"];
    
    Question* question3 = [[Question alloc] init];
    question3.title = @"picture third";
    question3.descriptionOfQuestion = @"choose one";
    question3.questionImage = [UIImage imageNamed:@"7"];
    
    self.questionsArray = [[NSMutableArray alloc] initWithObjects:question1, question2, question3, nil];
    
    
    [self setNeedsStatusBarAppearanceUpdate];
    [self preferredStatusBarStyle];
        // выставим вручную задний фон
    self.backGroundImageView.image = [UIImage imageNamed:@"cloud"];
    
    // сделаем задний фон вручную размытым
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UIVisualEffectView *viewWithBlurredBackground = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    [viewWithBlurredBackground setFrame:self.view.frame];
    
    [self.backGroundImageView addSubview:viewWithBlurredBackground];
    /* разобраться почему не работает
    if ([UIScreen mainScreen].bounds.size.height == 480 || [UIScreen mainScreen].bounds.size.height == 568)  {
        
        UICollectionViewFlowLayout* flowLayout = self.collectionView.collectionViewLayout;
        
        flowLayout.itemSize = CGSizeMake(250.0, 200.0);
        
    }
    */
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.questionsArray count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* identifier = @"QuestionCell";
    
    APQuestionCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    Question* questionCurrent = [self.questionsArray  objectAtIndex:indexPath.row];
    
    cell.cardTitleLabel.text = questionCurrent.title;
    cell.cardDescriptionLabel.text = questionCurrent.descriptionOfQuestion;
    cell.cardImageView.image = questionCurrent.questionImage;
    
    
    //[cell layoutSubviews];
    
    cell.layer.cornerRadius = 10.0;
    cell.clipsToBounds = true;
    
    return cell;
    

    
}

#pragma mark - UIMethods
/*
 Set the UIViewControllerBasedStatusBarAppearance to YES in the .plist file.
 
 In the viewDidLoad do a [self setNeedsStatusBarAppearanceUpdate];
 
 Add the following method:
 
 - (UIStatusBarStyle)preferredStatusBarStyle
 {
 return UIStatusBarStyleLightContent;
 }
 Note: This does not work for controllers inside UINavigationController, please see Tyson's comment below :)
 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ShowCard"]) {
        
        APQuestionCollectionViewCell* cell = sender;
        
        Question* questionCurrent = [[Question alloc] init];
        
        questionCurrent.title = cell.cardTitleLabel.text ;
        questionCurrent.descriptionOfQuestion = cell.cardDescriptionLabel.text;
        questionCurrent.questionImage = cell.cardImageView.image ;
        
        UINavigationController* navigationViewController = segue.destinationViewController;
        
        APQuestionViewController *cardViewController = (APQuestionViewController *)navigationViewController.topViewController;
        
        cardViewController.question = questionCurrent;
    }
}

@end
