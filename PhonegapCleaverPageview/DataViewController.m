//
//  DataViewController.m
//  PhonegapCleaverPageview
//
//  Created by Admin on 10/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DataViewController.h"
#import <Cordova/CDVViewController.h> 

@interface DataViewController ()

@end

@implementation DataViewController

@synthesize dataLabel = _dataLabel;
@synthesize dataObject = _dataObject;

- (void)dealloc
{
    [_dataLabel release];
    [_dataObject release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CDVViewController* viewController = [CDVViewController new];
    viewController.startPage = [self.dataObject description];
    
    UIDevice* thisDevice = [UIDevice currentDevice];
    //Si es iPad portrait
    if(thisDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        viewController.view.frame =  CGRectMake(0, 0, 768,1024); 
    } else //Si es iPhone portrait
    {
        viewController.view.frame =  CGRectMake(0, 0, 320, 480);
    }
    //(estos serían tamaños a pantalla completa, pero puedes hacerlos del tamaño que quieras)

    [self.view addSubview:viewController.view]; 
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.dataLabel = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
