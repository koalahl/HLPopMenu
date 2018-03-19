//
//  HLViewController.m
//  HLCirclyMenu
//
//  Created by hanangellove on 03/19/2018.
//  Copyright (c) 2018 hanangellove. All rights reserved.
//

#import "HLViewController.h"
#import "HLPopCiycleMenu.h"

@interface HLViewController ()

@property (nonatomic, strong) HLPopCiycleMenu *popMenu;
@end

@implementation HLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIButton *centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    centerBtn.frame = CGRectMake(0, 0, 60, 60);
    centerBtn.backgroundColor = [UIColor redColor];
    
    UIButton *subBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    subBtn1.frame = CGRectMake(0, 0, 40, 40);
    subBtn1.backgroundColor = [UIColor blueColor];

    UIButton *subBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    subBtn2.frame = CGRectMake(0, 0, 40, 40);
    subBtn2.backgroundColor = [UIColor yellowColor];

    UIButton *subBtn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    subBtn3.frame = CGRectMake(0, 0, 40, 40);
    subBtn3.backgroundColor = [UIColor lightGrayColor];

    NSArray *btns = @[subBtn1,subBtn2,subBtn3];
    _popMenu = [[HLPopCiycleMenu alloc] initWithFrame:CGRectMake(self.view.center.x, 400, 60, 60) centerItem:centerBtn menuItems:btns];
    _popMenu.distance = 100;
    _popMenu.angleScope = M_PI_2;
    _popMenu.startAngle = M_PI / 6;
    [self.view addSubview:_popMenu];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
