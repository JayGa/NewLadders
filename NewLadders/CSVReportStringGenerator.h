//
//  CSVReportStringGenerator.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/27/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IReportStringGenerator.h"

@interface CSVReportStringGenerator : NSObject <IReportStringGenerator>{
    NSString *gReportString;
}

- (NSString*)appendJobApplicationReportRecordTo:(NSString*)reportString;
@end
