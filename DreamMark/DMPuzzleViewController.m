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
@synthesize buttons;
@synthesize buttonsArray;
@synthesize selectedImage;

UIButton * myArray[20];
UIBarButtonItem * myBarButtonItem[4];
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
	// Do any additional setup after loading the view
    [self simpleinit];
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
            buttons = [[UIButton alloc]initWithFrame:CGRectMake(x, y, 70, 70)];
            myArray[i] = buttons;
//            [imagesArray addObject:images];
            [myArray[i] setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",
                                                                [[aPlist objectAtIndex:i]objectForKey:@"name"]]] forState:UIControlStateNormal];
            [myArray[i] addTarget:nil action:@selector(chooseImage:) forControlEvents:UIControlEventTouchUpInside];
            [self.scrollview addSubview:buttons];
        }
    }
    flag[0] = 1;
}

- (void)simpleinit
{
    [self.saveButton setBackgroundImage:[UIImage imageNamed:@"save.png"] forState:UIControlStateNormal];
    [self.shareButton setBackgroundImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
    self.Canvas.layer.borderWidth = 2;
    self.Canvas.layer.borderColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1].CGColor;
    
    self.scrollview.scrollEnabled = YES;//这是默认值
    [self.scrollview setContentOffset:CGPointMake(0, 0) animated:YES];
    [self.scrollview setContentSize:CGSizeMake(0, 160)];
    [self.scrollview setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    myBarButtonItem[0] = self.bar1;
    myBarButtonItem[1] = self.bar2;
    myBarButtonItem[2] = self.bar3;
    myBarButtonItem[3] = self.bar4;
}

-(void)chooseImage:(UIButton *)button
{
    if(flag[0] == 1){
        selectedImage = [[UIImage alloc]init];
        selectedImage = [button backgroundImageForState:UIControlStateNormal];
        [self.Canvas setImage:selectedImage];
    }
    else{
        UIGraphicsBeginImageContext(CGSizeMake(300, 300));
        [self.Canvas.image drawInRect:self.Canvas.frame];
        UIImage * markImage=[button backgroundImageForState:UIControlStateNormal];
        [markImage drawInRect:CGRectMake(150, 150, 100, 100)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [self.Canvas setImage:newImage];
    }
    
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
            [myArray[i] setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",
                                                                [[aPlist objectAtIndex:i]objectForKey:@"name"]]] forState:UIControlStateNormal];
            [myArray[i] addTarget:nil action:@selector(chooseImage:) forControlEvents:UIControlEventTouchUpInside];
            [self.scrollview addSubview:buttons];
        }
    }
    
    //用于判断之前的图片数量和现在的图片数量；
    //这里需要在if前获得减法的值，不然目测会因为类型转换发生意外
    NSInteger inter=temp-self.datasource.count;
    if(inter > 0){
        for(int i = 0;i<(temp-self.datasource.count);i++)
        {
            [myArray[i+self.datasource.count] setBackgroundImage:nil forState:UIControlStateNormal];
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
            [myArray[i] setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",
                                                                [[aPlistMark objectAtIndex:i]objectForKey:@"name"]]] forState:UIControlStateNormal];
            [myArray[i] addTarget:nil action:@selector(chooseImage:) forControlEvents:UIControlEventTouchUpInside];
            [self.scrollview addSubview:buttons];
        }
    }
    //用于判断之前的图片数量和现在的图片数量；
    NSInteger inter=temp-self.datasourceMark.count;
    if(inter > 0){
        for(int i=0;i<(temp-self.datasourceMark.count);i++)
        {
            [myArray[i+self.datasourceMark.count]setBackgroundImage:nil forState:UIControlStateNormal];
        }
    }
}

