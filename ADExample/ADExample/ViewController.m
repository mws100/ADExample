//
//  ViewController.m
//  ADExample
//
//  Created by 马文帅 on 16/5/27.
//  Copyright © 2016年 ekeguan. All rights reserved.
//

#import "ViewController.h"
#import "ADWebVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    self.navigationItem.title = @"首页";
    
    NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:@"key"];
    if (url) {
        ADWebVC *adWebVC = [[ADWebVC alloc] init];
        adWebVC.url = url;
        [self.navigationController pushViewController:adWebVC animated:NO];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"key"];
    }
}

@end
