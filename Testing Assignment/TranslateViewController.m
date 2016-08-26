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
    // Do any additional setup after loading the view.
    
    self.textViewFromLanguage.delegate = self; // ADD THIS LINE
    toLanguage = ua;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidChange:(UITextView *)textView {
//    NSLog(@"It's working!");
    [manager.operationQueue cancelAllOperations];
    [self someMethod:self.textViewFromLanguage.text];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
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

- (void)someMethod:(NSString*)textFromLanguage {
    
    NSString *toLanguageStr;
    NSString *fromLanguageStr;
    
    if (toLanguage == en) {
        toLanguageStr = @"en";
        fromLanguageStr = @"uk";
    } else {
        toLanguageStr = @"uk";
        fromLanguageStr = @"en";
    }
    
    NSString* API_KEY = @"trnsl.1.1.20160824T130558Z.e9f677aaa7973547.68a207fdf2b923c4f61db073d0a0f334f4b265d7";
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
            //NSLog(result[0]);
            self.textViewToLanguage.text = result[0];

        }
    }];
    [dataTask resume];
}

@end
