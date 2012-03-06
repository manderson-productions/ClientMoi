//
//  MANViewController.m
//  ClientMoi
//
//  Created by Mark Anderson on 3/3/12.
//  Copyright (c) 2012 markmakingmusic. All rights reserved.
//

#import <Twitter/TWRequest.h>
#import <Twitter/TWTweetComposeViewController.h>
#import <Twitter/Twitter.h>
#import "MANViewController.h"


@implementation MANViewController
@synthesize searchField;
@synthesize textView;

@synthesize _request;
@synthesize _response;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];  
}


- (void)viewDidUnload
{
    [self setSearchField:nil];
    [self setTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)searchFieldDoneEditing:(id)sender {
    
    NSString *inputStr = [[NSString alloc] initWithFormat:@"%@", [searchField text]];

    // NSData* inputData = [inputStr dataUsingEncoding:NSUTF8StringEncoding];

    // make the request
    NSMutableURLRequest *getRequest = 
        [NSMutableURLRequest requestWithURL:
        [NSURL URLWithString:@"http://localhost:8080/de.manderson.wtp.filecounter/FileCounter"]
        cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:10];
    
    _request = getRequest;
    
    [_request setHTTPMethod: @"POST"];
    
    NSString *params = [[NSString alloc] initWithFormat:@"param=%@", inputStr];
    [_request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
   
    // error
    NSError *requestError;
    NSURLResponse *urlResponse = nil;
    
    // response data from java servlet
    NSData *getResponse = [NSURLConnection sendSynchronousRequest:_request returningResponse:&urlResponse error:&requestError];
    
    _response = getResponse;
    
    // convert data to string
    NSString *string = [[NSString alloc] initWithData:_response encoding:NSASCIIStringEncoding];
    
    // displays the text into a textField on the iOS app
    textView.textColor = [UIColor whiteColor];
    textView.text = string;
    
    // keyboard goes away when you press enter
    [sender resignFirstResponder];
}

- (IBAction)backgroundTap:(id)sender {
    // keyboard goes away when you tap in the background
    [searchField resignFirstResponder];
    
}

#pragma mark - Twitter Interactions

- (IBAction)getTweetInfo:(id)sender {
    
    /*************************************************/
    
    //  First, we create a dictionary to hold our request parameters
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:[searchField text] forKey:@"screen_name"];

    
    //  Next, we create an URL that points to the target endpoint
    NSURL *url = [NSURL URLWithString:@"http://api.twitter.com/1/statuses/user_timeline.json"];
    
    //  Now we can create our request.  Note that we are performing a GET request.
    TWRequest *twitterrequest = [[TWRequest alloc] initWithURL:url 
                                                    parameters:parameters 
                                                 requestMethod:TWRequestMethodGET];
    
    //  Perform our twitter request
    [twitterrequest performRequestWithHandler:^(NSData *responseData, 
                                                NSHTTPURLResponse *urlResponse, NSError *error) {

        // this will hold the output string of the response data
        NSString *output;     
        
        if (responseData) {
            //  Parses the returned JSON data
            NSError *jsonError;
            NSArray *timeline = [NSJSONSerialization JSONObjectWithData:responseData 
                                                                     options:NSJSONReadingMutableLeaves
                                                                       error:&jsonError];
          
            output = [NSString stringWithFormat:@"Timeline for %@:\n%@", [searchField text], timeline];
      }
        
        // displays the text from a seperate thread
        [self performSelectorOnMainThread:@selector(displayText:) withObject:output waitUntilDone:NO];
    }];
}

// method that prints the username timeline response onto the textView
- (void)displayText:(NSString *)text {
    
    self.textView.textColor = [UIColor whiteColor];
    self.textView.text = text;
}
@end
