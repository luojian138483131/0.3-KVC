//
//  Question.h
//  0.1图片的缩放
//
//  Created by 周飞飞 on 15-11-1.
//  Copyright (c) 2015年 罗鲣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Question : NSObject
/** 答案 */
@property (nonatomic, copy) NSString *answer;
/** 提示文字 */
@property (nonatomic, copy) NSString *title;
/** 图片名称 */
@property (nonatomic, copy) NSString *icon;
/** 备选文字数组 */
@property (nonatomic, strong) NSArray *options;
/** 图像 */
@property (nonatomic, strong, readonly) UIImage *image;

/** 图像 */
//@property (nonatomic, strong, readonly) UIImage *image;
/**用字典实例化对象的成员方法*/
-(instancetype)initWithDict:(NSDictionary*)dict;

/**工厂方法  用字典实例化对象的类方法*/
+(instancetype)questionWithDict:(NSDictionary*)dict;
/**从plist加载对象数组*/
+(NSArray*)questions;

@end
