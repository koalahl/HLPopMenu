//
//  HLPopMenu.h
//  HLCirclyMenu
//
//  Created by HanLiu on 2018/3/19.
//

#import <UIKit/UIKit.h>
@class HLPopMenu;

typedef NS_ENUM(NSUInteger,HLPopMenuStyle) {
    HLPopMenuStyleSector = 0, //扇形展开
    HLPopMenuStyleLiner //直线展开
};

typedef NS_ENUM(NSUInteger,HLLinerPopMenuDirection) {
    HLLinerPopMenuDirectionUp = 0,
    HLLinerPopMenuDirectionDown,
    HLLinerPopMenuDirectionLeft,
    HLLinerPopMenuDirectionRight
};

@protocol HLPopButtonDelegate <NSObject>

- (void)didSelectCenterBtn:(UIButton *)centerBtn inMenu:(HLPopMenu *)menu;
- (void)didSelectItem:(UIButton *)item inMenu:(HLPopMenu *)menu atIndex:(NSInteger)index;

@end
@interface HLPopMenu : UIView


///设置中心按钮的使能状态
@property (nonatomic,assign) BOOL enableCenterBtn;

@property (nonatomic,assign,getter=isExpanded) BOOL expanded;

///中心按钮到菜单按钮的距离（中心点距离）
@property (nonatomic,assign) CGFloat distance;

///起始角度，仅当类型为扇形sector时生效
@property (nonatomic,assign) double startAngle;
///按钮展开的范围 0 ~ 2π，仅当类型为扇形sector时生效
@property (nonatomic,assign) double angleScope;

///展开/关闭动画的时间
@property (nonatomic,assign) CGFloat animationTimeInterval;

@property (nonatomic,weak)id <HLPopButtonDelegate>delegate;

///中心的按钮
@property (nonatomic,strong) UIButton *centerBtn;

///子按钮数组
@property (nonatomic,strong) NSArray *items;

@property (nonatomic, assign) HLLinerPopMenuDirection direction;


#pragma mark - Method
- (instancetype)initWithCenterItem:(UIButton *)item menuItems:(NSArray <UIButton *>*)items;

- (instancetype)initWithFrame:(CGRect)frame centerItem:(UIButton *)item menuItems:(NSArray <UIButton *>*)items;

- (void)addMenuItem:(UIButton *)item;
- (void)addMenuItems:(NSArray <UIButton *>*)items;

- (void)removeMenuItemAtIndex:(NSInteger)index;
- (void)removeAllMenuItems;

- (void)replaceMenuWithItems:(NSArray <UIButton *>*)items;
- (UIButton *)itemAtIndex:(NSUInteger)index;

- (void)open;
- (void)close;

+ (HLPopMenu *)menuWithType:(HLPopMenuStyle)type;
@end
