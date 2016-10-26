#XJSingleChooseView


###功能
单选的视图：

* 用按钮展示数组中的字符串数据，这些按钮只能单选；
* 自动计算视图宽和高，默认按钮宽为70（*可设置*），默认按钮高为26
 （*可设置*），只须设置视图位置（Masonry left,top）；
* 如需要接收按钮响应事件，可实现代理方法（*非必须*）。

###第三方库
[Masonry][Masory]

[Masory]: https://github.com/SnapKit/Masonry

###使用
**导入**

	#import "XJSingleChooseView.h"
	#import <Masonry.h>
**遵守协议**

	@interface YourViewControllerName ()<XJSingleChooseViewDelegate>


**初始化**

	XJSingleChooseView *singleChooseView =
	[[XJSingleChooseView alloc] init];
    
    singleChooseView.backgroundColor = 
    [UIColor cyanColor];
    
    singleChooseView.arrayContent = 
    @[@"一",@"二",@"三",@"四"];
    [self.view addSubview:singleChooseView];
    
    [singleChooseView 
    mas_updateConstraints:^(MASConstraintMaker *make) {
        //只须设置位置信息
        make.top.mas_equalTo(200);
        make.left.mas_equalTo(100);
        
    }];
**如若须要知道当前所选按钮，可**
	
	NSLog(@"选择了%ld",singleChooseView.currentSelect);

**如若须要接收点击事件，须设置代理（默认会调用一次代理方法）**

	singleChooseView.delegate = self;
**代理方法**

	- (void)singleChooseView:(XJSingleChooseView *)singleChooseView
         selectedAtIndex:(NSInteger)index {
    	NSLog(@"选择了%ld",index);
	}

