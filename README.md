TextInputLimit
==============
TextInputLimit是ios下的一个文本框输入文字长度限制类

使用方式：
-----------

<!--#import "UITextField+Category.h" -->
<!----> 
<!--实现方法：-->
<!--- (void)textFieldDidChange:(UITextField*)textField;-->
<!--- (BOOL)textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string-->
<!--master-->

#import "TextFieldLimitManager.h"

初始化一个全局变量 TextFieldLimitManager *manager;

实现方法:
- (void)limitTextField:(UITextField *)textField bytesLength:(NSInteger)maxLength;


//参照例子
         
***使用过程中不需要对UITextField和UITextView或Xib文件做任何修改，也不需要引用头文件。****

License
-----------
   
TextInputLimit is under MIT license.
