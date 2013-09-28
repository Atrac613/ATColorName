//
//  ATColorDetail.m
//  ColorName
//
//  Created by Osamu Noguchi on 9/23/12.
//  Copyright (c) 2012 atrac613.io. All rights reserved.
//

#import "ATColorDetail.h"

@implementation ATColorDetail

@synthesize index;
@synthesize name;
@synthesize nameReading;
@synthesize red;
@synthesize green;
@synthesize blue;
@synthesize language;

- (id)initWithIndex:(int)index_ name:(NSString *)name_ nameReading:(NSString *)nameReading_ red:(NSInteger)red_ green:(NSInteger)green_ blue:(NSInteger)blue_ language:(NSString*)language_ {
    if (self = [super init]) {
        self.index = index_;
        self.name = name_;
        self.nameReading = nameReading_;
        self.red = red_;
        self.green = green_;
        self.blue = blue_;
        self.language = language_;
    }
    
    return self;
}

@end
