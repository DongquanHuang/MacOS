FasdUAS 1.101.10   ��   ��    k             l     ��  ��    ( " New Message v1.0 (September 2008)     � 	 	 D   N e w   M e s s a g e   v 1 . 0   ( S e p t e m b e r   2 0 0 8 )   
  
 l     ��  ��    R L AppleScript for creating new message in Microsoft Entourage with attachment     �   �   A p p l e S c r i p t   f o r   c r e a t i n g   n e w   m e s s a g e   i n   M i c r o s o f t   E n t o u r a g e   w i t h   a t t a c h m e n t      l     ��������  ��  ��        i         I     �� ��
�� .aevtoappnull  �   � ****  o      ���� 0 argv  ��    k     z       r         l     ����  n         4    �� 
�� 
cobj  m    ����   o     ���� 0 argv  ��  ��    o      ���� 0 
strcontent 
strContent       l   �� ! "��   ! # recover the return characters    " � # # : r e c o v e r   t h e   r e t u r n   c h a r a c t e r s    $ % $ r     & ' & l    (���� ( I    �� )����  0 findandreplace findAndReplace )  * + * m    	 , , � - -  
 +  . / . m   	 
 0 0 � 1 1  < b r > /  2�� 2 o   
 ���� 0 
strcontent 
strContent��  ��  ��  ��   ' o      ���� 0 
strcontent 
strContent %  3 4 3 l   ��������  ��  ��   4  5 6 5 r     7 8 7 l    9���� 9 n     : ; : 4    �� <
�� 
cobj < m    ����  ; o    ���� 0 argv  ��  ��   8 o      ����  0 attachmentname attachmentName 6  = > = l   ��������  ��  ��   >  ? @ ? O    r A B A k    q C C  D E D r    0 F G F I   .���� H
�� .corecrel****      � null��   H �� I J
�� 
kocl I m     ��
�� 
outm J �� K��
�� 
prdt K K   ! * L L �� M N
�� 
subj M n   " & O P O 4   # &�� Q
�� 
cobj Q m   $ %����  P o   " #���� 0 argv   N �� R��
�� 
ctnt R o   ' (���� 0 
strcontent 
strContent��  ��   G o      ���� 0 
newmessage 
newMessage E  S T S O   1 k U V U k   5 j W W  X Y X I  5 K���� Z
�� .corecrel****      � null��   Z �� [ \
�� 
kocl [ m   7 8��
�� 
rcpt \ �� ]��
�� 
prdt ] K   9 G ^ ^ �� _��
�� 
emad _ K   < E ` ` �� a��
�� 
radd a n   ? C b c b 4   @ C�� d
�� 
cobj d m   A B����  c o   ? @���� 0 argv  ��  ��  ��   Y  e f e l  L L��������  ��  ��   f  g h g Z   L h i j���� i >  L Q k l k o   L M����  0 attachmentname attachmentName l m   M P m m � n n   j I  T d���� o
�� .corecrel****      � null��   o �� p q
�� 
kocl p m   V Y��
�� 
cAtc q �� r��
�� 
prdt r K   Z ` s s �� t��
�� 
file t o   ] ^����  0 attachmentname attachmentName��  ��  ��  ��   h  u�� u l  i i��������  ��  ��  ��   V o   1 2���� 0 
newmessage 
newMessage T  v�� v I  l q�� w��
�� .aevtodocnull  �    alis w o   l m���� 0 
newmessage 
newMessage��  ��   B m     x x                                                                                  OPIM  alis    �  Macintosh HD               �)H+   	hgMicrosoft Outlook.app                                           	�*Θ��        ����  	                Microsoft Office 2011     �(��      Θyu     	hg�J�  GMacintosh HD:Applications: Microsoft Office 2011: Microsoft Outlook.app   ,  M i c r o s o f t   O u t l o o k . a p p    M a c i n t o s h   H D  8Applications/Microsoft Office 2011/Microsoft Outlook.app  / ��   @  y z y l  s s��������  ��  ��   z  { | { l  s s�� } ~��   } R L *** Delete syntax below this point if you want to stay in the address panel    ~ �   �   * * *   D e l e t e   s y n t a x   b e l o w   t h i s   p o i n t   i f   y o u   w a n t   t o   s t a y   i n   t h e   a d d r e s s   p a n e l |  � � � l  s s�� � ���   � , & *** after adding your e-mail address.    � � � � L   * * *   a f t e r   a d d i n g   y o u r   e - m a i l   a d d r e s s . �  � � � I  s x�� ���
�� .miscactvnull��� ��� null � m   s t � �                                                                                  OPIM  alis    �  Macintosh HD               �)H+   	hgMicrosoft Outlook.app                                           	�*Θ��        ����  	                Microsoft Office 2011     �(��      Θyu     	hg�J�  GMacintosh HD:Applications: Microsoft Office 2011: Microsoft Outlook.app   ,  M i c r o s o f t   O u t l o o k . a p p    M a c i n t o s h   H D  8Applications/Microsoft Office 2011/Microsoft Outlook.app  / ��  ��   �  ��� � l  y y��������  ��  ��  ��     � � � l     ��������  ��  ��   �  � � � i     � � � I      �� �����  0 findandreplace findAndReplace �  � � � o      ���� 
0 tofind   �  � � � o      ���� 0 	toreplace   �  ��� � o      ���� 0 	thestring 	TheString��  ��   � k     & � �  � � � r      � � � 1     ��
�� 
txdl � o      ���� 0 ditd   �  � � � r     � � � o    ���� 
0 tofind   � 1    
��
�� 
txdl �  � � � r     � � � n     � � � 2   ��
�� 
citm � o    ���� 0 	thestring 	TheString � o      ���� 0 	textitems 	textItems �  � � � r     � � � o    ���� 0 	toreplace   � 1    ��
�� 
txdl �  � � � r     � � � c     � � � o    ���� 0 	textitems 	textItems � m    ��
�� 
TEXT � o      ���� 0 res   �  � � � r    # � � � o    ���� 0 ditd   � 1    "��
�� 
txdl �  ��� � L   $ & � � o   $ %���� 0 res  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � 7 1 close address panel and tab to message text area    � � � � b   c l o s e   a d d r e s s   p a n e l   a n d   t a b   t o   m e s s a g e   t e x t   a r e a �  ��� � l     ����~��  �  �~  ��       �} � � ��}   � �|�{
�| .aevtoappnull  �   � ****�{  0 findandreplace findAndReplace � �z �y�x � ��w
�z .aevtoappnull  �   � ****�y 0 argv  �x   � �v�v 0 argv   � �u�t , 0�s�r�q x�p�o�n�m�l�k�j�i�h�g m�f�e�d�c
�u 
cobj�t 0 
strcontent 
strContent�s  0 findandreplace findAndReplace�r �q  0 attachmentname attachmentName
�p 
kocl
�o 
outm
�n 
prdt
�m 
subj
�l 
ctnt
�k .corecrel****      � null�j 0 
newmessage 
newMessage
�i 
rcpt
�h 
emad
�g 
radd
�f 
cAtc
�e 
file
�d .aevtodocnull  �    alis
�c .miscactvnull��� ��� null�w {��m/E�O*���m+ E�O���/E�O� V*�����l/���� E�O� 7*���a a ��k/ll� O�a  *�a �a �l� Y hOPUO�j UO�j OP � �b ��a�` � ��_�b  0 findandreplace findAndReplace�a �^ ��^  �  �]�\�[�] 
0 tofind  �\ 0 	toreplace  �[ 0 	thestring 	TheString�`   � �Z�Y�X�W�V�U�Z 
0 tofind  �Y 0 	toreplace  �X 0 	thestring 	TheString�W 0 ditd  �V 0 	textitems 	textItems�U 0 res   � �T�S�R
�T 
txdl
�S 
citm
�R 
TEXT�_ '*�,E�O�*�,FO��-E�O�*�,FO��&E�O�*�,FO�ascr  ��ޭ