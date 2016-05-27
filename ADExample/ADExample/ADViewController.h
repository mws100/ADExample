//
//  ADViewController.h
//  ADExample
//
//  Created by 马文帅 on 16/5/27.
//  Copyright © 2016年 ekeguan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADItem.h"

@interface ADViewController : UIViewController
@property (nonatomic, copy) void(^completion)(ADItem *item);
@end
