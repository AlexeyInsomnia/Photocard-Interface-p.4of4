//
//  APQuestionViewController.h
//  iHelper
//
//  Created by Alex on 18.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APQuestionHeaderView.h"
#import "Question.h"
#import "APUser.h"
#import "APComment.h"
#import "APCommentTableViewCell.h"
#import "VCFloatingActionButton.h"

@interface APQuestionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) CAShapeLayer* headerMaskLayer;
@property (strong, nonatomic) APQuestionHeaderView* headerView;
@property (strong, nonatomic) Question* question;
@property (strong, nonatomic) NSMutableArray* allUsersArray;
@property (strong, nonatomic) NSMutableArray* allCommentsArray;

@property (strong, nonatomic) VCFloatingActionButton *newcommentButton;
- (IBAction)createNewCommentButton:(UIButton *)sender;

@end
