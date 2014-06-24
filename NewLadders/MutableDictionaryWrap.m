//
//  MutableDictionaryWrap.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/23/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "MutableDictionaryWrap.h"

@implementation MutableDictionaryWrap

-(MutableDictionaryWrap*)init{
    self = [super init];
    mdWrap = [[NSMutableDictionary alloc]init];
    return self;
}
- (id)objectForKey:(id)aKey{
    
    return [mdWrap objectForKey:aKey];
}
- (void)setObject:(id)anObject forKey:(id <NSCopying>)aKey{
    
    [mdWrap setObject:anObject forKey:aKey];
}
- (void)setValue:(id)value forKey:(NSString *)key{
    [mdWrap setValue:value forKey:key];
}

@end
