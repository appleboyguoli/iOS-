//
//  TgTableViewCell.h
//  TuanGou
//
//  Created by 张国礼 on 15/5/6.
//  Copyright (c) 2015年 wanshangweimeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TgModel;

@interface TgTableViewCell : UITableViewCell

/**
 *  通过一个tableView来创建一个cell
 *
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic, strong) TgModel *tuangouModel;

@end
