//
//  PostedJobs.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/25/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostedJobs : NSObject{
    
    NSMutableArray *anArray;
}

- (void)addObject:(id)anObject;
- (NSUInteger)count;
- (id)objectAtIndex:(NSUInteger)index;

@end
