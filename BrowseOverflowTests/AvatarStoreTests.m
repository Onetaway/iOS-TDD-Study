//
//  AvatarStoreTests.m
//  BrowseOverflow
//
//  Created by Graham J Lee on 26/05/2011.
//  Copyright 2011 Fuzzy Aliens Ltd. All rights reserved.
//

#import "AvatarStoreTests.h"
#import "AvatarStore.h"
#import "AvatarStore+TestingExtensions.h"
#import "FakeNotificationCenter.h"

@implementation AvatarStoreTests

- (void)setUp {
    center = [[FakeNotificationCenter alloc] init];
    store = [[AvatarStore alloc] init];
    sampleData = [@"sample data" dataUsingEncoding: NSUTF8StringEncoding];
    sampleLocation = @"http://example.com/avatar/sample";
    [store setData: sampleData forLocation: sampleLocation];
    otherLocation = @"http://example.com/avatar/other";
}

- (void)testLookupDataInCacheDictionary {
    NSData *retrievedData = [store dataForURL: [NSURL URLWithString: sampleLocation]];
    XCTAssertEqualObjects(retrievedData, sampleData, @"If the data's already in the dictionary ");
}

- (void)testLowMemoryWarningRemovesCache {
    [store didReceiveMemoryWarning: nil];
    XCTAssertEqual([store dataCacheSize], (NSUInteger)0, @"Cache should be purged");
}

- (void)testStoreSubscribesToLowMemoryNotification {
    [store useNotificationCenter: (NSNotificationCenter *)center];
    XCTAssertTrue([center hasObject: store forNotification: UIApplicationDidReceiveMemoryWarningNotification], @"store should have registered for the notification");
}

- (void)testStoreRemovesSubscriptionFromLowMemoryNotification {
    [store useNotificationCenter: (NSNotificationCenter *)center];
    [store stopUsingNotificationCenter: (NSNotificationCenter *)center];
    XCTAssertFalse([center hasObject: store forNotification: UIApplicationDidReceiveMemoryWarningNotification], @"Object should no longer be registered for low memory warnings");
}

- (void)testCacheMissReturnsNoData {
    XCTAssertNil([store dataForURL: [NSURL URLWithString: otherLocation]], @"There shouldn't be any data for this location");
}

- (void)testCacheMissCreatesNewCommunicator {
    [store dataForURL: [NSURL URLWithString: otherLocation]];
    XCTAssertNotNil([[store communicators] objectForKey: otherLocation], @"Store tries to fetch data from the network");
}

- (void)testStoreRetrievedDataFromCommunicator {
    NSURL *otherURL = [NSURL URLWithString: otherLocation];
    [store communicatorReceivedData: sampleData forURL: otherURL];
    XCTAssertEqualObjects([store dataForURL: otherURL], sampleData, @"The store should keep the data it receives");
}

- (void)testStoreSendsDataUpdateNotificationWhenDataRetrieved {
    [store useNotificationCenter: (NSNotificationCenter *)center];
    [store communicatorReceivedData: sampleData forURL: [NSURL URLWithString: otherLocation]];
    XCTAssertTrue([center didReceiveNotification: AvatarStoreDidUpdateContentNotification fromObject: store], @"When data is received, interested parties should be told");
    [store stopUsingNotificationCenter: (NSNotificationCenter *)center];
}

- (void)testStoreDiscardsCommunicatorOnCompletion {
    [store dataForURL: [NSURL URLWithString: otherLocation]];
    [store communicatorReceivedData: sampleData forURL: [NSURL URLWithString: otherLocation]];
    XCTAssertNil([[store communicators] objectForKey: otherLocation], @"Store should have thrown away its communicator");
}

- (void)testStoreDiscardsCommunicatorOnFailure {
    NSURL *otherURL = [NSURL URLWithString: otherLocation];
    [store dataForURL: otherURL];
    [store communicatorGotErrorForURL: otherURL];
    XCTAssertNil([[store communicators] objectForKey: otherLocation], @"Store should throw away its communicator on error");
}

- (void)testStoreDoesNotUseAnyDataOnError {
    NSUInteger initialCacheSize = [store dataCacheSize];
    NSURL *otherURL = [NSURL URLWithString: otherLocation];
    [store dataForURL: otherURL];
    [store communicatorGotErrorForURL: otherURL];
    XCTAssertEqual([store dataCacheSize], initialCacheSize, @"No data should be added on error");
}

- (void)testNilDataReturnedWhenNilURLPassed {
    XCTAssertNil([store dataForURL: nil], @"Don't return data when passed a nil URL");
}

@end
