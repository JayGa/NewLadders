//
//  JobsForEmployers.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/23/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JobsForEmployers.h"

@implementation JobsForEmployers

-(JobsForEmployers*)init{
    self = [super init];
    aDictionary = [[NSMutableDictionary alloc]init];
    return self;
}
- (id)objectForKey:(id)aKey{
    
    return [aDictionary objectForKey:aKey];
}
- (void)setObject:(id)anObject forKey:(id <NSCopying>)aKey{
    
    [aDictionary setObject:anObject forKey:aKey];
}
- (void)setValue:(id)value forKey:(NSString *)key{
    [aDictionary setValue:value forKey:key];
}


@end
