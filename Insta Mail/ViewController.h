//
//  ViewController.h
//  Insta Mail
//
//  Created by Admin on 24.04.14.
//  Copyright (c) 2014 x25. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>
@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewAccessibilityDelegate, MFMailComposeViewControllerDelegate>
{
    
    NSArray *activites_;
    NSArray *feelings_;
    UIPickerView *emailPicker;
    UITextField *notesField;
    
}
@property(nonatomic, strong) IBOutlet UIPickerView *emailPicker;
@property(nonatomic, strong) IBOutlet UITextField *notesField;


-(IBAction)sendButtonTapped:(id)sender;
-(IBAction)textFieldDoneEditing:(id)sender;
@end
