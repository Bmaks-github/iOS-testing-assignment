//
//  TranslateViewController.m
//  Testing Assignment
//
//  Created by Admin on 24/08/16.
//  Copyright © 2016 Elantix. All rights reserved.
//

#import "TranslateViewController.h"
#import "AFNetworking.h"

@interface TranslateViewController ()

@end

@implementation TranslateViewController

    ToLanguage toLanguage;
    AFURLSessionManager *manager;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textViewFromLanguage.delegate = self;
    toLanguage = ua;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)textViewDidChange:(UITextView *)textView {
    // Cancel all asynchronous AFNetworking requests
    [manager.operationQueue cancelAllOperations];

    [self translateUsingString:self.textViewFromLanguage.text];
}

- (IBAction)changeLanguageButtonClick:(id)sender {
    if (toLanguage == en) {
        toLanguage = ua;
        self.labelFromLanguage.text = @"EN";
        self.labelToLanguage.text = @"UA";
    } else {
        toLanguage = en;
        self.labelFromLanguage.text = @"UA";
        self.labelToLanguage.text = @"EN";
    }
}

- (void)translateUsingString:(NSString*)textFromLanguage {
    
    NSString *toLanguageStr;
    NSString *fromLanguageStr;
    
    if (toLanguage == en) {
        toLanguageStr = @"en";
        fromLanguageStr = @"uk";
    } else {
        toLanguageStr = @"uk";
        fromLanguageStr = @"en";
    }
    
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://translate.yandex.net/api/v1.5/tr.json/translate?key=%@&text=%@&lang=%@-%@", API_KEY, textFromLanguage, fromLanguageStr, toLanguageStr];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSURL *URL = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];

    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
            
            NSArray *result = [responseObject objectForKey:@"text"];
            self.textViewToLanguage.text = result[0];
        }
    }];
    [dataTask resume];
}

@end
