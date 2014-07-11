//
//  Resumes.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/25/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Resume.h"

@interface Resumes : NSObject{
    
    NSMutableArray *anArray;
}

- (void)addResume:(Resume*)resume;
- (Resume*)resumeAtIndex:(NSUInteger)index;
- (NSUInteger)count;
- (BOOL)containsResumeWithID:(Resume*)resume;
@end