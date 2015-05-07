//
//  HeaderView.m
//  TuanGou
//
//  Created by 张国礼 on 15/5/6.
//  Copyright (c) 2015年 wanshangweimeng. All rights reserved.
//

#define ImageCount 5
#define IMGBTN_START_TAG 1000

#import "HeaderView.h"

@interface HeaderView ()<UIScrollViewDelegate>

@property(nonatomic,weak) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation HeaderView

+ (instancetype)headerView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:nil options:nil] lastObject];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // 0.一些固定的尺寸参数
    
    CGFloat imageW = [[UIScreen mainScreen] bounds].size.width;
    CGFloat imageH = self.scrollView.frame.size.height;
    CGFloat imageY = 0;
    
    // 1.添加5张图片到scrollView中
    for (int i = 0; i<ImageCount; i++) {
        
        UIButton *imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        UIImageView *imageView = [[UIImageView alloc] init];
        
        // 设置frame
        CGFloat imageX = i * imageW;
        imageBtn.frame = CGRectMake(imageX, imageY, imageW, imageH);
        
        // 设置图片
        NSString *name = [NSString stringWithFormat:@"ad_0%d", i];
        [imageBtn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal] ;
        [imageBtn setHighlighted:NO];
        [imageBtn setTag:(IMGBTN_START_TAG + i)];
        [imageBtn addTarget:self action:@selector(imageBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:imageBtn];
    }
    
    // 2.设置内容尺寸
    CGFloat contentW = ImageCount * imageW;
    self.scrollView.contentSize = CGSizeMake(contentW, 0);
    
    // 3.隐藏水平滚动条
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    // 4.分页
    self.scrollView.pagingEnabled = YES;
    //    self.scrollView.delegate = self;
    
    // 5.设置pageControl的总页数
    self.pageControl.numberOfPages = ImageCount;
    
    // 6.添加定时器(每隔2秒调用一次self 的nextImage方法)
    [self addTimer];
}


- (void)imageBtnClicked:(id)sender
{
    UIButton *clickedBtn = (UIButton *)sender;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(headerView:clickedIndex:)]) {
        [self.delegate headerView:self clickedIndex:(clickedBtn.tag - IMGBTN_START_TAG)];
    }
}
/**
 *  添加定时器
 */
- (void)addTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

/**
 *  移除定时器
 */
- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)nextImage
{
    // 1.增加pageControl的页码
    int page = 0;
    if (self.pageControl.currentPage == ImageCount - 1) {
        page = 0;
    } else {
        page = self.pageControl.currentPage + 1;
    }
    
    // 2.计算scrollView滚动的位置
    CGFloat offsetX = page * self.scrollView.frame.size.width;
    CGPoint offset = CGPointMake(offsetX, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}

#pragma mark - 代理方法
/**
 *  当scrollView正在滚动就会调用
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 根据scrollView的滚动位置决定pageControl显示第几页
    CGFloat scrollW = scrollView.frame.size.width;
    int page = (scrollView.contentOffset.x + scrollW * 0.5) / scrollW;
    self.pageControl.currentPage = page;
}

/**
 *  开始拖拽的时候调用
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 停止定时器(一旦定时器停止了,就不能再使用)
    [self removeTimer];
}

/**
 *  停止拖拽的时候调用
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    // 开启定时器
    [self addTimer];
}



@end
