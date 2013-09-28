//
//  ATColorDetail.h
//  ColorName
//
//  Created by Osamu Noguchi on 9/23/12.
//  Copyright (c) 2012 atrac613.io. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATColorDetail : NSObject {
    int index;
    NSString *name;
    NSString *nameReading;
    NSInteger red;
    NSInteger green;
    NSInteger blue;
    NSString *language;
}

@property (nonatomic) int index;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *nameReading;
@property (nonatomic) NSInteger red;
@property (nonatomic) NSInteger green;
@property (nonatomic) NSInteger blue;
@property (strong, nonatomic) NSString *language;

- (id)initWithIndex:(int)index_ name:(NSString *)name_ nameReading:(NSString *)nameReading_ red:(NSInteger)red_ green:(NSInteger)green_ blue:(NSInteger)blue_ language:(NSString*)language_;

@end
