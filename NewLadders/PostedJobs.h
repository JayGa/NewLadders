//
//  PostedJobs.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/25/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IJob.h"

@interface PostedJobs : NSObject{
    
    NSMutableArray *anArray;
}

- (void)addJob:(id<IJob>)job;
- (NSUInteger)count;
- (id<IJob>)jobAtIndex:(NSUInteger)index;

@end
