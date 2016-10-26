//
//  SingleChooseViewView.m
//  ReleaseDemo
//
//  Created by trq on 16/9/1.
//  Copyright © 2016年 fanyu. All rights reserved.
//

#import "XJSingleChooseView.h"

#import <Masonry.h>

#define xjDistanceOfContentFromBorder 12
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation XJSingleChooseView

- (id)init {
    
    if (self = [super init]) {
        
        _heightOfButton = 26;
        _widthOfButton = 70;
        _numOfSingleRow = 3;
        
    }
    return self;
}

- (void)setArrayContent:(NSArray *)arrayContent {
    
    _arrayContent = arrayContent;
    
    
    NSInteger num = arrayContent.count;
    for (NSInteger i = 0; i < num; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [button setBackgroundImage:[UIImage imageNamed:@"ico_heibanbaoanniu"] forState:UIControlStateNormal];
        
        [self addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(xjDistanceOfContentFromBorder+(xjDistanceOfContentFromBorder+self.heightOfButton)*(i/self.numOfSingleRow));
            make.left.mas_equalTo((xjDistanceOfContentFromBorder+self.widthOfButton)*(i%self.numOfSingleRow));
            make.height.mas_equalTo(self.heightOfButton);
            make.width.mas_equalTo(self.widthOfButton);
            
        }];
        
        [button setTitle:arrayContent[i] forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [button setTitleColor:UIColorFromRGB(0xe1ba83) forState:UIControlStateNormal];
        
        button.tag = i;
        
        [button addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        //默认选择第一个按钮
        if (i == 0) {
            
            self.currentSelect = i;
            [button setBackgroundImage:[UIImage imageNamed:@"ico_dontaianniu"] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(singleChooseView:selectedAtIndex:)]) {
                
                [self.delegate singleChooseView:self selectedAtIndex:0];
                
            }
            
            
        }
        
    }
    
    NSInteger rows = self.arrayContent.count / self.numOfSingleRow;
    
    if (self.arrayContent.count % self.numOfSingleRow) {
        rows++;
    }
    
    CGFloat width = self.numOfSingleRow*(xjDistanceOfContentFromBorder+self.widthOfButton)+xjDistanceOfContentFromBorder;
    
    CGFloat height = rows*(xjDistanceOfContentFromBorder+self.heightOfButton)+xjDistanceOfContentFromBorder;
    
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(width);
        
        make.height.mas_equalTo(height);
        
    }];
    
}

- (void)btnClicked:(UIButton *)button {
    
    NSArray *arrayViews = [self subviews];
    
    for (UIView *vv in arrayViews) {
        
        UIButton *bb = (UIButton *)vv;
        
        [bb setTitleColor:UIColorFromRGB(0xe1ba83) forState:UIControlStateNormal];
        [bb setBackgroundImage:[UIImage imageNamed:@"ico_heibanbaoanniu"] forState:UIControlStateNormal];
        
    }
    
    [button setBackgroundImage:[UIImage imageNamed:@"ico_dontaianniu"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(singleChooseView:selectedAtIndex:)]) {
        
        [self.delegate singleChooseView:self selectedAtIndex:button.tag];
        
    }
    
    
    self.currentSelect = button.tag;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
