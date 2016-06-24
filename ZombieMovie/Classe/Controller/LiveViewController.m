//
//  LiveViewController.m
//  ZombieMovie
//
//  Created by apple on 16/6/9.
//  Copyright © 2016年 一位97年的iOS开发者,喜欢学习新知识(姿势😄),如果你和我有相同爱好就加我🐧:450002197,记得备注iOS开发者. All rights reserved.
//

#import "LiveViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>
#import "SVProgressHUD.h"
#import "UIImageView+WebCache.h"
#import <Accelerate/Accelerate.h>

@interface LiveViewController ()
@property (atomic, strong) NSURL *url;

@property (atomic, retain) id <IJKMediaPlayback> player;

@property (weak, nonatomic) UIView *PlayerView;

@property (nonatomic, assign)int number;

@property (nonatomic, strong)UIImageView *dimIamge;
@end

@implementation LiveViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];

    //直播视频
    self.url = [NSURL URLWithString:_liveUrl];
//    self.url = [NSURL URLWithString:@"rtmp://121.42.201.209/mytv/demo"];
    NSLog(@"url = %@",self.url);
    _player = [[IJKFFMoviePlayerController alloc] initWithContentURL:self.url withOptions:nil];
    UIView *playerView = [self.player view];
    UIView *displayView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.PlayerView = displayView;
    self.PlayerView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.PlayerView];
    playerView.frame = self.PlayerView.bounds;
    playerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.PlayerView insertSubview:playerView atIndex:1];
    [_player setScalingMode:IJKMPMovieScalingModeAspectFill];
    [self installMovieNotificationObservers];
    [self loadingView];
    [self changeBackBtn];
   
    // Do any additional setup after loading the view.
}

// 加载图
- (void)loadingView
{
    self.dimIamge = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [_dimIamge sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.meelive.cn/%@",_imageUrl]]];
    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    visualEffectView.frame = _dimIamge.bounds;
    [_dimIamge addSubview:visualEffectView];
    [self.view addSubview:_dimIamge];
    
}

-(void)viewWillAppear:(BOOL)animated{
    if (![self.player isPlaying]) {
        [self.player prepareToPlay];
    }
}

#pragma Selector func

- (void)loadStateDidChange:(NSNotification*)notification {
    IJKMPMovieLoadState loadState = _player.loadState;
    
    if ((loadState & IJKMPMovieLoadStatePlaythroughOK) != 0) {
        NSLog(@"LoadStateDidChange: IJKMovieLoadStatePlayThroughOK: %d\n",(int)loadState);
    }else if ((loadState & IJKMPMovieLoadStateStalled) != 0) {
        NSLog(@"loadStateDidChange: IJKMPMovieLoadStateStalled: %d\n", (int)loadState);
    } else {
        NSLog(@"loadStateDidChange: ???: %d\n", (int)loadState);
    }
}

- (void)moviePlayBackFinish:(NSNotification*)notification {
    int reason =[[[notification userInfo] valueForKey:IJKMPMoviePlayerPlaybackDidFinishReasonUserInfoKey] intValue];
    switch (reason) {
        case IJKMPMovieFinishReasonPlaybackEnded:
            NSLog(@"playbackStateDidChange: IJKMPMovieFinishReasonPlaybackEnded: %d\n", reason);
            break;
            
        case IJKMPMovieFinishReasonUserExited:
            NSLog(@"playbackStateDidChange: IJKMPMovieFinishReasonUserExited: %d\n", reason);
            break;
            
        case IJKMPMovieFinishReasonPlaybackError:
            NSLog(@"playbackStateDidChange: IJKMPMovieFinishReasonPlaybackError: %d\n", reason);
            break;
            
        default:
            NSLog(@"playbackPlayBackDidFinish: ???: %d\n", reason);
            break;
    }
}

- (void)mediaIsPreparedToPlayDidChange:(NSNotification*)notification {
    NSLog(@"mediaIsPrepareToPlayDidChange\n");
}

- (void)moviePlayBackStateDidChange:(NSNotification*)notification {
    _dimIamge.hidden = YES;
    switch (_player.playbackState) {
            
        case IJKMPMoviePlaybackStateStopped:
            NSLog(@"IJKMPMoviePlayBackStateDidChange %d: stoped", (int)_player.playbackState);
            break;
            
        case IJKMPMoviePlaybackStatePlaying:
            NSLog(@"IJKMPMoviePlayBackStateDidChange %d: playing", (int)_player.playbackState);
            break;
            
        case IJKMPMoviePlaybackStatePaused:
            NSLog(@"IJKMPMoviePlayBackStateDidChange %d: paused", (int)_player.playbackState);
            break;
            
        case IJKMPMoviePlaybackStateInterrupted:
            NSLog(@"IJKMPMoviePlayBackStateDidChange %d: interrupted", (int)_player.playbackState);
            break;
            
        case IJKMPMoviePlaybackStateSeekingForward:
        case IJKMPMoviePlaybackStateSeekingBackward: {
            NSLog(@"IJKMPMoviePlayBackStateDidChange %d: seeking", (int)_player.playbackState);
            break;
        }
            
        default: {
            NSLog(@"IJKMPMoviePlayBackStateDidChange %d: unknown", (int)_player.playbackState);
            break;
        }
    }
}

#pragma Install Notifiacation

- (void)installMovieNotificationObservers {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loadStateDidChange:)
                                                 name:IJKMPMoviePlayerLoadStateDidChangeNotification
                                               object:_player];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackFinish:)
                                                 name:IJKMPMoviePlayerPlaybackDidFinishNotification
                                               object:_player];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(mediaIsPreparedToPlayDidChange:)
                                                 name:IJKMPMediaPlaybackIsPreparedToPlayDidChangeNotification
                                               object:_player];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackStateDidChange:)
                                                 name:IJKMPMoviePlayerPlaybackStateDidChangeNotification
                                               object:_player];
    
}

