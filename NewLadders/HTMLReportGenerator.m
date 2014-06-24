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

@implementation HTMLReportGenerator

-(NSString*)prepareReport:(MutableArrayWrap *)dataArray withTitle:(NSString *)title{
 
    NSString *returnString = [NSString stringWithFormat:@"<p>Job Application Report: %@</p><table><tr><th>JOB ID</th><th>JOB SEEKER</th></tr>", title];
    id<IJobApplication> jobApplication;
    for (int i =0; i< [dataArray count]; i++) {
        jobApplication = [dataArray objectAtIndex:i];
        returnString = [NSString stringWithFormat:@"%@<tr><td>%@</td><td>%@</td></tr>",returnString, [jobApplication jobID], [jobApplication jobseekerID]];
    }
    returnString = [NSString stringWithFormat:@"%@</table>",returnString];
    NSLog(@"CVS report is:%@", returnString);
    [self writeReport:returnString ToFile:title];
    return returnString;
}

-(void)writeReport:(NSString *)content ToFile:(NSString *)title{
    //get the documents directory:
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //make a file name to write the data to using the documents directory:
    NSString *fileName = [NSString stringWithFormat:@"%@/JobApplicationReport_%@.html",
                          documentsDirectory, title];
    //save content to the documents directory
    [content writeToFile:fileName
              atomically:NO
                encoding:NSStringEncodingConversionAllowLossy
                   error:nil];
    
}


@end
