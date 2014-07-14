//
//  JobPostedDate.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/17/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JobPostedDate : NSDate{
    NSDate *gJobPostedDate;
}
-(JobPostedDate*)initByPostedDate:(NSDate*)postedDate;
@end
