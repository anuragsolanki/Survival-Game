//
//  ViewController.h
//  SurvivalGame
//
//  Created by Anurag Solanki on 27/06/13.
//  Copyright (c) 2013 Anurag Solanki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(strong, nonatomic) IBOutlet UITextView *inputView;
@property(strong, nonatomic) IBOutlet UITextView *outputView;
@property(weak, nonatomic) IBOutlet UIButton *calculateBttn;
@property(strong, nonatomic) NSArray *inputArray;

- (IBAction)computeResult:(id)sender;

@end
