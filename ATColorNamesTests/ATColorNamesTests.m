//
//  ATColorNamesTests.m
//  ATColorNamesTests
//
//  Created by Osamu Noguchi on 7/13/13.
//  Copyright (c) 2013 Osamu Noguchi. All rights reserved.
//

#import "ATColorNamesTests.h"
#import "ATColorNames.h"
#import "ATColorDetail.h"

@implementation ATColorNamesTests

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
    ATColorNames *colorNames = [[ATColorNames alloc] init];
    NSArray *results = [colorNames getSimilarColorsFromUIColor:[UIColor yellowColor] language:@"ja_JP"];
    [self dumpColorNames:results];
    STAssertTrue([results count] > 0, @"Color names not found.");
}

- (void)testGetYellowColorsInEnglish
{
    ATColorNames *colorNames = [[ATColorNames alloc] init];
    NSArray *results = [colorNames getSimilarColorsFromUIColor:[UIColor yellowColor] language:@"en_US"];
    [self dumpColorNames:results];
    STAssertTrue([results count] > 0, @"Color names not found.");
}

- (void)dumpColorNames:(NSArray *)colorNames {
    NSLog(@"Count: %d", [colorNames count]);
    
    for (ATColorDetail *detail in colorNames) {
        NSLog(@"Name:%@ R:%d G:%d B:%d Language:%@", detail.name, detail.red, detail.green, detail.blue, detail.language);
    }
}

@end
