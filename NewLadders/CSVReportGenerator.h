//
//  CSVReportGenerator.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/17/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "IReportGenerator.h"

@interface CSVReportGenerator : NSObject  <IReportGenerator>
-(NSString*)prepareReport:(JobApplications *)jobApplications withTitle:(NSString *)title;
@end
