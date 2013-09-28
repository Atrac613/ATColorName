//
//  ATColorName.m
//  ATColorName
//
//  Created by Osamu Noguchi on 7/11/13.
//  Copyright (c) 2013 Osamu Noguchi. All rights reserved.
//

#import "ATColorName.h"
#import "ATColorNameDao.h"
#import "ATColorDetail.h"

@implementation ATColorName

- (NSArray *)getSimilarColorsFromUIColor:(UIColor *)color language:(NSString *)language {
    ATColorNameDao *colorNames = [[ATColorNameDao alloc] initWithLanguage:language];
    NSMutableArray *results = [colorNames findColorNameWithColor:color];
    
    return [NSArray arrayWithArray:results];
}

@end
