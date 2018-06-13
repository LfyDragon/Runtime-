//
//  ViewController.m
//  MethodSel
//
//  Created by ios2chen on 2018/6/12.
//  Copyright © 2018年 Lfy. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"


@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[[Person alloc]init] sendMessage:@"Hello"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
