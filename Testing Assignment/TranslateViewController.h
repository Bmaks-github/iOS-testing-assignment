//
//  TranslateViewController.h
//  Testing Assignment
//
//  Created by Admin on 24/08/16.
//  Copyright © 2016 Elantix. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum toLanguage { en, ua } ToLanguage;

static const NSString* API_KEY = @"trnsl.1.1.20160824T130558Z.e9f677aaa7973547.68a207fdf2b923c4f61db073d0a0f334f4b265d7";

@interface TranslateViewController : UIViewController <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labelFromLanguage;
@property (weak, nonatomic) IBOutlet UILabel *labelToLanguage;
@property (weak, nonatomic) IBOutlet UITextView *textViewFromLanguage;
@property (weak, nonatomic) IBOutlet UITextView *textViewToLanguage;

-(IBAction)changeLanguageButtonClick:(id)sender;

@end
