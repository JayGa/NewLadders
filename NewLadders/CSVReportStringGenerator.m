//
//  CSVReportStringGenerator.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/27/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "CSVReportStringGenerator.h"

@implementation CSVReportStringGenerator


-(CSVReportStringGenerator)initWithString:(NSString)
-(NSString*)appendJobApplicationReportRecordTo:(NSString*)reportString{

    return [NSString stringWithFormat:@"%@%@, %@\n",reportString, jobID, jobseekerID];
}
@end
