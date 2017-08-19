//
//  Question.m
//  0.1图片的缩放
//
//  Created by 周飞飞 on 15-11-1.
//  Copyright (c) 2015年 罗鲣. All rights reserved.
//

#import "Question.h"

@implementation Question


-(instancetype)initWithDict:(NSDictionary *)dict
{
    self=[super init];
    if (self) {
        
        [self setValuesForKeysWithDictionary:dict];//KVC大招
        
    }
    return self;
}


+(instancetype)questionWithDict:(NSDictionary *)dict

{
    return [[self alloc]initWithDict:dict];
}

+(NSArray *)questions
{
    //    NSString*path=[[NSBundle mainBundle] pathForResource:@"questions.plist" ofType:nil];
    //    NSArray*array=[NSArray arrayWithContentsOfFile:path];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"questions.plist" ofType:nil]];
    
    
    NSMutableArray*arrayM=[NSMutableArray array];
    NSDictionary*dict;
    for (dict in array ) {
        [arrayM addObject:[Question questionWithDict:dict]];
        
        
    }
    NSLog(@"%@",dict);
    return arrayM;
    
}
@end
