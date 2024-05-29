import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../shared/colors.dart';

class Chatbot extends StatefulWidget {
  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> with WidgetsBindingObserver {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            margin: EdgeInsets.all(20.0),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 상단바
                Row(
                  children: [
                    BackButton(),
                    Text(
                      'AI 수의사',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20.0),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    controller: _scrollController,
                    padding: EdgeInsets.all(8.0),
                    reverse: false,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 0.3),
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        width: MediaQuery.of(context).size.width - 100,
                        decoration: BoxDecoration(
                          color: YELLOW_COLOR,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Text(
                          '안녕하세요! 😀\n\n'
                              '저는 1만건의 수의사 지식in 답변을 통해 훈련된 AI 상담 챗봇입니다. 사진으로는 판별하기 어려운 증상들을 물어봐 주세요! 👀\n\n'
                              '⚠️ 애완동물의 질환과 관련되지 않은 질문은 정확하게 답변하지 못할 수 있어요.',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: GREY_COLOR,
                              fontSize: 15.0),
                        ),
                      ),
                      ..._messages,
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: BEIGE_COLOR,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 0,
                        blurRadius: 5.0,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: _buildTextComposer(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconButton BackButton() {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: YELLOW_COLOR,
        size: 40.0,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: PRIMARY_COLOR),
      child: Container(
        margin: const EdgeInsets.fromLTRB(18, 0, 0, 0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: "증상을 입력해 보세요. 🩺",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: GREY_COLOR,
                      fontSize: 15.0),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(
                  Icons.send,
                  color: PRIMARY_COLOR,
                ),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    
    // 보내는 메시지
    var userMessage = ChatMessage(
      text: text,
    );
    
    // 답장 오는 메시지
    var botMessage = ChatMessage(
      text: "알겠습니다.",
      isBotMessage: true,
      botMessageColor: YELLOW_COLOR,
      botTextStyle: TextStyle(
        fontWeight: FontWeight.w600,
        color: GREY_COLOR,
        fontSize: 15.0,
      ),
    );
    setState(() {
      _messages.add(userMessage);
      _messages.add(botMessage);
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({required this.text, this.isBotMessage = false, this.botMessageColor = Colors.green, this.botTextStyle});
  final String text;
  final bool isBotMessage;
  final Color botMessageColor;
  final TextStyle? botTextStyle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isBotMessage ? Alignment.topLeft : Alignment.topRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 100,
        ),
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        child: Container(
          margin: const EdgeInsets.only(top: 0.3),
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          decoration: BoxDecoration(
            color: isBotMessage ? botMessageColor : BEIGE_COLOR,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: isBotMessage ? Radius.circular(0) :  Radius.circular(25),
              bottomRight: isBotMessage ? Radius.circular(25) : Radius.circular(0),
            ),
          ),
          child: Text(
            text,
            style: isBotMessage
                ? botTextStyle ??
                TextStyle(
                  fontWeight: FontWeight.w500,
                  color: GREY_COLOR,
                  fontSize: 15.0,
                )
                : TextStyle(
              fontWeight: FontWeight.w500,
              color: GREY_COLOR,
              fontSize: 15.0,
            ),
          ),
        ),
      ),
    );
  }
}
