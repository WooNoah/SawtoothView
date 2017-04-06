# SawtoothView

最近遇到一些需求，要求页面内显示一个锯齿类型的view,前几天刚好研究了Core Graphics，所以趁热打铁，这里是一种自我实现，如果有发现问题的话，还请各位高手指正！

**先放上效果图**
![效果图](http://upload-images.jianshu.io/upload_images/1241385-2fd98647a3db3e83.png)

```
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


//调用的话
    SawtoothView *saw1 = [[SawtoothView alloc]init];
    saw1.frame = CGRectMake(50, 50, 200, 100);
    saw1.backgroundColor = RandomColor;
    [saw1 setColor:RandomColor waveViewHeight:50 waveCount:20 haveTopSawtooth:YES topColor:RandomColor haveBottomSawtooth:YES bottomColor:RandomColor];
    [self.view addSubview:saw1];
```
