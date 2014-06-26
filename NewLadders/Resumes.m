//
//  Resumes.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/25/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "Resumes.h"

@implementation Resumes

-(Resumes*)init{
    self = [super init];
    anArray = [[NSMutableArray alloc]init];
    return self;
}

- (void)addResume:(Resume*)resume{
    
    [anArray addObject:resume];
}

- (NSUInteger)count{
    return [anArray count];
}

- (Resume*)resumeAtIndex:(NSUInteger)index{
    
    return [anArray objectAtIndex:index];
}
@end
