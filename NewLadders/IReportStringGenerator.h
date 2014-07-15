//
//  IReportStringGenerator.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/27/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDentifer.h"
#import "Jobseeker.h"

@protocol IReportStringGenerator <NSObject>

-(id<IReportStringGenerator>)initWithString:(NSString*)aString;
-(NSString*)appendJobApplicationReportWithJobseeker:(Jobseeker*)aJobseeker job:(id<IJob>)aJob jobAppliedDate:(NSString*)applicationDateString;
@end
