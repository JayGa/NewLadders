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
- (NSString*)appendJobApplicationReportWithJobseeker:(Jobseeker*)aJobseeker job:(id<IJob>)aJob jobAppliedDate:(NSString*)applicationDateString{
    
    NSString *returnString = @"<tr><td>";
    NSString *stringWithJobSeekerData = [aJobseeker appendJobApplicationReportElements:returnString];
    stringWithJobSeekerData = [stringWithJobSeekerData stringByAppendingString:@"</td><td>"];
    
    NSString *stringWithJobNJobSeekerData = [aJob appendJobApplicationReportElements:stringWithJobSeekerData];
    
    return [NSString stringWithFormat:@"%@</td><td>%@</td></tr>", stringWithJobNJobSeekerData, applicationDateString];
}
@end
