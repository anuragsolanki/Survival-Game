//
//  SurvivalGameTests.m
//  SurvivalGameTests
//
//  Created by Anurag Solanki on 27/06/13.
//  Copyright (c) 2013 Anurag Solanki. All rights reserved.
//

#import "SurvivalGameTests.h"
#import "SenTestingKitAsync.h"

@implementation SurvivalGameTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    appDelegate = [[UIApplication sharedApplication] delegate];
    viewController = (ViewController *)appDelegate.window.rootViewController;
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

/**
 Test App Delegate and View Controller
 */

- (void)testApplicationDelegate {
    STAssertTrue([appDelegate isMemberOfClass:[AppDelegate class]], @"bad UIApplication delegate");
    STAssertTrue([viewController isMemberOfClass:[ViewController class]], @"bad mainViewController");
}

/**
 Test Result of Main View Controller using Dummy Test Data provided in the supplied pdf
 */

- (void)testViewControllerResultAsync {
    STAssertTrue([viewController isMemberOfClass:[ViewController class]], @"");
    
    UITextView* inputField = (UITextView*)viewController.inputView;
    inputField.text = @"2\n5\n10";
        
    UIButton* computeButton = (UIButton*)viewController.calculateBttn;
    [computeButton sendActionsForControlEvents:(UIControlEventTouchUpInside)];
    
    [self performSelector:@selector(myOutput) withObject:nil afterDelay:0.2];
}

- (void)myOutput {
    STAssertNotNil(viewController.outputView.text, @"Result should not be nil");
    STAssertTrue([viewController.outputView.text isEqualToString:@"\n3\n5"], @"Proper Result should be displayed");
    STSuccess();
}


@end
