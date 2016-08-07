//
//  ViewController.m
//  PlayRemoteMusic
//
//  Created by wanglong on 16/8/7.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()


//MP3远程链接
//http://cc.stream.qqmusic.qq.com/C100003j8IiV1X8Oaw.m4a?fromtag=52
//
//视频链接
//http://v1.mukewang.com/19954d8f-e2c2-4c0a-b8c1-a4c826b5ca8b/L.mp4
//http://v1.mukewang.com/3e35cbb0-c8e5-4827-9614-b5a355259010/L.mp4
//http://v1.mukewang.com/a45016f4-08d6-4277-abe6-bcfd5244c201/L.mp4
/** player 既可以播放远程音乐也可以播放远程视频 */
@property(nonatomic,strong)AVPlayer *player;
@end

@implementation ViewController


- (AVPlayer *)player
{
    if (_player == nil) {
        NSURL *playerUrl = [NSURL URLWithString:@"http://cc.stream.qqmusic.qq.com/C100003j8IiV1X8Oaw.m4a?fromtag=52"];
        
        //创建的第一种方式 不过不可以改变url
//        _player = [AVPlayer playerWithURL:playerUrl];
        
        //创建的第二种方式
        AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:playerUrl];
        _player = [AVPlayer playerWithPlayerItem:playerItem];
    }
    return _player;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.player play];
}
- (IBAction)playClick:(UIButton *)sender {
    [self.player play];
}
- (IBAction)pauseClick:(id)sender {
    [self.player pause];
}
- (IBAction)stopClick:(id)sender {
      NSURL *playerUrl = [NSURL URLWithString:@"http://v1.mukewang.com/19954d8f-e2c2-4c0a-b8c1-a4c826b5ca8b/L.mp4"];
    AVPlayerItem *newPlayerItem = [[AVPlayerItem alloc] initWithURL:playerUrl];
    [self.player replaceCurrentItemWithPlayerItem:newPlayerItem];
}


@end
