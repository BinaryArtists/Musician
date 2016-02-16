//
//  Teacher.m
//  SwiftProject
//
//  Created by qingqing on 16/2/16.
//  Copyright © 2016年 王涛. All rights reserved.
//

#import "Teacher.h"

@interface Teacher ()

@property (nonatomic, strong) NSString *name;

@end

@implementation Teacher

- (instancetype)init {
    NSAssert(NO, @"should use other initializer.");
    
    return nil;
}

- (instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {
        _name = name;
    }
    
    return self;
}

- (NSString *)introduceSelf {
    return [NSString stringWithFormat:@"My name is %@, I am a %@", self.name, NSStringFromClass(self.class)];
}

@end
