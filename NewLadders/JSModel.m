//
//  JSModel.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JSModel.h"

@implementation JSModel


+(JSModel*)sharedInstance{
    static JSModel *sharedInstance;
    sharedInstance = [[JSModel alloc] init];
    return sharedInstance;
}

@end
