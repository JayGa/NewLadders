//
//  CSVReportStringGenerator.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/27/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "CSVReportStringGenerator.h"

@implementation CSVReportStringGenerator


-(id<IReportStringGenerator>)initWithString:(NSString*)aString{
self = [super init];
    gReportString = aString;
    return self;
}

- (NSString*)appendJobApplicationReportWithJobID:(IDentifer*)jobID andJobseekerID:(IDentifer*)jobseekerID{

    return [NSString stringWithFormat:@"%@%@, %@\n",gReportString, jobID, jobseekerID];
}
@end
