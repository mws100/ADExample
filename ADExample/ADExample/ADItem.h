//
//  ADItem.h
//  ADExample
//
//  Created by 马文帅 on 16/5/27.
//  Copyright © 2016年 ekeguan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADItem : NSObject

/** 图片URL */
@property (nonatomic, copy) NSString *imageURL;
/** 倒计时展示时间 */
@property (nonatomic, copy) NSString *second;
/** 广告页是否可见 */
@property (nonatomic, assign) BOOL visiable;
/** web要加载的url，为空时表示广告不能点击 */
@property (nonatomic, copy) NSString *adURL;

@end
