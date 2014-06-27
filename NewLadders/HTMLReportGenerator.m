//
//  HTMLReportGenerator.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/17/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "HTMLReportGenerator.h"
#import "IReport.h"
#import "IJobApplication.h"
#import "HTMLReportString.h"

@implementation HTMLReportGenerator

-(HTMLReportString*)prepareReport:(JobApplications *)dataArray withTitle:(NSString *)title{
 
    HTMLReportString *hTMLReportString = [HTMLReportString appedReportWith:@"<p>Job Application Report: %@</p><table><tr><th>JOB ID</th><th>JOB SEEKER</th></tr>", title];
    id<IJobApplication> jobApplication;
    for (int i =0; i< [dataArray count]; i++) {
        jobApplication = [dataArray jobApplicationAtIndex:i];
        [jobApplication appendJobApplicationReportRecordTo:hTMLReportString];
    }
    hTMLReportString = [HTMLReportString appedReportWith:@"%@</table>",hTMLReportString];
    NSLog(@"CVS report is:%@", hTMLReportString);
//    [self writeReport:hTMLReportString ToFile:title];
    return hTMLReportString;
}

//-(void)writeReport:(HTMLReportString *)content ToFile:(NSString *)title{
//    //get the documents directory:
//    NSArray *paths = NSSearchPathForDirectoriesInDomains
//    (NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    
//    //make a file name to write the data to using the documents directory:
//    NSString *fileName = [NSString stringWithFormat:@"%@/JobApplicationReport_%@.html",
//                          documentsDirectory, title];
//    //save content to the documents directory
//    [content writeToFile:fileName
//              atomically:NO
//                encoding:NSStringEncodingConversionAllowLossy
//                   error:nil];
//    
//}


@end
