//
//  TranslateViewController.h
//  Testing Assignment
//
//  Created by Admin on 24/08/16.
//  Copyright © 2016 Elantix. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum toLanguage { en, ua } ToLanguage;

@interface TranslateViewController : UIViewController <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labelFromLanguage;
@property (weak, nonatomic) IBOutlet UILabel *labelToLanguage;
@property (weak, nonatomic) IBOutlet UITextView *textViewFromLanguage;
@property (weak, nonatomic) IBOutlet UITextView *textViewToLanguage;

-(IBAction)changeLanguageButtonClick:(id)sender;

@end
