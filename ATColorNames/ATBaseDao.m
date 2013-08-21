//
//  ATBaseDao.m
//  ColorName
//
//  Created by Osamu Noguchi on 9/23/12.
//  Copyright (c) 2012 atrac613.io. All rights reserved.
//

#import "ATBaseDao.h"

@implementation ATBaseDao

@synthesize db;

- (id)init{
    if (self = [super init]) {
        NSString *filePath = [NSString stringWithFormat:@"%@/color_names.db", [[NSBundle bundleForClass:[self class]] pathForResource:@"ATColorNames" ofType:@"bundle"]];
        
        db = [FMDatabase databaseWithPath:filePath];
        if ([db open]) {
            NSLog(@"Database open.");
            
            [db setTraceExecution:YES];
        } else {
            NSLog(@"Failed to open database.");
        }
    }
    
    return self;
}

- (NSString*)setTable:(NSString*)sql {
    return nil;
}

@end
