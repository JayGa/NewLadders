//
//  MutableArrayWrap.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/23/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "MutableArrayWrap.h"

@implementation MutableArrayWrap

-(MutableArrayWrap*)init{
    self = [super init];
    maWrap = [[NSMutableArray alloc]init];
    return self;
}

- (void)addObject:(id)anObject{
    
    [maWrap addObject:anObject];
}

- (NSUInteger)count{
    return [maWrap count];
}

- (id)objectAtIndex:(NSUInteger)index{

    return [maWrap objectAtIndex:index];
}
@end