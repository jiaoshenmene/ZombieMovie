//
//  SGPickerHeadVC.m
//  ZombieMovie
//
//  Created by dujia on 16/6/21.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "SGPickerHeadVC.h"
#import "SGPickerHeadView.h"
#import "SGCarameVC.h"
#import "DJFileManager.h"


#import <AVFoundation/AVFoundation.h>


const static NSString *folderName = @"imagefile";
const static NSString *imageName = @"headimage.png";


@interface SGPickerHeadVC()<SGPickerHeadViewDel,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic , strong) SGPickerHeadView *mPickerHeadView;
@property (nonatomic , strong) SGCarameVC *carameVC;

@property (nonatomic , strong) UIImageView *headImageView;
@property (nonatomic , strong) UIButton *backBtn;


@end

@implementation SGPickerHeadVC

- (void)goback:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    _mPickerHeadView = [[SGPickerHeadView alloc] initWithFrame:self.view.bounds];
    NSString *filepath = [[DJFileManager getInstance] getdocmentPath];
    
    NSData *imageData = [NSData dataWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",filepath,imageName]];
    UIImage *image = [UIImage imageWithData:imageData];
    [_mPickerHeadView setIconImage:image];
    
    _mPickerHeadView.delegate = self;
    [self.view addSubview:_mPickerHeadView];
    
    
    _backBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _backBtn.frame = CGRectMake(self.view.frame.size.width - 100, 30, 60, 60);
    [_backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(goback:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backBtn];
}


- (void)getImageFromIpc
{
    // 1.判断相册是否可以打开
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) return;
    // 2. 创建图片选择控制器
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    /**
     typedef NS_ENUM(NSInteger, UIImagePickerControllerSourceType) {
     UIImagePickerControllerSourceTypePhotoLibrary, // 相册
     UIImagePickerControllerSourceTypeCamera, // 用相机拍摄获取
     UIImagePickerControllerSourceTypeSavedPhotosAlbum // 相簿
     }
     */
    // 3. 设置打开照片相册类型(显示所有相簿)
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    // ipc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    // 照相机
    // ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    // 4.设置代理
    ipc.delegate = self;
    // 5.modal出这个控制器
    [self presentViewController:ipc animated:YES completion:nil];
}

#pragma mark -- <UIImagePickerControllerDelegate>--
// 获取图片后的操作
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    // 销毁控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    // 设置图片
//    self.headImageView.image = info[UIImagePickerControllerOriginalImage];
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [_mPickerHeadView setIconImage:image];
    
    NSString *filepath = [[DJFileManager getInstance] getdocmentPath];
    
    NSData *imageData = UIImagePNGRepresentation(image);
    
    if ([imageData writeToFile:[filepath stringByAppendingFormat:@"/%@",imageName] atomically:YES]) {
        NSLog(@"success");
    }else
    {
        NSLog(@"failed");
    }
    
    
    
    
}

- (void) pickPhoto:(id)sender
{
    [self getImageFromIpc];
}


- (void) caramePhoto:(id)sender
{
    _carameVC = [[SGCarameVC alloc] init];
    [self presentViewController:_carameVC animated:YES completion:^{
        
    }];
    
}

@end