- (IBAction)bar3Action:(id)sender
{
    self.bar3.tintColor = [UIColor colorWithRed:238/255.0 green:15/255.0 blue:10/255.0 alpha:1];
    NSInteger temp = [self judge:3];
    
    NSMutableArray * picsStory = [NSMutableArray arrayWithCapacity:0];
    NSArray * aPlistStory = [[NSArray alloc]init];
    aPlistStory = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"piclist3" ofType:@"plist"]];
    DMPicInfo * picinfo = picinfo = [[DMPicInfo alloc]init];
    for(NSDictionary * onePicInfo in aPlistStory)
    {
        picinfo.name = [onePicInfo objectForKey:@"name"];
        picinfo.number = [onePicInfo objectForKey:@"number"];
        [picsStory addObject:picinfo];
    }
    self.datasourceStory = [[NSArray alloc]initWithArray:picsStory];
    for(int i= 0;i < self.datasourceStory.count;i++){
        picinfo = [self.datasourceStory objectAtIndex:i];
        if(picinfo){
            [myArray[i] setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",
                                                                [[aPlistStory objectAtIndex:i]objectForKey:@"name"]]] forState:UIControlStateNormal];
            [myArray[i] addTarget:nil action:@selector(chooseImage:) forControlEvents:UIControlEventTouchUpInside];
            [self.scrollview addSubview:buttons];
        }
    }
    //用于判断之前的图片数量和现在的图片数量；
    NSInteger inter=temp-self.datasourceStory.count;
    if(inter > 0){
        for(int i=0;i<(temp-self.datasourceStory.count);i++)
        {
            [myArray[i+self.datasourceStory.count]setBackgroundImage:nil forState:UIControlStateNormal];
        }
    }
    
}

- (IBAction)bar4Action:(id)sender
{
    self.bar4.tintColor = [UIColor colorWithRed:202/255.0 green:169/255.0 blue:230/255.0 alpha:1];
    NSInteger temp = [self judge:4];
    
    NSMutableArray * picsOthers = [NSMutableArray arrayWithCapacity:0];
    NSArray * aPlistOthers = [[NSArray alloc]init];
    aPlistOthers = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"piclist4" ofType:@"plist"]];
    DMPicInfo * picinfo = picinfo = [[DMPicInfo alloc]init];
    for(NSDictionary * onePicInfo in aPlistOthers)
    {
        picinfo.name = [onePicInfo objectForKey:@"name"];
        picinfo.number = [onePicInfo objectForKey:@"number"];
        [picsOthers addObject:picinfo];
    }
    self.datasourceOthers = [[NSArray alloc]initWithArray:picsOthers];
    for(int i= 0;i < self.datasourceOthers.count;i++){
        picinfo = [self.datasourceOthers objectAtIndex:i];
        if(picinfo){
            [myArray[i] setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",
                                                                [[aPlistOthers objectAtIndex:i]objectForKey:@"name"]]] forState:UIControlStateNormal];
            [myArray[i] addTarget:nil action:@selector(chooseImage:) forControlEvents:UIControlEventTouchUpInside];
            [self.scrollview addSubview:buttons];
        }
    }
    //用于判断之前的图片数量和现在的图片数量；
    NSInteger inter=temp-self.datasourceOthers.count;
    if(inter > 0){
        for(int i=0;i<(temp-self.datasourceOthers.count);i++)
        {
            [myArray[i+self.datasourceOthers.count]setBackgroundImage:nil forState:UIControlStateNormal];
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
            myBarButtonItem[i].tintColor = [UIColor colorWithRed:8/255.0 green:126/255.0 blue:255/255.0 alpha:1];
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
    if(temp1 == 2){
        return self.datasourceStory.count;
    }
    else if(temp1 == 3){
        return self.datasourceOthers.count;
    }
    return 0;
}

- (IBAction)actionSave:(id)sender
{
    UIImageWriteToSavedPhotosAlbum([self.Canvas image], nil, nil, nil);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"存储拼图成功"
                                                    message:@"已将拼图存储于图片库中，打开照片程序即可查看。"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];

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
- (IBAction)puzzleClear:(id)sender
{
    self.Canvas.image = nil;
}


@end
