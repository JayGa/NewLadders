//
//  IReportStringGenerator.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/27/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDentifer.h"

@protocol IReportStringGenerator <NSObject>

-(id<IReportStringGenerator>)initWithString:(NSString*)aString;
- (NSString*)appendJobApplicationReportWithJobseekerDetail:(NSString*)jobseekerDetail andJobDetail:(NSString*)jobDetail;

@end
