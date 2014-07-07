//
//  DMPuzzleViewController.m
//  DreamMark
//
//  Created by OurEDA on 14-7-3.
//  Copyright (c) 2014年 Ckitakishi. All rights reserved.
//

#import "DMPuzzleViewController.h"
#import "DMPicInfo.h"
@interface DMPuzzleViewController ()

@end

@implementation DMPuzzleViewController
@synthesize aPlist;
@synthesize images;
@synthesize imagesArray;

UIImageView * imageArray[20];
int flag[4] = {0,0,0,0};
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.saveButton setBackgroundImage:[UIImage imageNamed:@"save.png"] forState:UIControlStateNormal];
    [self.shareButton setBackgroundImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
    self.Canvas.layer.borderWidth = 2;
    self.Canvas.layer.borderColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1].CGColor;

    
    self.scrollview.scrollEnabled = YES;
    [self.scrollview setContentOffset:CGPointMake(0, 109) animated:YES];
    [self.scrollview setContentSize:CGSizeMake(0, 160)];
    [self.scrollview setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    NSMutableArray * pics = [NSMutableArray arrayWithCapacity:0];
    aPlist = [[NSArray alloc]init];
    aPlist = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"piclist" ofType:@"plist"]];
    DMPicInfo * picinfo = picinfo = [[DMPicInfo alloc]init];
    for(NSDictionary * onePicInfo in aPlist)
    {
        picinfo.name = [onePicInfo objectForKey:@"name"];
        picinfo.number = [onePicInfo objectForKey:@"number"];
        [pics addObject:picinfo];
    }
    self.datasource = [[NSArray alloc]initWithArray:pics];
    
    NSInteger x,y;
    for(int i= 0;i<self.datasource.count;i++){
        picinfo = [self.datasource objectAtIndex:i];
        if(picinfo){
            x=(i%4)*76+11;
            y=(i/4)*76;
            images = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, 70, 70)];
            imageArray[i] = images;
//            [imagesArray addObject:images];
            [imageArray[i] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",
                                                  [[aPlist objectAtIndex:i]objectForKey:@"name"]]]];
//            [button addTarget:nil action:@selector(chooseImage) forControlEvents:UIControlEventTouchUpInside];
            [self.scrollview addSubview:images];
        }
    }
    flag[0] = 1;
}
-(void)chooseImage
{
    
}
//粗暴而简单的方法，尼玛，nsmultablearray为什么不可以
- (IBAction)bar1Action:(id)sender
{
    self.bar1.tintColor = [UIColor colorWithRed:102/255.0 green:208/255.0 blue:0/255.0 alpha:1];
    NSInteger temp = [self judge:1];
    
    DMPicInfo * picinfo;
    for(int i= 0;i<self.datasource.count;i++){
        picinfo = [self.datasource objectAtIndex:i];
        if(picinfo){
            [imageArray[i] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",
                                                  [[aPlist objectAtIndex:i]objectForKey:@"name"]]]];

            [self.scrollview addSubview:images];
        }
    }
    
    //用于判断之前的图片数量和现在的图片数量；
    NSInteger inter=temp-self.datasource.count;
    if(inter > 0){
        for(int i = 0;i<(temp-self.datasource.count);i++)
        {
            [imageArray[i+self.datasource.count] setImage:nil];
        }
    }

}
- (IBAction)bar2Action:(id)sender
{
    self.bar2.tintColor = [UIColor colorWithRed:228/255.0 green:186/255.0 blue:10/255.0 alpha:1];
    NSInteger temp = [self judge:2];
    
    NSMutableArray * picsMark = [NSMutableArray arrayWithCapacity:0];
    NSArray * aPlistMark = [[NSArray alloc]init];
    aPlistMark = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"piclist2" ofType:@"plist"]];
    DMPicInfo * picinfo = picinfo = [[DMPicInfo alloc]init];
    for(NSDictionary * onePicInfo in aPlistMark)
    {
        picinfo.name = [onePicInfo objectForKey:@"name"];
        picinfo.number = [onePicInfo objectForKey:@"number"];
        [picsMark addObject:picinfo];
    }
    self.datasourceMark = [[NSArray alloc]initWithArray:picsMark];
    for(int i= 0;i < self.datasourceMark.count;i++){
        picinfo = [self.datasourceMark objectAtIndex:i];
        if(picinfo){
            [imageArray[i] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",
                                                  [[aPlistMark objectAtIndex:i]objectForKey:@"name"]]]];
            [self.scrollview addSubview:images];
        }
    }
    //用于判断之前的图片数量和现在的图片数量；
    if((temp - self.datasourceMark.count)>0){
        for(int i=0;i<(temp-self.datasourceMark.count);i++)
        {
            [imageArray[i+self.datasourceMark.count] setImage:nil];
        }
    }
}
//确定当前所处位置；
- (NSInteger)judge:(NSInteger)temp
{
    int temp1;
    for(int i=0;i<4;i++){
        if(flag[i] == 1){
            temp1 = i;
            flag[i] = 0;
            break;
        }
    }
    flag[temp-1] = 1;
    if(temp1 == 0){
        return self.datasource.count;
    }
    if(temp1 == 1){
        return self.datasourceMark.count;
    }
    return 0;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)puzzleCancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
