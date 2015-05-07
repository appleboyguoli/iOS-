//
//  FooterView.m
//  TuanGou
//
//  Created by 张国礼 on 15/5/6.
//  Copyright (c) 2015年 wanshangweimeng. All rights reserved.
//

#import "FooterView.h"


@interface FooterView ()

@property (weak, nonatomic) IBOutlet UIButton *loadBtn;
@property (weak, nonatomic) IBOutlet UIView *loadView;

- (IBAction)loadBtnClicked:(id)sender;
@end

@implementation FooterView



+ (instancetype)footerView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:self options:nil] lastObject];
}
/**
 *  点击"加载"按钮
 */
- (IBAction)loadBtnClicked:(id)sender {
    self.loadBtn.hidden = YES;
    self.loadView.hidden = NO;
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{

        self.loadBtn.hidden = NO;
        self.loadView.hidden = YES;
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(footView:ClickedLoadBtn:)]) {
            
            [self.delegate footView:self ClickedLoadBtn:sender];
        }
    });
}

@end
