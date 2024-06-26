//
//  ViewController.m
//  自动布局子视图
//
//  Created by 张旭洋 on 2023/7/17.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _superView = [[UIView alloc] init];
    _superView.frame = CGRectMake(75, 75, 180, 280);
    _superView.backgroundColor = [UIColor blueColor];
    
    _label01 = [[UILabel alloc] init];
    //位置相对于父亲视图
    _label01.frame = CGRectMake(0, 0, 40, 40);
    _label01.text = @"1";
    _label01.backgroundColor = [UIColor greenColor];
    
    _label02 = [[UILabel alloc] init];
    _label02.frame = CGRectMake(180 - 40, 0, 40, 40);
    _label02.text = @"2";
    _label02.backgroundColor = [UIColor greenColor];

    _label03 = [[UILabel alloc] init];
    _label03.frame = CGRectMake(180 - 40, 280 - 40, 40, 40);
    _label03.text = @"3";
    _label03.backgroundColor = [UIColor greenColor];

    _label04 = [[UILabel alloc] init];
    _label04.frame = CGRectMake(0, 280 - 40, 40, 40);
    _label04.text = @"4";
    _label04.backgroundColor = [UIColor greenColor];

    [_superView addSubview: _label01];
    [_superView addSubview: _label02];
    [_superView addSubview: _label03];
    [_superView addSubview: _label04];
    
    [self.view addSubview: _superView];
    
    _viewCenter = [[UIView alloc] init];
    _viewCenter.frame = CGRectMake(0, 0, _superView.bounds.size.width, 40);
    _viewCenter.center = CGPointMake(180 / 2, 280 / 2);
    _viewCenter.backgroundColor = [UIColor orangeColor];
    
    [_superView addSubview: _viewCenter];
    
    //自动布局属性设置，通过此变量来调整视图在父亲视图中的位置大小
    _viewCenter.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
    //视图距离父亲视图的左侧可以变化
    _label02.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    _label03.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
    _label04.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static BOOL isLarge = NO;
    
    [UIView beginAnimations: nil context: nil];
    [UIView setAnimationDuration: 1];
    
    if (!isLarge) {
        _superView.frame = CGRectMake(75, 75, 300, 480);
    } else {
        _superView.frame = CGRectMake(75, 75, 180, 280);
    }
    
    [UIView commitAnimations];
    
    isLarge = !isLarge;
}

@end
