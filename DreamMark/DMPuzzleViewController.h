//
//  DMPuzzleViewController.h
//  DreamMark
//
//  Created by OurEDA on 14-7-3.
//  Copyright (c) 2014年 Ckitakishi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMPuzzleViewController : UIViewController
- (IBAction)bar4Action:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bar4;
- (IBAction)bar3Action:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bar3;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bar2;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bar1;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIImageView *Canvas;
@property (weak, nonatomic) IBOutlet UIView *puzzelView;

@property(nonatomic, strong) NSArray * datasource;
@property(nonatomic, strong) NSArray * datasourceMark;
@property(nonatomic, strong) NSArray * datasourceStory;
@property(nonatomic, strong) NSArray * datasourceOthers;

@property(nonatomic,strong) NSArray * aPlist;
@property(nonatomic,strong) UIButton * buttons;
@property(nonatomic,strong) NSMutableArray * buttonsArray;
@property(nonatomic,strong) UIImage * selectedImage;
@property(nonatomic,strong) UIImage * markImage;

@property(nonatomic,strong) UIImageView * markImageView;
@property(nonatomic,strong) UIImageView * storyImageView;
@property(nonatomic,strong) UIImageView  * othersImageView;

@property(nonatomic,strong) UIPanGestureRecognizer * pan;

- (IBAction)bar1Action:(id)sender;
- (IBAction)bar2Action:(id)sender;
- (IBAction)puzzleClear:(id)sender;
- (IBAction)actionSave:(id)sender;
- (IBAction)puzzleCancel:(id)sender;
@end