- (void)removeMovieNotificationObservers {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:IJKMPMoviePlayerLoadStateDidChangeNotification
                                                  object:_player];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:IJKMPMoviePlayerPlaybackDidFinishNotification
                                                  object:_player];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:IJKMPMediaPlaybackIsPreparedToPlayDidChangeNotification
                                                  object:_player];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:IJKMPMoviePlayerPlaybackStateDidChangeNotification
                                                  object:_player];
    
}


// 左右按钮
- (void)changeBackBtn
{
    // 返回
    UIButton * backBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    backBtn.frame = CGRectMake(10, 64 / 2 - 8, 33, 33);
    [backBtn setImage:[UIImage imageNamed:@"返回"] forState:(UIControlStateNormal)];
    [backBtn addTarget:self action:@selector(goBack) forControlEvents:(UIControlEventTouchUpInside)];
    backBtn.layer.shadowColor = [UIColor blackColor].CGColor;
    backBtn.layer.shadowOffset = CGSizeMake(0, 0);
    backBtn.layer.shadowOpacity = 0.5;
    backBtn.layer.shadowRadius = 1;
    [self.view addSubview:backBtn];
    
    // 暂停
    UIButton * playBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    playBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 33-10, 64 / 2 - 8, 33, 33);
    
    if (self.number == 0) {
        [playBtn setImage:[UIImage imageNamed:@"暂停"] forState:(UIControlStateNormal)];
        [playBtn setImage:[UIImage imageNamed:@"开始"] forState:(UIControlStateSelected)];
    }else{
        [playBtn setImage:[UIImage imageNamed:@"开始"] forState:(UIControlStateNormal)];
        [playBtn setImage:[UIImage imageNamed:@"暂停"] forState:(UIControlStateSelected)];
    }
    
    [playBtn addTarget:self action:@selector(play_btn:) forControlEvents:(UIControlEventTouchUpInside)];
    playBtn.layer.shadowColor = [UIColor blackColor].CGColor;
    playBtn.layer.shadowOffset = CGSizeMake(0, 0);
    playBtn.layer.shadowOpacity = 0.5;
    playBtn.layer.shadowRadius = 1;
    [self.view addSubview:playBtn];
    
    
}

//
- (void)goBack
{
    [self.player shutdown];
    [self.navigationController popViewControllerAnimated:true];
    
}

// 暂停开始
- (void)play_btn:(UIButton *)sender {
    
    sender.selected =! sender.selected;
    if (![self.player isPlaying]) {
        [self.player play];
    }else{
        [self.player pause];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 */




@end
