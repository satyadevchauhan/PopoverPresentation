//
//  ViewController.m
//  PopoverPresentationObjectiveC
//
//  Created by Satyadev on 01/09/17.
//  Copyright © 2017 Satyadev Chauhan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPopoverPresentationControllerDelegate>

@property (nonatomic, strong) UIBarButtonItem *barPop;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Set the title
    self.title = @"Objective-C";
    
    // Create a bar button
    self.barPop = [[UIBarButtonItem alloc] initWithTitle:@"Pop" style:UIBarButtonItemStylePlain target:self action:@selector(popClicked:)];
    
    // Add your bar button
    self.navigationItem.rightBarButtonItem = self.barPop;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)popClicked:(id)sender {
    
    // Create your view controller
    UIViewController *popViewController = [UIViewController new];
    
    // Set background so that its visible
    popViewController.view.backgroundColor = [UIColor blueColor];
    
    // Set your popover size.
    popViewController.preferredContentSize = CGSizeMake(300, 300);
    
    // Set the presentation style to modal so that the above methods get called.
    popViewController.modalPresentationStyle = UIModalPresentationPopover;
    
    // Set the popover presentation controller delegate so that the above methods get called.
    popViewController.popoverPresentationController.delegate = self;
    
    // Present the popover.
    [self presentViewController:popViewController animated:true completion:nil];
}

#pragma mark - <UIPopoverPresentationControllerDelegate>

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

- (void)prepareForPopoverPresentation:(UIPopoverPresentationController *)popoverPresentationController {
    popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popoverPresentationController.barButtonItem = self.barPop;
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
    return YES;
}

- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
    NSLog(@"Popover Dismissed!");
}

@end
