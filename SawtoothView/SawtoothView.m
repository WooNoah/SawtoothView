//
//  SawtoothView.m
//
//  Created by Noah on 17/4/2.
//  Copyright © 2017年 tb. All rights reserved.
//

#import "SawtoothView.h"

#define kScreen_Width [UIScreen mainScreen].bounds.size.width
#define kScreen_Height [UIScreen mainScreen].bounds.size.height

@interface SawtoothView() {
    //锯齿个数
    int waveCount;
    //锯齿view背景色
    UIColor *bgColor;
    //整个锯齿view高度
    CGFloat viewHeight;
    
    //是否有上部分锯齿
    BOOL haveTop;
    //锯齿上部view颜色
    UIColor *viewTopColor;
    //是否有上部分锯齿
    BOOL haveBottom;
    //齿轮下边颜色
    UIColor *viewBottomColor;
    
}

@end

@implementation SawtoothView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
#pragma mark - 第一步：获取上下文
    //获取绘图上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
#pragma mark - 第二步：构建路径
    if (waveCount <= 0) {
        waveCount = 30;//默认30个
    }
    
    //单个波浪线的宽度
    CGFloat itemWidth = kScreen_Width/waveCount;
    //单个波浪线的高度
    CGFloat itemHeight = 10;
    //整个view的大小
    if (viewHeight <= 0) {
        viewHeight = 50;//默认50大小
    }
    
    //背景色
    if (bgColor == nil) bgColor = [UIColor blackColor];
    
    if (viewTopColor == nil) viewTopColor = [UIColor whiteColor];
    
    if (viewBottomColor == nil) viewBottomColor = [UIColor whiteColor];
    
    //移动到起始点,从左上画到右上
    CGContextMoveToPoint(ctx, 0, 0);
    
    if (haveTop) {
        for (int i = 0; i<waveCount; i++) {
            int nextX = (i+1)*itemWidth;
            
            CGContextAddLineToPoint(ctx, nextX - itemWidth*0.5, itemHeight);
            CGContextAddLineToPoint(ctx, nextX, 0);
        }
    }else {
        CGContextAddLineToPoint(ctx, kScreen_Width, 0);
    }

    //右上移动到右下角
    CGContextAddLineToPoint(ctx, kScreen_Width, viewHeight);
    
    //右下角画到左下角
    if (haveBottom) {
        for(int i = waveCount+1;i > 0;i--){
            int preX = (i-1)*itemWidth;
            CGContextAddLineToPoint(ctx, preX - itemWidth*0.5, viewHeight - itemHeight);
            CGContextAddLineToPoint(ctx, preX - itemWidth, viewHeight);
        }
    }else {
        CGContextAddLineToPoint(ctx, 0, viewHeight);
    }

    
#pragma mark - 第三步：将路径画到view上
    //    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    CGContextSetFillColorWithColor(ctx, bgColor.CGColor);
    CGContextFillPath(ctx);
    
    if (haveTop) {
        //开始画顶部的填充图
        CGContextMoveToPoint(ctx, 0, 0);
        for (int i = 0 ; i<waveCount; i++) {
            int nextX = (i+1)*itemWidth;
            CGContextAddLineToPoint(ctx, nextX - itemWidth*0.5, itemHeight);
            CGContextAddLineToPoint(ctx, nextX, 0);
        }
        CGContextSetFillColorWithColor(ctx, viewTopColor.CGColor);
        CGContextAddLineToPoint(ctx, kScreen_Width, 0);
        CGContextAddLineToPoint(ctx, 0, 0);
        CGContextFillPath(ctx);
    }

    
    if (haveBottom) {
        //开始画底部的填充图
        CGContextMoveToPoint(ctx, 0, viewHeight);
        for (int i = 0 ; i<waveCount; i++) {
            int nextX = (i+1)*itemWidth;
            CGContextAddLineToPoint(ctx, nextX - itemWidth*0.5, viewHeight - itemHeight);
            CGContextAddLineToPoint(ctx, nextX, viewHeight);
        }
        CGContextSetFillColorWithColor(ctx, viewBottomColor.CGColor);
        CGContextAddLineToPoint(ctx, kScreen_Width, viewHeight);
        CGContextAddLineToPoint(ctx, 0, viewHeight);
        CGContextFillPath(ctx);
    }
}

/**
 *  设置锯齿背景颜色、锯齿个数、锯齿view的高度
 *
 *  @param bgcolor      view背景色
 *  @param vHeight      整个锯齿view的高度
 *  @param count        锯齿个数
 *  @param hasTop       是否有上部分的锯齿
 *  @param topColor     顶部颜色
 *  @param hasBottom    是否有下部分的锯齿
 *  @param bottomColor  下部分锯齿颜色
 */
-(void)setColor:(UIColor *)bgcolor waveViewHeight:(CGFloat)vHeight waveCount:(int)count haveTopSawtooth:(BOOL)hasTop topColor:(UIColor *)topColor haveBottomSawtooth:(BOOL)hasBottom bottomColor:(UIColor *)bottomColor {
    bgColor = bgcolor;
    viewHeight = vHeight;
    waveCount = count;
    
    haveTop = hasTop;
    viewTopColor = topColor;
    
    haveBottom = hasBottom;
    viewBottomColor = bottomColor;
    
    [self setNeedsDisplay];
}

@end
