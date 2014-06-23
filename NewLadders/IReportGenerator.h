//
//  IReportGenerator.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/16/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MutableArrayWrap.h"

@protocol IReportGenerator <NSObject>
-(NSString*)prepareReport:(MutableArrayWrap *)dataArray withTitle:(NSString *)title;
@end
