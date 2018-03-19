//
//  HLViewController.m
//  HLCirclyMenu
//
//  Created by hanangellove on 03/19/2018.
//  Copyright (c) 2018 hanangellove. All rights reserved.
//

#import "HLViewController.h"
#import "HLCirclePopMenu.h"
#import "HLLinerPopMenu.h"

@interface HLViewController ()

@property (nonatomic, strong) HLCirclePopMenu *circlePopMenu;
@property (nonatomic, strong) HLLinerPopMenu *linePopMenu;
@property (nonatomic, strong) HLPopMenu *popMenu;
@end

@implementation HLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIButton *centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    centerBtn.frame = CGRectMake(0, 0, 60, 60);
    centerBtn.backgroundColor = [UIColor redColor];
    
    UIButton *centerBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    centerBtn2.frame = CGRectMake(0, 0, 60, 60);
    centerBtn2.backgroundColor = [UIColor redColor];
    
    UIButton *subBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    subBtn1.frame = CGRectMake(0, 0, 40, 40);
    subBtn1.backgroundColor = [UIColor blueColor];

    UIButton *subBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    subBtn2.frame = CGRectMake(0, 0, 40, 40);
    subBtn2.backgroundColor = [UIColor yellowColor];

    UIButton *subBtn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    subBtn3.frame = CGRectMake(0, 0, 40, 40);
    subBtn3.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *subBtn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    subBtn4.frame = CGRectMake(0, 0, 40, 40);
    subBtn4.backgroundColor = [UIColor blueColor];
    
    UIButton *subBtn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    subBtn5.frame = CGRectMake(0, 0, 40, 40);
    subBtn5.backgroundColor = [UIColor yellowColor];
    
    UIButton *subBtn6 = [UIButton buttonWithType:UIButtonTypeCustom];
    subBtn6.frame = CGRectMake(0, 0, 40, 40);
    subBtn6.backgroundColor = [UIColor lightGrayColor];

    NSArray *btns = @[subBtn1,subBtn2,subBtn3];
    NSArray *btns2 = @[subBtn4,subBtn5,subBtn6];
    
    _circlePopMenu = [[HLCirclePopMenu alloc] init];
    _circlePopMenu.frame = CGRectMake(self.view.center.x-30, 400, 60, 60);
    _circlePopMenu.centerBtn = centerBtn;
    _circlePopMenu.menuItemsArray = btns;
//    _popMenu.distance = 120;
//    _popMenu.angleScope = M_PI_2;
//    _popMenu.startAngle = M_PI* 2;
    [self.view addSubview:_circlePopMenu];
    
    
//    _linePopMenu = [[HLLinerPopMenu alloc] initWithCenterItem:centerBtn2 menuItems:btns2];
//    _linePopMenu.frame = CGRectMake(self.view.center.x-30, 200, 60, 60);
//    _linePopMenu.centerBtn = centerBtn2;
//    _linePopMenu.menuItemsArray = btns2;
//    _linePopMenu.distance = 120;
//    [self.view addSubview:_linePopMenu];
    
    
    _popMenu =  [HLPopMenu menuWithType:HLPopMenuStyleLiner];//
    _popMenu.frame = CGRectMake(self.view.center.x-30, 200, 60, 60);
    _popMenu.centerBtn = centerBtn2;
    _popMenu.menuItemsArray = btns2;
    _popMenu.distance = 120;
    [self.view addSubview:_popMenu];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
