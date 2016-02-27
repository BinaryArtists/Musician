//
//  Teacher.h
//  SwiftProject
//
//  Created by qingqing on 16/2/16.
//  Copyright © 2016年 王涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teacher : NSObject

- (instancetype)initWithName:(NSString *)name;

- (NSString *)introduceSelf;

+ (instancetype)teacher2WithAliasName:(NSString *)name;

+ (NSString *)teacherWithAliasName;

@end