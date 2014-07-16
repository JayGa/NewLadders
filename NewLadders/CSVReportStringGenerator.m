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

- (NSString*)callToAppendJobApplicationReportWithJobseeker:(Jobseeker*)aJobseeker job:(id<IJob>)aJob jobAppliedDate:(NSString*)applicationDateString{
    
//    gReportString = @"";
//    
//    [aJobseeker callToAppendJobSeekerToApplicationReport:<#(JobApplicationCoreFields *)#>:self];
//    gReportString = [gReportString stringByAppendingString:@","];
//    
//    [aJob callToAppendJobToApplicationReport:self];
//    NSString *stringWithJobNJobSeekerData = [strinWithJobSeekerData stringByAppendingString:];
//    return [NSString stringWithFormat:@"%@, %@\n", stringWithJobNJobSeekerData, applicationDateString];
return @"";
}

-(void)appendToReportString:(NSString*)reportSubString{
    gReportString = @"";
    [gReportString stringByAppendingString:reportSubString];
}
@end
