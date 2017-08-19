//
//  ViewController.m
//  0.1图片的缩放
//
//  Created by 罗鲣 on 15/10/10.
//  Copyright (c) 2015年 罗鲣. All rights reserved.
//

#import "ViewController.h"
#import "Question.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *iconView;
@property(nonatomic,assign)CGRect oldFrame;
@property (nonatomic, weak) UIButton *cover;
@property(nonatomic,strong)NSArray*questions;
@property(nonatomic,weak)IBOutlet UILabel*titleLable;
@property(nonatomic,weak)IBOutlet UIButton*nextBut;
/**序号*/
@property(nonatomic,weak)IBOutlet UILabel*numlable;
/**索引*/
@property(nonatomic,assign)int index;
@end

@implementation ViewController


//取出数据
-(NSArray *)questions
{
    if (_questions) {
        _questions=[Question questions ];
    }
    return _questions;
}


- (IBAction)iconbutton {
    if(_cover==nil){
        [self bigImage];
        
    }else
    {
        [self smallimage];
    }

    NSLog(@"%@",self.cover);

}

-(UIButton *)cover//懒加载   将cover分离出去
{
    if (!_cover) {
        UIButton*cover=[UIButton buttonWithType:UIButtonTypeSystem];
        
        cover.frame=self.view.frame;
        cover.backgroundColor=[UIColor blackColor];
        self.cover=cover;//这句很重要
        [_cover addTarget:self action:@selector(smallimage) forControlEvents:UIControlEventTouchUpInside];
    }
  
    return _cover;
    
}

- (IBAction)bigImage {
   //宽高
    CGFloat W =self.view.frame.size.width;
    CGFloat H =W;
    //坐标
    CGFloat x=0;
    CGFloat y=(self.view.frame.size.height-H)/2;
  
    self.oldFrame=self.iconView.frame;

    [self cover];
    [self.view addSubview:_cover];

    [self.view bringSubviewToFront:self.iconView ];
    
    [UIView animateWithDuration:0.1
                     animations:^{
                         self.iconView.frame=CGRectMake(x, y, W, H);
                         _cover.alpha=0.7;
                         
                     }];
 
}


-(void)smallimage{
    
    self.iconView.frame=self.oldFrame;
    
    [UIView animateWithDuration:0.7
                     animations:^{
                     self.iconView.frame=self.oldFrame;
                         [self.cover removeFromSuperview];
                         
                     }];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.index=-1;
    [self nextQuestons];
}
- (IBAction)nextQuestons {
    //题目索引
    self.index++;
    //取出对应的题目索引模型
    Question*question=self.questions[self.index];
    //设置序号
    self.numlable.text=[NSString stringWithFormat:@"%d/%d",self.index+1, self.questions.count];

    self.titleLable.text=question.title;
    [self.view addSubview:self.titleLable];
    //[self.iconView setImage:question.image forState:UIControlStateNormal];
    self.nextBut.enabled=(self.index!=self.questions.count-1);

    
    
}

@end
