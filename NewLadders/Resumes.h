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

- (void)addResumes:(Resume*)resume;
- (NSUInteger)count;
- (Resume*)resumeAtIndex:(NSUInteger)index;

@end