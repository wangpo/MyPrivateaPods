//
//  ViewController.m
//  PrivatePodDemo
//
//  Created by wangpo on 2018/4/17.
//  Copyright © 2018年 wangpo. All rights reserved.
//

#import "ViewController.h"
#import "DiskLog.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [DiskLog printLogtoDisk:@"" prefix:@""];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
