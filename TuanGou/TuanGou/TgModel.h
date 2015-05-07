//
//  TgModel.h
//  TuanGou
//
//  Created by 张国礼 on 15/5/6.
//  Copyright (c) 2015年 wanshangweimeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TgModel : NSObject

@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *price;
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *buyCount;

+ (instancetype)tgWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
