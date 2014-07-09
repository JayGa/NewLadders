//
//  SavedJobs.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/25/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IJob.h"
#import "IJobApplication.h"

@interface SavedJobs : NSObject{
    
    NSMutableArray *anArray;
}

- (void)addASavedJob:(id<IJob>)job;
- (id<IJob>)savedJobAtIndex:(NSUInteger)index;
- (NSUInteger)count;
@end
