//
//  APQuestionViewController.m
//  iHelper
//
//  Created by Alex on 18.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "APQuestionViewController.h"



static CGFloat tableHeaderHeight = 350.0f;

@interface APQuestionViewController() <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>







@end

@implementation APQuestionViewController

#pragma mark - UIMethods

-(void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    [self updateHeaderView];
}

-(void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    [self updateHeaderView];
}

// спрячем верхний статус бар

- (BOOL)prefersStatusBarHidden {
    
    return YES;
}

- (void) updateHeaderView {
    
    CGRect headerRect = CGRectMake(0, -tableHeaderHeight, self.tableView.bounds.size.width, tableHeaderHeight);
    
    if (self.tableView.contentOffset.y < -tableHeaderHeight) {
        headerRect.origin.y = self.tableView.contentOffset.y;
        headerRect.size.height = -self.tableView.contentOffset.y;
    }
    
    self.headerView.frame = headerRect;
    UIBezierPath* path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(headerRect.size.width, 0)];
    [path addLineToPoint:CGPointMake(headerRect.size.width, headerRect.size.height)];
    [path addLineToPoint:CGPointMake(0, headerRect.size.height)];
    self.headerMaskLayer.path = path.CGPath;

}



-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 200;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.allUsersArray = [NSMutableArray array];
    self.allCommentsArray = [NSMutableArray array];
    

    
     APUser* user1 = [[APUser alloc] init];
     
     user1.idOfUser = @"a1";
     user1.fullName = @"Unkwnown";
     user1.email = @"unknown@mail.ru";
     user1.profileImage = [UIImage imageNamed:@"7"];
     [self.allUsersArray addObject:user1];
     
     
     APComment* comment1 = [[APComment alloc] init];
     comment1.idOfComment = @"id1";
     comment1.user = [self.allUsersArray objectAtIndex:0];
     comment1.createdAt = @"today";
     comment1.numberOfLikes = 12;
     comment1.idOfAQuestion = @"question1";
     comment1.userDidLike = NO;
    [self.allCommentsArray addObject:comment1];
    
     APComment* comment2 = [[APComment alloc] init];
     comment2.idOfComment = @"id2";
     comment2.user = [self.allUsersArray objectAtIndex:0];
     comment2.createdAt = @"today";
     comment2.numberOfLikes = 12;
     comment2.idOfAQuestion = @"question2";
     comment2.userDidLike = YES;
    [self.allCommentsArray addObject:comment2];
     
    
    
    
    // ??? потом сюда добавляем то что получим из другого контроллера
    /*
    self.headerView.backgroundImageView.image = [UIImage imageNamed:@" 6"];
    self.headerView.questionDescriptionLabel.text = @"this is question";
    self.headerView.numberOfCommentsLabel.text = [NSString stringWithFormat:@"%ld comment",self.question.numberOfComments];
    */
    

    
    self.headerView = (APQuestionHeaderView*)self.tableView.tableHeaderView;
    self.tableView.tableHeaderView = nil;
    [self.tableView addSubview:self.headerView];
    
    self.headerView.backgroundImageView.image=self.question.questionImage;
    self.headerView.numberOfCommentsLabel.text=[NSString stringWithFormat:@"%ld",self.question.numberOfComments];
    self.headerView.questionDescriptionLabel.text=self.question.descriptionOfQuestion;
    
    

    

    
    
    self.tableView.contentInset = UIEdgeInsetsMake(tableHeaderHeight, 0.0f, 0.0f, 0.0f);
    
    self.tableView.contentOffset = CGPointMake(0, -tableHeaderHeight);
    
    self.headerMaskLayer = [[CAShapeLayer alloc] init];
    self.headerMaskLayer.fillColor = [UIColor blackColor].CGColor;
    self.headerView.layer.mask = self.headerMaskLayer;
    
    [self updateHeaderView];
    
    [self.tableView reloadData];
    
    
}

#pragma mark  -UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.allCommentsArray count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString* identifier = @"CommentCell";
    
    APCommentTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[APCommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.comment = [self.allCommentsArray objectAtIndex:indexPath.row];
    
    
    return cell;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    [self updateHeaderView];
    
    // сделаем так чтобы он убирался
    
    CGFloat offSetY = scrollView.contentOffset.y;
    
    CGFloat adjustment = 100.0f;
    
    if ( -offSetY > (tableHeaderHeight+adjustment) ) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}





#pragma mark - Actions



- (IBAction)createNewCommentButton:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"ShowComment" sender:nil];
    
}
@end
