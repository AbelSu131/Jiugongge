//
//  MyView.m
//  Jiugongge
//
//  Created by abel on 15/8/11.
//  Copyright © 2015年 abel. All rights reserved.

// 代码对九宫格进行布局

#import "MyView.h"
#import "Model.h"
@interface MyView()
{
    MyButtonBlock _myButtonBlock;
}
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UIButton *button;

@end

@implementation MyView

- (id)initWithFrame:(CGRect)frame Model:(Model *)model MyButtonBlock:(MyButtonBlock)myButtonBlock{
    _myButtonBlock = myButtonBlock;
    _model = model;
    self = [super initWithFrame:frame];
    if (self)
    {
        CGFloat W = 90;
        
        //加载图片
        _imageView = [[UIImageView alloc]init];
        CGFloat imageViewX = 0;
        CGFloat imageViewY = 0;
        CGFloat imageViewW = W;
        CGFloat imageViewH = 50;
        _imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
        _imageView.contentMode = UIViewContentModeTop;
        _imageView.image = [UIImage imageNamed:model.icon];
        [self addSubview:_imageView];

        //加载标题
        _label = [[UILabel alloc] init];
        CGFloat labelX = 0;
        CGFloat labelY = CGRectGetMaxY(_imageView.frame) + 18;
        CGFloat labelW = W;
        CGFloat labelH = 10;
        _label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        _label.font = [UIFont systemFontOfSize:13];//字体大小
        _label.textAlignment = UITextAlignmentCenter;//字体居中
        _label.text = model.name;//加载标题名称
        [self addSubview:_label];
        
        //显示下载按钮
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat buttonX = 10;
        CGFloat buttonY = CGRectGetMaxY(_imageView.frame) + 30;
        CGFloat buttonW = W - 2 * 10;
        CGFloat buttonH = 20;
        [_button setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
        [_button setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
        [_button setTitle:@"下载" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(tapButton) forControlEvents:UIControlEventTouchUpInside];
        _button.titleLabel.font = [UIFont systemFontOfSize:13];
        _button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [self addSubview:_button];
        
    }
    return self;
}

//点击下载按钮响应事件
- (void)tapButton
{
    if ([_button.titleLabel.text isEqualToString:@"已安装"]) {
        return;
    }
    [_button setTitle:@"已安装" forState:UIControlStateNormal];
    
    _myButtonBlock();
    
}
@end
