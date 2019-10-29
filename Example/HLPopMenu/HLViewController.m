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

@interface HLViewController ()<HLPopButtonDelegate>

@property (nonatomic, strong) HLPopMenu *circlePopMenu;
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
    
    UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    centerView.layer.cornerRadius = 30;
    centerView.backgroundColor = [UIColor redColor];
    
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
    

    _popMenu =  [HLPopMenu menuWithType:HLPopMenuStyleLiner];
    _popMenu.frame = CGRectMake(self.view.center.x-30, 200, 60, 60);
    _popMenu.centerView = centerView;
    _popMenu.items = btns2;
    _popMenu.distance = 80;
    _popMenu.direction = HLLinerPopMenuDirectionLeft;
    _popMenu.delegate = self;
    [self.view addSubview:_popMenu];
    
    _circlePopMenu = [HLPopMenu menuWithType:HLPopMenuStyleSector];// ;//[[HLCirclePopMenu alloc] initWithFrame:CGRectMake(self.view.center.x-30, 400, 60, 60) centerItem:centerBtn menuItems:btns];//
    _circlePopMenu.frame = CGRectMake(self.view.center.x-30, 500, 60, 60);
    _circlePopMenu.centerBtn = centerBtn;
    _circlePopMenu.items = btns;
    _circlePopMenu.distance = 80;
    _circlePopMenu.delegate = self;
    //_circlePopMenu.angleScope = M_PI / 3;
    //_circlePopMenu.startAngle = M_PI_2;
    [self.view addSubview:_circlePopMenu];
    
    /*如果只用也可以通过这种方式初始化*/
    //    _linePopMenu = [[HLLinerPopMenu alloc] initWithCenterItem:centerBtn2 menuItems:btns2];
    //    _linePopMenu.frame = CGRectMake(self.view.center.x-30, 200, 60, 60);
    //    _linePopMenu.centerBtn = centerBtn2;
    //    _linePopMenu.menuItemsArray = btns2;
    //    _linePopMenu.distance = 120;
    //    [self.view addSubview:_linePopMenu];
    
}

- (void)didSelectMenu:(HLPopMenu *)menu{
    NSLog(@"%d",menu.expanded);
}
- (void)didSelectItem:(UIButton *)item inMenu:(HLPopMenu *)menu atIndex:(NSInteger)index {
    NSLog(@"menu = %@ ,index = %d",menu,index);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
