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

- (NSString*)appendJobApplicationReportWithJobseekerDetail:(NSString*)jobseekerDetail andJobDetail:(NSString*)jobDetail{

    return [NSString stringWithFormat:@"%@%@, %@\n",gReportString, jobseekerDetail, jobDetail];
}
@end
