//
//  SavedJobs.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/25/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "SavedJobs.h"

@implementation SavedJobs

-(SavedJobs*)init{
    self = [super init];
    anArray = [[NSMutableArray alloc]init];
    return self;
}

- (void)addASavedJob:(id<IJob>)job{
    
    [anArray addObject:job];
}

- (NSUInteger)count{
    return [anArray count];
}

- (id<IJob>)savedJobAtIndex:(NSUInteger)index{
    
    return [anArray objectAtIndex:index];
}
@end
