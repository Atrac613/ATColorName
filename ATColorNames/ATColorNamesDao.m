//
//  ATColorNamesDao.m
//  ATColorNames
//
//  Created by Osamu Noguchi on 7/14/13.
//  Copyright (c) 2013 Osamu Noguchi. All rights reserved.
//

#import "ATColorNamesDao.h"

@implementation ATColorNamesDao

- (id)initWithLanguage:(NSString *)language_ {
    if (self = [super init]) {
        if ([language_ isEqualToString:@"ja_JP"]) {
            tableName = @"color_names_ja";
            language = @"ja_JP";
        } else {
            tableName = @"color_names_en";
            language = @"en_US";
        }
    }
    
    return self;
}

- (NSString *)setTable:(NSString *)sql {
    return [NSString stringWithFormat:sql, tableName];
}

- (int)countAll {
    int count = 0;
    
    FMResultSet *resultSet = [db executeQuery:[self setTable:@"SELECT count(*) FROM %@"]];
    
    while([resultSet next]){
        count = [[resultSet stringForColumn:@"count(*)"] intValue];
    }
    
    [resultSet close];
    
    return count;
}

- (int)countWithName:(NSString *)name nameReading:(NSString *)nameReading red:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue {
    int count = 0;
    
    FMResultSet *resultSet = [db executeQuery:[self setTable:@"SELECT count(*) FROM %@ WHERE name = ? AND name_reading = ? AND red = ? AND green = ? AND blue = ?;"], name, nameReading, [NSNumber numberWithInteger:red], [NSNumber numberWithInteger:green], [NSNumber numberWithInteger:blue]];
    
    while([resultSet next]){
        count = [[resultSet stringForColumn:@"count(*)"] intValue];
    }
    
    [resultSet close];
    
    return count;
}

- (void)insertWithName:(NSString *)name nameReading:(NSString *)nameReading red:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue {
    [db executeUpdate:[self setTable:@"INSERT INTO %@ (name, name_reading, red, green, blue) VALUES (?, ?, ?, ?, ?)"], name, nameReading, [NSNumber numberWithFloat:red], [NSNumber numberWithFloat:green], [NSNumber numberWithFloat:blue]];
    
    if ([db hadError]) {
        NSLog(@"Error %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
}

- (NSMutableArray*)findColorNameWithColor:(UIColor *)color {
    NSMutableArray *results = [[NSMutableArray alloc] initWithCapacity:0];
    
    const CGFloat *rgba = CGColorGetComponents(color.CGColor);
    
    FMResultSet *resultSet = [db executeQuery:[self setTable:@"SELECT id, name, name_reading, red, green, blue, (pow((?-red), 2) + pow((?-green), 2) + pow((?-blue), 2)) as difference FROM %@ ORDER BY difference;"], [NSNumber numberWithFloat:rgba[0] * 255], [NSNumber numberWithFloat:rgba[1] * 255], [NSNumber numberWithFloat:rgba[2] * 255]];
    
    if ([db hadError]) {
        NSLog(@"Error %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
    
    while([resultSet next]){
        if ([resultSet intForColumn:@"difference"] < 2000) {
            ATColorDetail *result = [[ATColorDetail alloc] initWithIndex:[resultSet intForColumn:@"id"] name:[resultSet stringForColumn:@"name"] nameReading:[resultSet stringForColumn:@"name_reading"] red:[resultSet intForColumn:@"red"] green:[resultSet intForColumn:@"green"] blue:[resultSet intForColumn:@"blue"] language:language];
            [results addObject:result];
        }
    }
    
    [resultSet close];
    
    return results;
}

- (ATColorDetail*)findColorNameWithColor:(UIColor *)color colorName:(NSString *)colorName {
    ATColorDetail *result;
    
    const CGFloat *rgba = CGColorGetComponents(color.CGColor);
    
    FMResultSet *resultSet = [db executeQuery:[self setTable:@"SELECT id, name, name_reading, red, green, blue, (pow((?-red), 2) + pow((?-green), 2) + pow((?-blue), 2)) as difference FROM %@  WHERE name = ? ORDER BY difference;"], [NSNumber numberWithFloat:rgba[0] * 255], [NSNumber numberWithFloat:rgba[1] * 255], [NSNumber numberWithFloat:rgba[2] * 255], colorName];
    
    while([resultSet next]){
        if ([resultSet intForColumn:@"difference"] < 2000) {
            result = [[ATColorDetail alloc] initWithIndex:[resultSet intForColumn:@"id"] name:[resultSet stringForColumn:@"name"] nameReading:[resultSet stringForColumn:@"name_reading"] red:[resultSet intForColumn:@"red"] green:[resultSet intForColumn:@"green"] blue:[resultSet intForColumn:@"blue"] language:language];
        }
    }
    
    [resultSet close];
    
    return result;
}

@end
