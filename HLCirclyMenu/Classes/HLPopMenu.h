//
//  HLPopMenu.h
//  HLCirclyMenu
//
//  Created by HanLiu on 2018/3/19.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,HLPopMenuStyle) {
    HLPopMenuStyleSector = 0, //扇形展开
    HLPopMenuStyleLiner //直线展开
};

@protocol HLPopButtonDelegate <NSObject>

- (void)didSelectItem:(UIButton *)item atIndex:(NSInteger)index;

@end
@interface HLPopMenu : UIView


///设置中心按钮的使能状态
@property (nonatomic,assign) BOOL enableCenterBtn;

@property (nonatomic,assign,getter=isExpanded) BOOL expanded;

///中心按钮到菜单按钮的距离（中心点距离）
@property (nonatomic,assign) CGFloat distance;



///展开/关闭动画的时间
@property (nonatomic,assign) CGFloat animationTimeInterval;

@property (nonatomic,weak)id <HLPopButtonDelegate>delegate;

#pragma mark - Method
- (instancetype)initWithCenterItem:(UIButton *)item menuItems:(NSArray <UIButton *>*)items;

- (instancetype)initWithFrame:(CGRect)frame centerItem:(UIButton *)item menuItems:(NSArray <UIButton *>*)items;
@property (nonatomic,strong) UIButton *centerBtn;
@property (nonatomic,strong) NSMutableArray *menuItemsArray;

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
