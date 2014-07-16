//
//  JobApplications.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/23/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

@protocol IJobApplication;
@protocol IReportStringGenerator;
#import <Foundation/Foundation.h>
#import "IJobApplication.h"
#import "IReportStringGenerator.h"

@interface JobApplications : NSObject{
 
    NSMutableArray *anArray;
}

- (void)addJobApplication:(id<IJobApplication>)jobApplication;
- (id<IJobApplication>)jobApplicationAtIndex:(NSUInteger)index;
- (NSUInteger)count;
- (NSString*)generateReportBodyForString:(id<IReportStringGenerator>)reportGeneratorString;

@end
