//
//  GGMessageVC.m
//  ZombieMovie
//
//  Created by dujia on 16/7/7.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGMessageVC.h"
#import "GGMessageView.h"

#import "IMessageModel.h"



@interface GGMessageVC()<GGMessageViewDelegate,EMClientDelegate,EMChatManagerDelegate>
@property (nonatomic , strong) GGMessageView *messageView;




/*!
 @property
 @brief 聊天的会话对象
 */
@property (strong, nonatomic) EMConversation *conversation;


/*!
 @property
 @brief 加载的每页message的条数
 */
@property (nonatomic) NSInteger messageCountOfPage; //default 50


@end

@implementation GGMessageVC

- (instancetype)initWithConversationChatter:(NSString *)conversationChatter
                           conversationType:(EMConversationType)conversationType
{
    if (![conversationChatter isStringSafe]) {
        return nil;
    }
    
    if (self = [super init]) {
        _conversation = [[EMClient sharedClient].chatManager getConversation:conversationChatter type:conversationType createIfNotExist:YES];
        
        [_conversation markAllMessagesAsRead];
        
        
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    _messageView = [[GGMessageView alloc] initWithFrame:self.view.bounds];
    _messageView.delegate = self;
    [self.view addSubview:_messageView];
    
    
    [[EMClient sharedClient].chatManager addDelegate:self delegateQueue:nil];
    
    
  
    
}
- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    [[EMClient sharedClient].chatManager removeDelegate:self];
}





- (void) sendMethod:(id)sender
{
    EMTextMessageBody *body = [[EMTextMessageBody alloc] initWithText:[_messageView getsendMessageText]];
    NSString *from = [[EMClient sharedClient] currentUsername];
    
    [_messageView clearMesText];
    //生成Message
    EMMessage *message = [[EMMessage alloc] initWithConversationID:_conversation.conversationId
                                                              from:from
                                                                to:_conversation.conversationId
                                                              body:body ext:nil];
    message.chatType = EMChatTypeChat;// 设置为单聊消息
    [[EMClient sharedClient].chatManager asyncSendMessage:message progress:nil completion:^(EMMessage *message, EMError *error) {
        NSLog(@"yes");
    }];
}

#pragma mark - EMChatManagerDelegate

- (void)didUpdateConversationList:(NSArray *)aConversationList
{
    NSLog(@"didUpdateConversationList = %@",aConversationList);
}

- (void)didReceiveMessages:(NSArray<EMMessage *> *)aMessages
{
    NSLog(@"didReceiveMessages = %@",aMessages);
    [aMessages enumerateObjectsUsingBlock:^(EMMessage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
         EMMessage *msg = obj;
        NSLog(@"messageId = %@",msg.messageId);
        
        NSLog(@"conversationId = %@",msg.conversationId);
        
        NSLog(@"status = %d",msg.status);
        
        EMTextMessageBody* model =(EMTextMessageBody *) obj.body;
        
        NSLog(@"%@",model.text);
    }];
}


- (void)didReceiveCmdMessages:(NSArray *)aCmdMessages
{
    NSLog(@"didReceiveCmdMessages = %@",aCmdMessages);
}

- (void)didReceiveHasReadAcks:(NSArray<EMMessage *> *)aMessages
{
    NSLog(@"didReceiveHasReadAcks = %@",aMessages);
    [aMessages enumerateObjectsUsingBlock:^(EMMessage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        EMMessage *msg = obj;
        NSLog(@"messageId = %@",msg.messageId);
        
        NSLog(@"conversationId = %@",msg.conversationId);
        
        NSLog(@"status = %d",msg.status);
        
        
    }];
}


- (void)didMessageStatusChanged:(EMMessage *)aMessage
                          error:(EMError *)aError
{
    NSLog(@"didMessageStatusChanged = %@",aMessage);
}

- (void)didMessageAttachmentsStatusChanged:(EMMessage *)aMessage
                                     error:(EMError *)aError
{
    NSLog(@"didMessageAttachmentsStatusChanged = %@",aMessage);
}

@end
