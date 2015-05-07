//
//  TgTableViewCell.m
//  TuanGou
//
//  Created by 张国礼 on 15/5/6.
//  Copyright (c) 2015年 wanshangweimeng. All rights reserved.
//

#import "TgTableViewCell.h"
#import "TgModel.h"

@interface TgTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *priceView;
@property (weak, nonatomic) IBOutlet UILabel *buyCountView;

@end
@implementation TgTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"tg";
    TgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TgCell" owner:self options:nil]lastObject];
    }
    return cell;
}

- (void)setTuangouModel:(TgModel *)tuangouModel
{
    _tuangouModel = tuangouModel;
    
    self.iconView.image = [UIImage  imageNamed:tuangouModel.icon];
    self.titleView.text = tuangouModel.title;
    self.priceView.text = [NSString stringWithFormat:@"￥%@",tuangouModel.price];
    self.buyCountView.text = [NSString stringWithFormat:@"%@人已购买",tuangouModel.buyCount];
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
