//
//  ViewController.m
//  SurvivalGame
//
//  Created by Anurag Solanki on 27/06/13.
//  Copyright (c) 2013 Anurag Solanki. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Custom Actions

/**
 Called on compute result button clicked
 */
- (IBAction)computeResult:(id)sender
{
    [self step1];
    [self performSelector:@selector(nextSteps) withObject:nil afterDelay:0.2f];
}

/** 
 Clears output field and shows HUD
 */
- (void) step1
{
    _outputView.text = @"";
    [_inputView resignFirstResponder];

    [SVProgressHUD showWithStatus:@"Computing..." maskType:SVProgressHUDMaskTypeBlack];
}

/**
 Computational step where all the calculation is done for getting the required result
 */
- (void)nextSteps
{
    _inputArray = [_inputView.text componentsSeparatedByString:@"\n"];
    
    int inputSize = 0;
    inputSize = [_inputArray[0] integerValue];
    if (inputSize > [_inputArray count] - 1) {
        inputSize = [_inputArray count] - 1;
    }
        
    for (int inputLine = 1; inputLine <= inputSize; inputLine++) {
        int totalParticipant = [_inputArray[inputLine] integerValue];
        
        NSMutableArray *participantArray = [@[] mutableCopy];
        for (int i = 1; i <= totalParticipant; i++) {
            [participantArray addObject:[NSNumber numberWithInt:i]];
        }
        
        NSMutableArray *deleteArray = [@[] mutableCopy];
        
        for (int i = 1; i > 0; i++) {
            if (i > [participantArray count] - 1) {
                i -= [participantArray count];
                [participantArray removeObjectsInArray:deleteArray];
                [deleteArray removeAllObjects];
            }
            
            if ([participantArray count] == 1) {
                _outputView.text = [_outputView.text stringByAppendingString:[NSString stringWithFormat:@"\n%@", participantArray[0]] ];
                i = -1;
                [SVProgressHUD dismiss];
                continue;
            }
            
            [deleteArray addObject:participantArray[i]];
            
            i++;
        }
    }
}
@end
