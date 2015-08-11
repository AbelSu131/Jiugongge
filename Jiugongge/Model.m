//
//  Model.m
//  Jiugongge
//
//  Created by abel on 15/8/11.
//  Copyright © 2015年 abel. All rights reserved.
//

#import "Model.h"

@implementation Model
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.name = dict[@"name"];
    }
    return self;
}

+ (instancetype)modelWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
