//
//  SingleChooseView.h
//  ReleaseDemo
//
//  Created by trq on 16/9/1.
//  Copyright © 2016年 fanyu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XJSingleChooseView;

@protocol XJSingleChooseViewDelegate <NSObject>

@optional
- (void)singleChooseView:(XJSingleChooseView *)singleChooseView selectedAtIndex:(NSInteger)index;

@end


@interface XJSingleChooseView : UIView

//必须设置
@property (nonatomic, strong) NSArray<NSString *> *arrayContent;
/**
 *  代理
 */
@property (nonatomic, assign) id <XJSingleChooseViewDelegate> delegate;


//当前的选项
@property (nonatomic, assign) NSInteger currentSelect;


@property (nonatomic, strong) UIFont *fontOfButtonTitle;

@property (nonatomic, strong) UIColor *colorOfButtonTitle;

@property (nonatomic, assign) NSInteger numOfSingleRow;//默认值为3
@property (nonatomic, assign) CGFloat heightOfButton;//设置默认值为20
@property (nonatomic, assign) CGFloat widthOfButton;//设置默认值为60


@end
