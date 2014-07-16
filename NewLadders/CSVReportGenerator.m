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

@implementation CSVReportGenerator{
    NSString *gReportString;
}

-(NSString*)prepareReport:(JobApplications *)jobApplications withTitle:(NSString *)title{
    gReportString = [NSString stringWithFormat:@"Job Application Report,%@\n JOB SEEKER, JOB DETAILS, APP DATE\n",title];
//    id<IReportStringGenerator> csvReportString = [[CSVReportStringGenerator alloc]initWithString:headerString];
//    gReportString = [jobApplications generateReportBodyForString:csvReportString];
    
    
    
    id<IJobApplication> jobApplication;
    for (int i =0; i< [jobApplications count]; i++) {
        jobApplication = [jobApplications jobApplicationAtIndex:i];
        [jobApplication callToAppendJobSeekerToJobApplicationReport:self];
        gReportString = [gReportString stringByAppendingString:@","];
        [jobApplication callToAppendJobToJobApplicationReport:self];
        gReportString = [gReportString stringByAppendingString:@","];
        gReportString = [gReportString stringByAppendingString:[self formatDateForReport:title]];
        gReportString = [gReportString stringByAppendingString:@"\n"];
    }
    [self writeReport:gReportString ToFile:title];
    return gReportString;
}

-(void)appendToReportString:(NSString*)reportSubString{
    if(gReportString==nil){
        gReportString = @"";
    }
    gReportString = [gReportString stringByAppendingString:reportSubString];
}

-(NSString*)formatDateForReport:(NSString*)dateStr{
    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyyMMdd"];
    NSDate *date = [dateFormat dateFromString:dateStr];
    
    // Convert date object to desired output format
    [dateFormat setDateFormat:@"dMMMMYYYY"];
    return [dateFormat stringFromDate:date];
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
