//
//  ViewController.m
//  Insta Mail
//
//  Created by Admin on 24.04.14.
//  Copyright (c) 2014 x25. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize emailPicker;


#pragma mark-
#pragma mark Picker Datasourse Protocol

-(void)mailComposeController:(MFMailComposeViewController *)controller
         didFinishWithResult:(MFMailComposeResult)result
                       error:(NSError *)error
{
    [self dismissViewControllerAnimated:1 completion:0];
    
}



-(IBAction)sendButtonTapped:(id)sender
{
    NSString *theMessenge = [NSString stringWithFormat:@"I'm %@ and feeling %@ about it", [activites_ objectAtIndex:              [emailPicker selectedRowInComponent:0]],
                             [feelings_ objectAtIndex:[emailPicker selectedRowInComponent:1]]];
    
    NSLog(@"%@",theMessenge);
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc]init];
        mailController.mailComposeDelegate = self;
        [mailController setSubject:@"Hello, Belhard!"];
        [mailController setMessageBody:theMessenge isHTML:0];
        [self presentViewController:mailController animated:1 completion:0];
        
        
    } else {
        NSLog(@"Sorry, you ned to setup mail first");
    }
    
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component==0) {
        return [activites_ objectAtIndex:row];
    } else {
        return [feelings_ objectAtIndex:row];
    }
    return nil;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component==0) {
        return [activites_ count];
    } else {
        return [feelings_ count];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	activites_ = [[NSArray alloc]initWithObjects:
                  @"sleeping",@"eating", @"working",@"thinking",@"crying",@"bigging",@"leaving",@"shoping",@"hello worlding", nil];
    feelings_ = [[NSArray alloc]initWithObjects:@"awesome", @"happy", @"sad",@"ambivalent",@"nauseus",@"psyched",@"confused",@"hopeful",@"anxious",nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
