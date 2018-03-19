//
//  HLPopCiycleButton.h
//  Yeyu
//
//  Created by HanLiu on 2017/2/7.
//  Copyright © 2017年 mobilenowgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HLPopCiycleButtonDelegate <NSObject>

- (void)didSelectItem:(UIButton *)item atIndex:(NSInteger)index;

@end
/*
 本类以正坐标系,逆时针为标准
 */
@interface HLPopCiycleMenu : UIView

///设置中心按钮的使能状态
@property (nonatomic,assign) BOOL enableCenterBtn;

@property (nonatomic,assign,getter=isExpanded) BOOL expanded;

///中心按钮到菜单按钮的距离（中心点距离）
@property (nonatomic,assign) CGFloat distance;
///起始角度，
@property (nonatomic,assign) double startAngle;
///按钮范围 0 ~ 2π
@property (nonatomic,assign) double angleScope;


@property (nonatomic,weak)id <HLPopCiycleButtonDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame centerItem:(UIButton *)item menuItems:(NSArray <UIButton *>*)items;

- (void)addMenuItem:(UIButton *)item;
- (void)addMenuItems:(NSArray <UIButton *>*)items;

- (void)removeMenuItemAtIndex:(NSInteger)index;
- (void)removeAllMenuItems;

- (void)replaceMenuWithItems:(NSArray <UIButton *>*)items;
- (UIButton *)itemAtIndex:(NSUInteger)index;

- (void)open;
- (void)close;

@end
