//
//  TgModel.m
//  TuanGou
//
//  Created by 张国礼 on 15/5/6.
//  Copyright (c) 2015年 wanshangweimeng. All rights reserved.
//

#import "TgModel.h"

@implementation TgModel

+ (instancetype)tgWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}


- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}
@end
