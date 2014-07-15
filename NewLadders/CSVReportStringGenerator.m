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

- (NSString*)appendJobApplicationReportWithJobseeker:(Jobseeker*)aJobseeker job:(id<IJob>)aJob jobAppliedDate:(NSString*)applicationDateString{
    
    NSString *returnString = @"";
    NSString *strinWithJobSeekerData = [aJobseeker appendJobApplicationReportElements:returnString];
    strinWithJobSeekerData = [strinWithJobSeekerData stringByAppendingString:@","];
    NSString *stringWithJobNJobSeekerData = [strinWithJobSeekerData stringByAppendingString:[aJob appendJobApplicationReportElements:strinWithJobSeekerData]];
    return [NSString stringWithFormat:@"%@, %@\n", stringWithJobNJobSeekerData, applicationDateString];
}
@end
