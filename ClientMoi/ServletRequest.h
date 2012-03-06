//
//  ServletRequest.h
//  ClientMoi
//
//  Created by Mark Anderson on 3/3/12.
//  Copyright (c) 2012 markmakingmusic. All rights reserved.
//

//#import <Foundation/Foundation.h>
//
//@interface ServletRequest : NSObject {
//    
//    NSMutableURLRequest *request;
//    NSError *requestError;
//    NSURLResponse *urlResponse;
//    NSData *response;
//    NSString *string;
//}
//  
//@property (nonatomic, strong) NSMutableURLRequest *request;
//@property (nonatomic, strong) NSError *requestError;
//@property (nonatomic, strong) NSURLResponse *urlResponse;
//@property (nonatomic, strong) NSData *response;
//@property (nonatomic, strong) NSString *string;
//
//- (void) initRequest;
//- (void) getData;
//- (void) postData;
//
//@end








//// make the request
//NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:8080/de.manderson.wtp.filecounter/FileCounter"] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
//                                                   timeoutInterval:10];
//
//// GET data
//[request setHTTPMethod: @"GET"];
//
//// error
//NSError *requestError;
//NSURLResponse *urlResponse = nil;
//
//// response data from java servlet
//NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
//
//// convert data to string
//NSString *string = [[NSString alloc] initWithData:response encoding:NSASCIIStringEncoding];
//
//// displays the text into a textField on the iOS app
//textView.text = string;
//
//
//
//
//
//
//
//
//
//@interface DownloadOperation : NSOperation
//{
//    NSURLRequest *request;
//    NSURLConnection *connection;
//    NSMutableData *receivedData;
//}
//
//@property(readonly) BOOL isExecuting;
//@property(readonly) BOOL isFinished;
//
//@property(readonly) NSData *receivedData;
//
//- (id) initWithRequest: (NSURLRequest*) rq;
//
//@end
//
