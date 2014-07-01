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
#import "IReportStringGenerator.h"
#import "HTMLReportStringGenerator.h"

@implementation HTMLReportGenerator

-(NSString*)prepareReport:(JobApplications *)dataArray withTitle:(NSString *)title{
 
    HTMLReportString *htmlString = [HTMLReportString appedReportWith:@"<p>Job Application Report: %@</p><table><tr><th>JOB ID</th><th>JOB SEEKER</th></tr>", title];
    id<IJobApplication> jobApplication;
    id<IReportStringGenerator> htmlReportString = [[HTMLReportStringGenerator alloc]initWithString:htmlString];
    for (int i =0; i< [dataArray count]; i++) {
        jobApplication = [dataArray jobApplicationAtIndex:i];
        [jobApplication appendJobApplicationReportRecordTo:htmlReportString];
    }
    htmlReportString = [NSString stringWithFormat:@"%@</table>",htmlReportString];
    NSLog(@"CVS report is:%@", htmlReportString);
//    [self writeReport:hTMLReportString ToFile:title];
    return htmlReportString;
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
