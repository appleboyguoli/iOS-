//
//  ViewController.m
//  TuanGou
//
//  Created by 张国礼 on 15/5/6.
//  Copyright (c) 2015年 wanshangweimeng. All rights reserved.
//

#import "ViewController.h"
#import "TgModel.h"
#import "TgTableViewCell.h"
#import "HeaderView.h"
#import "FooterView.h"

@interface ViewController ()<UITableViewDataSource,FooterViewDelegate,HeaderViewDelegate>
@property (nonatomic, strong) NSMutableArray *tuangouArr;

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.rowHeight = 80;
    
    HeaderView *headerView = [HeaderView headerView];
    headerView.delegate = self;
    self.tableView.tableHeaderView = headerView;
    
    FooterView *footView = [FooterView footerView];
    footView.delegate = self;
    
    self.tableView.tableFooterView = footView;

}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}



- (NSMutableArray *)tuangouArr
{
    if (_tuangouArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *tgArray = [NSMutableArray array];
        
        for(NSDictionary *dict in dictArray){
            TgModel *tuangouModel = [TgModel tgWithDict:dict];
            [tgArray addObject:tuangouModel];
        }
        
        _tuangouArr = tgArray;
    }
    
    return _tuangouArr;
}

#pragma mark -HeaderView delegate method

- (void)headerView:(HeaderView *)headerView clickedIndex:(NSInteger)index
{
    NSLog(@"index is %d",index);
}

#pragma mark -FootView delegate method

- (void)footView:(FooterView *)footView ClickedLoadBtn:(id)button
{
    
    TgModel *model = [[TgModel alloc] init];
    model.icon = @"2c97690e72365e38e3e2a95b934b8dd2.png";
    model.title = @"新增团购数据";
    model.price = @"100";
    model.buyCount = @"20";
    
    [self.tuangouArr addObject:model];
    [self.tableView reloadData];

}

#pragma mark -TableView的数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tuangouArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.创建cell
    TgTableViewCell *cell = [TgTableViewCell cellWithTableView:tableView];
    
    //2.给cell传递模型数据
    cell.tuangouModel = self.tuangouArr[indexPath.row];
    
    return cell;
}
@end
