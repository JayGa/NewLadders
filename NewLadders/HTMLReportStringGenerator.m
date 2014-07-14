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
- (NSString*)appendJobApplicationReportWithJobseekerDetail:(NSString*)jobseekerDetail jobDetail:(NSString*)jobDetail jobAppliedDate:(NSString*)applicationDateString{
    return [NSString stringWithFormat:@"%@<tr><td>%@</td><td>%@</td><td>%@</td></tr>",gReportString, jobseekerDetail, jobDetail, applicationDateString];
}
@end
