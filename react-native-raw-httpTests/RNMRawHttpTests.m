#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "RNMRawHttp.h"

@interface RNMRawHttpTests : XCTestCase

@end

@implementation RNMRawHttpTests

- (void)testMain {
    XCTAssertNotNil(RNMRawHttp.class,@"RNMRawHttp class has to be available");
}

@end
