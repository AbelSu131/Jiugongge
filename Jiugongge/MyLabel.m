//
//  MyLabel.m
//  Jiugongge
//
//  Created by abel on 15/8/11.
//  Copyright © 2015年 abel. All rights reserved.
//  下载成功安装后的提示，相当于安卓版的toast.maketext

#import "MyLabel.h"

@implementation MyLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat myLabelW = 150;
        CGFloat myLabelY = 300;
        CGFloat myLabelH = 30;
        CGFloat myLabelX = (320 - myLabelW) / 2;
        self.frame = CGRectMake(myLabelX, myLabelY, myLabelW, myLabelH);
        self.backgroundColor = [UIColor lightGrayColor];
        self.text = @"已安装成功";
        self.font = [UIFont systemFontOfSize:13];
        self.textColor = [UIColor whiteColor];
        self.textAlignment = UITextAlignmentCenter;
    }
    return self;
}

@end
