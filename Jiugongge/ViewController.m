//
//  ViewController.m
//  Jiugongge
//
//  Created by abel on 15/8/10.
//  Copyright © 2015年 abel. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "MyView.h"
#import "MyLabel.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *appList;
@property (nonatomic, strong) MyLabel *myLabel;

@end

@implementation ViewController

//返回一个新初始化试图控制器与nib文件在指定的包
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//九宫格布局设计，各个方格距离计算
- (void)loadView
{
    //加载uiview控件中的子视图
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self arraysList];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    //控制总列数
    int totalColumns = 3;
    
    CGFloat Y = 15;
    CGFloat W = 90;
    CGFloat H = 100;
    CGFloat X = (self.view.frame.size.width - totalColumns * W) / (totalColumns + 1);
    
    for (int index = 0; index < _appList.count; index++) {
        
        Model *model = _appList[index];
        int row = index / totalColumns;//行号
        int col = index % totalColumns;//列号
        CGFloat viewX = X + col * (W + X);
        CGFloat viewY = 20 + row * (H + Y);
        
        //加载文本标签
        MyView *view = [[MyView alloc] initWithFrame:CGRectMake(viewX, viewY, W, H) Model:model MyButtonBlock:^{
            
            _myLabel = [[MyLabel alloc] init];
            
            [self.view addSubview:_myLabel];
            
            NSTimer *timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timer) userInfo:nil repeats:NO];
            [timer fire];
            
        }];
        
        //下载完成的提示框
        view.model = model;
        [scrollView addSubview:view];
        CGFloat maxY = CGRectGetMaxY(view.frame);
        scrollView.contentSize = CGSizeMake(self.view.frame.size.width, maxY);
    }
    [self.view addSubview:scrollView];
}
- (void)timer
{
    [UIView animateWithDuration:2.0f animations:^{
        _myLabel.alpha = 0.0f;
    }];
}

//加载数据
- (NSArray *)arraysList
{
    if (_appList == nil) {
        NSMutableArray *mutArray = [NSMutableArray array];
        NSArray * array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil]];
        for (NSDictionary *dict in array) {
            [mutArray addObject:[Model modelWithDict:dict]];
        }
        _appList = mutArray;
    }
    
    return _appList;
}










- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
