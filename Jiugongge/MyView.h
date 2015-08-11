//
//  MyView.h
//  Jiugongge
//
//  Created by abel on 15/8/11.
//  Copyright © 2015年 abel. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^MyButtonBlock)();
@class Model;

@interface MyView : UIView

@property (nonatomic,strong) Model *model;

- (id)initWithFrame:(CGRect)frame Model:(Model *)model MyButtonBlock:(MyButtonBlock)myButtonBlock;
@end
