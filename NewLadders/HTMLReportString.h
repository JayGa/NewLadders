//
//  HTMLReportString.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/26/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTMLReportString : NSString{
    NSString *aString;
}
+ (HTMLReportString*)appedReportWith:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);
@end
