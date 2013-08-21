//
//  ATColorNames.m
//  ATColorNames
//
//  Created by Osamu Noguchi on 7/11/13.
//  Copyright (c) 2013 Osamu Noguchi. All rights reserved.
//

#import "ATColorNames.h"
#import "ATColorNamesDao.h"
#import "ATColorDetail.h"

@implementation ATColorNames

- (NSArray *)getSimilarColorsFromUIColor:(UIColor *)color language:(NSString *)language {
    ATColorNamesDao *colorNames = [[ATColorNamesDao alloc] initWithLanguage:language];
    NSMutableArray *results = [colorNames findColorNameWithColor:color];
    
    return [NSArray arrayWithArray:results];
}

@end
