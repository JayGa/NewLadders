//
//  IReportStringGenerator.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/27/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

@protocol IJob;
#import <Foundation/Foundation.h>
#import "IJob.h"
#import "Jobseeker.h"
@class Jobseeker;
@protocol IReportStringGenerator <NSObject>

-(id<IReportStringGenerator>)initWithString:(NSString*)aString;
-(NSString*)callToAppendJobApplicationReportWithJobseeker:(Jobseeker*)aJobseeker job:(id<IJob>)aJob jobAppliedDate:(NSString*)applicationDateString;
@end
