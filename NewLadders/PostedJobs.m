//
//  PostedJobs.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/25/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "PostedJobs.h"

@implementation PostedJobs

-(PostedJobs*)init{
    self = [super init];
    anArray = [[NSMutableArray alloc]init];
    return self;
}

- (void)addObject:(id)anObject{
    
    [anArray addObject:anObject];
}

- (NSUInteger)count{
    return [anArray count];
}

- (id)objectAtIndex:(NSUInteger)index{
    
    return [anArray objectAtIndex:index];
}
@end
