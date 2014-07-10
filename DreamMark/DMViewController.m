//
//  DMViewController.m
//  DreamMark
//
//  Created by Ckitakishi on 14-7-3.
//  Copyright (c) 2014年 Ckitakishi. All rights reserved.
//

#import "DMViewController.h"

@interface DMViewController ()

@end

@implementation DMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.homeView setImage:[UIImage imageNamed:@"home.png"]];
    self.graffitiBtn.layer.cornerRadius = 20;
    self.puzzleBtn.layer.cornerRadius = 20;
    self.puzzleBtn.layer.borderWidth = 3;
    self.graffitiBtn.layer.borderWidth = 3;
    self.graffitiBtn.layer.borderColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1].CGColor;
    self.puzzleBtn.layer.borderColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1].CGColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
