//
//  FooterView.h
//  TuanGou
//
//  Created by 张国礼 on 15/5/6.
//  Copyright (c) 2015年 wanshangweimeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FooterView;
@protocol FooterViewDelegate <NSObject>

@optional
- (void)footView:(FooterView*)footView ClickedLoadBtn:(id)button;
@end

@interface FooterView : UIView
/**
 *  快速创建一个footerView
 */

+ (instancetype)footerView;

//这里写id不想对任何类有依赖
@property(nonatomic, weak) id<FooterViewDelegate> delegate;
@end
