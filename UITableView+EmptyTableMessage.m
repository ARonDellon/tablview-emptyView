//
//  UITableView+EmptyTableMessage.m
//  ZBCool
//
//  Created by wangweiyi on 16/5/20.
//  Copyright © 2016年 i-chou. All rights reserved.
//

#import "UITableView+EmptyTableMessage.h"

static void *emptyBackViewKey = @"emptyBackViewKey";
static void *emptyimageViewKey = @"emptyimageViewKey";
static void *emptyTitleLabelKey = @"emptyTitleLabelKey";
static void *emptySubTitleLabelKey = @"emptySubTitleLabelKey";



@implementation UITableView (EmptyTableMessage)


- (void)showEmpty:(BOOL)isShow
         withIcon:(UIImage *)img
       emptyTitle:(NSString *)title
    emptySubTitle:(NSString *)subTitle
       ClickBlock:(void (^)())clickBlock {


    if (!isShow&&self.emptyBackView) {
        [self.emptyBackView removeFromSuperview];
        self.scrollEnabled = YES;
        return;
    }

    self.emptyBackView.frame = ccr(0, 0, SCREEN_WIDTH, 200);
    
    if (!img) {
        self.emptyIconImgView.frame = ccr(0, 10, 50, 50);
    }else {
        self.emptyIconImgView.frame = ccr(0, 10, img.size.width, img.size.height);
    }
    self.emptyIconImgView.userInteractionEnabled = YES;
    self.emptyIconImgView.image = img;
    self.emptyIconImgView.centerX = SCREEN_WIDTH/2;

    self.emptyTitleLabel.frame = ccr(0, CGRectGetMaxY(self.emptyIconImgView.frame)+10, SCREEN_WIDTH, 20);
    self.emptyTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.emptyTitleLabel.font = BFONT(14);
    self.emptyTitleLabel.text = title;

    CGFloat subtitleHeight = [Utils getLabelHeightFromString:subTitle WithFont:HSFONT(12) labelWidth:SCREEN_WIDTH];
    if (subtitleHeight<20) {
        subtitleHeight = 20;
    }
    self.emptySubTitleLabel.frame = ccr(0, CGRectGetMaxY(self.emptyTitleLabel.frame)+10, SCREEN_WIDTH, subtitleHeight);
    self.emptySubTitleLabel.font = HSFONT(12);
    self.emptySubTitleLabel.textColor = COLORRGB(0x787878);
    self.emptySubTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.emptySubTitleLabel.text = subTitle;

    self.emptyBackView.height = CGRectGetMaxY(self.emptySubTitleLabel.frame)+10;

    self.emptyBackView.y = SCREEN_HEIGHT/2-self.emptyBackView.height/2-NAV_BAR_HEIGHT_IOS7;
    if (!self.emptyBackView.subviews.count) {
        [self.emptyBackView addSubview:self.emptyIconImgView];
        [self.emptyBackView addSubview:self.emptyTitleLabel];
        [self.emptyBackView addSubview:self.emptySubTitleLabel];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
        [[tap rac_gestureSignal] subscribeNext:^(id x) {
            clickBlock();
            self.scrollEnabled = YES;
            [self.emptyBackView removeFromSuperview];
        }];
        [self.emptyBackView addGestureRecognizer:tap];

    }


    self.scrollEnabled = NO;
    [self addSubview:self.emptyBackView];

}

#pragma mark - add property

- (void)setEmptyBackView:(UIView *)emptyBackView {
    objc_setAssociatedObject(self, emptyBackViewKey, emptyBackView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)emptyBackView {
    UIView *result = objc_getAssociatedObject(self, emptyBackViewKey);
    if (!result) {
        result = [[UIView alloc]initWithFrame:CGRectZero];
        objc_setAssociatedObject(self, emptyBackViewKey, result, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return result;
}

- (void)setEmptyIconImgView:(UIImageView *)emptyIconImgView {
    objc_setAssociatedObject(self, emptyimageViewKey, emptyIconImgView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImageView *)emptyIconImgView {
    UIImageView *result = objc_getAssociatedObject(self, emptyimageViewKey);
    if (!result) {
        result = [[UIImageView alloc]initWithFrame:CGRectZero];
        objc_setAssociatedObject(self, emptyimageViewKey, result, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return result;
}


- (void)setEmptyTitleLabel:(UILabel *)emptyTitleLabel {
    objc_setAssociatedObject(self, emptyTitleLabelKey, emptyTitleLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)emptyTitleLabel {
    UILabel *result = objc_getAssociatedObject(self, emptyTitleLabelKey);
    if (!result) {
        result = [[UILabel alloc]initWithFrame:CGRectZero];
        objc_setAssociatedObject(self, emptyTitleLabelKey, result, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return result;
}

- (void)setEmptySubTitleLabel:(UILabel *)emptySubTitleLabel{
    objc_setAssociatedObject(self, emptySubTitleLabelKey, emptySubTitleLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)emptySubTitleLabel {
    UILabel *result = objc_getAssociatedObject(self, emptySubTitleLabelKey);
    if (!result) {
        result = [[UILabel alloc]initWithFrame:CGRectZero];
        objc_setAssociatedObject(self, emptySubTitleLabelKey, result, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return result;
}













@end
