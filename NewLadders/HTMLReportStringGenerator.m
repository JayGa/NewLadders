//
//  HTMLReportStringGenerator.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/27/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "HTMLReportStringGenerator.h"

@implementation HTMLReportStringGenerator

-(id<IReportStringGenerator>)initWithString:(NSString*)aString{
    self = [super init];
    gReportString = aString;
    return self;
}
- (NSString*)callToAppendJobApplicationReportWithJobseeker:(Jobseeker*)aJobseeker job:(id<IJob>)aJob jobAppliedDate:(NSString*)applicationDateString{
    
//    NSString *returnString = @"<tr><td>";
//    NSString *stringWithJobSeekerData = [aJobseeker callToAppendJobApplicationReportElements:returnString];
//    stringWithJobSeekerData = [stringWithJobSeekerData stringByAppendingString:@"</td><td>"];
//    
//    NSString *stringWithJobNJobSeekerData = [aJob callToAppendJobToApplicationReport:stringWithJobSeekerData];
//    
//    return [NSString stringWithFormat:@"%@</td><td>%@</td></tr>", stringWithJobNJobSeekerData, applicationDateString];
return @"";
}


@end
