//
//  ATColorNameDao.h
//  ATColorName
//
//  Created by Osamu Noguchi on 7/14/13.
//  Copyright (c) 2013 Osamu Noguchi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ATBaseDao.h"
#import "ATColorDetail.h"

@interface ATColorNameDao : ATBaseDao {
    NSString *language;
}

- (id)initWithLanguage:(NSString*)language;
- (int)countAll;
- (int)countWithName:(NSString*)name nameReading:(NSString*)nameReading red:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;
- (void)insertWithName:(NSString*)name nameReading:(NSString*)nameReading red:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;
- (NSMutableArray*)findColorNameWithColor:(UIColor*)color;
- (ATColorDetail*)findColorNameWithColor:(UIColor*)color colorName:(NSString*)colorName;

@end
