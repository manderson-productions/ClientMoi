//
//  ServletRequest.m
//  ClientMoi
//
//  Created by Mark Anderson on 3/3/12.
//  Copyright (c) 2012 markmakingmusic. All rights reserved.
//

//#import "ServletRequest.h"
//
//@implementation ServletRequest
//
//@synthesize request;
//@synthesize requestError;
//@synthesize urlResponse;
//@synthesize response;
//@synthesize string;
//
//- (void) initRequest {
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:8080/de.manderson.wtp.filecounter/FileCounter"] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
//                                                       timeoutInterval:10];
//    
//}
//- (void) getData: (NSURLResponse *) urlResponsestuff: (NSError *)requestError {
//    [request setHTTPMethod: @"GET"];
//    
//    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
//    
//    NSString *string = [[NSString alloc] initWithData:response encoding:NSASCIIStringEncoding];
//    
//}
//- (void) postData {
//    [request setHTTPMethod: @"POST"];
//    
//    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
//    
//}
//@end
//
//
//









//#import "DownloadOperation.h"
//
//@interface DownloadOperation ()
//@property(assign) BOOL isExecuting;
//@property(assign) BOOL isFinished;
//@end
//
//@implementation DownloadOperation
//@synthesize isExecuting, isFinished, receivedData;
//
//#pragma mark Initialization
//
//- (id) initWithRequest: (NSURLRequest*) rq
//{
//    [super init];
//    request = [rq retain];
//    return self;
//}
//
//- (void) dealloc
//{
//    [request release];
//    [super dealloc];
//}
//
//#pragma mark NSOperation Stuff
//
//- (void) start
//{
//    NSParameterAssert(request);
//    
//    // Bail out early if cancelled.
//    if ([self isCancelled]) {
//        [self setIsFinished:YES];
//        [self setIsExecuting:NO];
//        return;
//    }
//    
//    [self setIsExecuting:YES];
//    [self setIsFinished:NO];
//    receivedData = [[NSMutableData alloc] init];
//    
//    // Make sure the connection runs in the main run loop.
//    connection = [[NSURLConnection alloc] initWithRequest:request
//                                                 delegate:self startImmediately:NO];
//    [connection scheduleInRunLoop:[NSRunLoop mainRunLoop]
//                          forMode:NSDefaultRunLoopMode];
//    [connection start];
//}
//
//- (BOOL) isConcurrent
//{
//    return YES;
//}
//
//#pragma mark NSURLConnection Callbacks
//
//- (void) connection: (NSURLConnection*) cn didReceiveData: (NSData*) data
//{
//    // Not cancelled, receive data.
//    if (![self isCancelled]) {
//        [receivedData appendData:data];
//        return;
//    }
//    
//    // Cancelled, tear down connection.
//    [self setIsExecuting:NO];
//    [self setIsFinished:YES];
//    [connection cancel];
//    [connection release];
//    [receivedData release];
//}
//
//- (void) connectionDidFinishLoading: (NSURLConnection*) cn
//{
//    [self setIsExecuting:NO];
//    [self setIsFinished:YES];
//    [receivedData release];
//    [connection release];
//}
//
//- (void) connection: (NSURLConnection*) cn didFailWithError: (NSError*) error
//{
//    [self setIsExecuting:NO];
//    [self setIsFinished:YES];
//    [connection release];
//    [receivedData release];
//}
//
//// http://stackoverflow.com/questions/3573236
//+ (BOOL) automaticallyNotifiesObserversForKey: (NSString*) key
//{
//    return YES;
//}

// @end