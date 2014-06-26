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

@implementation CSVReportGenerator

-(NSString*)prepareReport:(JobApplications *)dataArray withTitle:(NSString *)title{
    NSString *cVSReportString = [NSString stringWithFormat:@"Job Application Report,%@\nJOBID, JOBSEEKER\n ",title];
    id<IJobApplication> jobApplication;
    for (int i =0; i< [dataArray count]; i++) {
        jobApplication = [dataArray jobApplicationAtIndex:i];
        [jobApplication appendJobApplicationReportRecordTo:cVSReportString];
    }
    NSLog(@"CVS report is:%@", cVSReportString);
    [self writeReport:cVSReportString ToFile:title];
    return cVSReportString;
}

-(void)writeReport:(NSString *)content ToFile:(NSString *)title{
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
