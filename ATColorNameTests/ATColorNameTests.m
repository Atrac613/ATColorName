//
//  ATColorNameTests.m
//  ATColorNameTests
//
//  Created by Osamu Noguchi on 7/13/13.
//  Copyright (c) 2013 Osamu Noguchi. All rights reserved.
//

#import "ATColorNameTests.h"
#import "ATColorName.h"
#import "ATColorDetail.h"

@implementation ATColorNameTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testGetYellowColorsInJapanese
{
    ATColorName *colorNames = [[ATColorName alloc] init];
    NSArray *results = [colorNames getSimilarColorsFromUIColor:[UIColor yellowColor] language:@"ja_JP"];
    [self dumpColorNames:results];
    XCTAssertTrue([results count] > 0, @"Color names not found.");
}

- (void)testGetYellowColorsInEnglish
{
    ATColorName *colorNames = [[ATColorName alloc] init];
    NSArray *results = [colorNames getSimilarColorsFromUIColor:[UIColor yellowColor] language:@"en_US"];
    [self dumpColorNames:results];
    XCTAssertTrue([results count] > 0, @"Color names not found.");
}

- (void)dumpColorNames:(NSArray *)colorNames {
    NSLog(@"Count: %lu", (unsigned long)[colorNames count]);
    
    for (ATColorDetail *detail in colorNames) {
        NSLog(@"Name:%@ R:%ld G:%ld B:%ld Language:%@", detail.name, (long)detail.red, (long)detail.green, (long)detail.blue, detail.language);
    }
}

@end
