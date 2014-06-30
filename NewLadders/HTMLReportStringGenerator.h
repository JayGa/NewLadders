//
//  HTMLReportStringGenerator.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/27/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IReportStringGenerator.h"

@interface HTMLReportStringGenerator : NSObject <IReportStringGenerator>

- (NSString*)appendJobApplicationReportRecordTo:(NSString*)reportString;

@end
