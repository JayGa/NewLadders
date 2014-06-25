//
//  JobApplications.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/23/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JobApplications.h"

@implementation JobApplications

-(JobApplications*)init{
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