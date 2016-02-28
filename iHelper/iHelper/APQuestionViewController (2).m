//
//  APQuestionViewController.m
//  iHelper
//
//  Created by Alex on 18.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "APQuestionViewController.h"
#import "APQuestionHeaderView.h"
#import "Question.h"

static CGFloat tableHeaderHeight = 350.0f;

@interface APQuestionViewController() <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (strong, nonatomic) CAShapeLayer* headerMaskLayer;

//@property (weak, nonatomic) IBOutlet APQuestionHeaderView* headerView;
@property (strong, nonatomic) APQuestionHeaderView* headerView;
@property (strong, nonatomic) Question* question;

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

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    [self updateHeaderView];
}

-(void)viewDidLoad {
    
    [super viewDidLoad];

    
    // ??? потом сюда добавляем то что получим из другого контроллера
    /*
    self.headerView.backgroundImageView.image = [UIImage imageNamed:@" 6"];
    self.headerView.questionDescriptionLabel.text = @"this is question";
    self.headerView.numberOfCommentsLabel.text = [NSString stringWithFormat:@"%ld comment",self.question.numberOfComments];
    */
    
    //self.tableView.estimatedRowHeight = 200.0f;
    //self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.headerView = (APQuestionHeaderView*)self.tableView.tableHeaderView;
    self.tableView.tableHeaderView = nil;
    [self.tableView addSubview:self.headerView];
    /*
    tableView.contentInset = UIEdgeInsets(top: tableHeaderHeight, left: 0, bottom: 0, right: 0)
    tableView.contentOffset = CGPoint(x: 0, y: -tableHeaderHeight)
    */
    // отступы
    

    

    
    //self.tableView.contentInset = UIEdgeInsetsMake(tableHeaderHeight, 0.0f, 0.0f, 0.0f);
    
    self.tableView.contentInset = UIEdgeInsetsMake(tableHeaderHeight, 0.0f, 0.0f, 0.0f);
    
    self.tableView.contentOffset = CGPointMake(0, -tableHeaderHeight);
    
    self.headerMaskLayer = [[CAShapeLayer alloc] init];
    self.headerMaskLayer.fillColor = [UIColor blackColor].CGColor;
    self.headerView.layer.mask = self.headerMaskLayer;
    
    [self updateHeaderView];
    
    
}




#pragma mark  -UITableViewDataSource



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString* identifier = @"CommentCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    
    
    return cell;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}



@end
