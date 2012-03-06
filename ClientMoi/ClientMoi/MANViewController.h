//
//  MANViewController.h
//  ClientMoi
//
//  Created by Mark Anderson on 3/3/12.
//  Copyright (c) 2012 markmakingmusic. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MANViewController : UIViewController

@property (strong, nonatomic) NSMutableURLRequest *_request;
@property (strong, nonatomic) NSData *_response;

@property (strong, nonatomic) IBOutlet UITextField *searchField;
@property (strong, nonatomic) IBOutlet UITextView *textView;


- (IBAction)searchFieldDoneEditing:(id)sender;

- (IBAction)backgroundTap:(id)sender;

- (IBAction)getTweetInfo:(id)sender;

- (void)displayText:(NSString *)text;

@end
