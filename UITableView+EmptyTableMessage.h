//
//  UITableView+EmptyTableMessage.h
//  ZBCool
//
//  Created by wangweiyi on 16/5/20.
//  Copyright © 2016年 i-chou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (EmptyTableMessage)

@property (nonatomic,strong) UIView *emptyBackView;
@property (nonatomic,strong) UIImageView *emptyIconImgView;
@property (nonatomic,strong) UILabel *emptyTitleLabel;
@property (nonatomic,strong) UILabel *emptySubTitleLabel;

- (void)showEmpty:(BOOL)isShow
         withIcon:(UIImage *)img
       emptyTitle:(NSString *)title
    emptySubTitle:(NSString *)subTitle
       ClickBlock:(void (^)())clickBlock;

@end
