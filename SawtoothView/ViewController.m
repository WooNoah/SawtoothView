//
//  ViewController.m
//  SawtoothView
//
//  Created by 吴迪 on 17/4/6.
//  Copyright © 2017年 Noah. All rights reserved.
//

#import "ViewController.h"
#import "SawtoothView.h"

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RandomColor RGB(arc4random()%256,arc4random()%256,arc4random()%256)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    SawtoothView *saw1 = [[SawtoothView alloc]init];
    saw1.frame = CGRectMake(50, 50, 200, 100);
    saw1.backgroundColor = RandomColor;
    [saw1 setColor:RandomColor waveViewHeight:50 waveCount:20 haveTopSawtooth:YES topColor:RandomColor haveBottomSawtooth:YES bottomColor:RandomColor];
    [self.view addSubview:saw1];
    
    SawtoothView *saw2 = [[SawtoothView alloc]init];
    saw2.frame = CGRectMake(50, 200, 200, 50);
    saw2.backgroundColor = RandomColor;
    [saw2 setColor:RandomColor waveViewHeight:80 waveCount:20 haveTopSawtooth:YES topColor:RandomColor haveBottomSawtooth:YES bottomColor:RandomColor];
    [self.view addSubview:saw2];
    
    SawtoothView *saw3 = [[SawtoothView alloc]init];
    saw3.frame = CGRectMake(50, 300, 200, 50);
    saw3.backgroundColor = RandomColor;
    [saw3 setColor:RandomColor waveViewHeight:150 waveCount:20 haveTopSawtooth:YES topColor:RandomColor haveBottomSawtooth:YES bottomColor:RandomColor];
    [self.view addSubview:saw3];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
