//
//  CSVReportGenerator.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/17/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "CSVReportGenerator.h"
#import "IReport.h"
#import "JobApplications.h"
#import "IJobApplication.h"
#import "CSVReportStringGenerator.h"

@implementation CSVReportGenerator

-(NSString*)prepareReport:(JobApplications *)jobApplications withTitle:(NSString *)title{
    NSString *cSVString = [NSString stringWithFormat:@"Job Application Report,%@\nJOBID, JOBSEEKER\n ",title];

    id<IReportStringGenerator> csvReportString = [[CSVReportStringGenerator alloc]initWithString:cSVString];
    
    NSString* csvStringToReturn = [jobApplications generateReportBodyForString:csvReportString];
    [self writeReport:csvStringToReturn ToFile:title];
    return csvStringToReturn;
}

-(void)writeReport:(NSString*)content ToFile:(NSString *)title{
    //get the documents directory:
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //make a file name to write the data to using the documents directory:
    NSString *fileName = [NSString stringWithFormat:@"%@/JobApplicationReport_%@.csv",
                          documentsDirectory, title];
    //save content to the documents directory
    [content writeToFile:fileName
              atomically:NO
                encoding:NSStringEncodingConversionAllowLossy
                   error:nil];
    
}

@end
