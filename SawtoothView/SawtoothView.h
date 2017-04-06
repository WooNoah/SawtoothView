//
//  SawtoothView.h
//
//  Created by Noah on 17/4/2.
//  Copyright © 2017年 tb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SawtoothView : UIView

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
-(void)setColor:(UIColor *)bgcolor waveViewHeight:(CGFloat)vHeight waveCount:(int)count haveTopSawtooth:(BOOL)hasTop topColor:(UIColor *)topColor haveBottomSawtooth:(BOOL)hasBottom bottomColor:(UIColor *)bottomColor;

@end
