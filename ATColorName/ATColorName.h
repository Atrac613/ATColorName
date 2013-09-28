//
//  ATColorName.h
//  ATColorName
//
//  Created by Osamu Noguchi on 7/11/13.
//  Copyright (c) 2013 Osamu Noguchi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ATColorName : NSObject

- (NSArray *)getSimilarColorsFromUIColor:(UIColor *)color language:(NSString *)language;

@end
