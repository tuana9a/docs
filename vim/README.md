# vim

Hit `ESC`

## common

| keybinds      | mode        | action                                                              |
| ------------- | ----------- | ------------------------------------------------------------------- |
| i             | INSERT      | trước từ hiện tại                                                   |
| a             | INSERT      | (after)sau từ hiện tại                                              |
| Shift a       | INSERT      | cho con trỏ xuống cuối dòng hiện tại                                |
| o             | INSERT      | tạo dòng mới phía DƯỚI chuyển con trỏ (= phím enter đó)             |
| Shift o       | INSERT      | tạo dòng mới phía TRÊN chuyển con trỏ (= phím enter đó)             |
| v             | VISUAL      | bôi đen di chuột tới đâu bôi đen tới đó                             |
| Shift v       | VISUAL LINE | bôi đen một dòng                                                    |
| v i w         | VISUAL      | bôi đen một từ (word)                                               |
| g g V G       | VISUAL LINE | bôi đen toàn bộ = đi tới đầu file + bật visual + đi xuống cuối file |
| :echo "hello" |             | print "hello"                                                       |
| :let x=10     |             | gán biến x = 10                                                     |
| :echo x       |             | print biến x ra                                                     |

## input

| keybinds | action                                              |
| -------- | --------------------------------------------------- |
| a        | Enter insert mode right after the cursor            |
| A        | Enter insert mode at the end of the line            |
| i        | Enter insert mode right before the cursor           |
| I        | Enter insert mode at the beginning of the line      |
| o        | Enter insert mode on a blank line after the cursor  |
| O        | Enter insert mode on a blank line before the cursor |

## undo redo

| keybinds | action |
| -------- | ------ |
| u        | undo   |
| Ctrl r   | redo   |

## navigation

| keybinds | action                                                       |
| -------- | ------------------------------------------------------------ |
| h        | sang trái                                                    |
| l        | sang phải                                                    |
| j        | xuống                                                        |
| k        | lên                                                          |
| g g      | lên đầu file                                                 |
| Shift g  | xuống cuối file                                              |
| w        | chuyển sang từ tiếp theo (phân tách bởi cách, dấu phẩy, ...) |
| b        | chuyển sang từ trước đó (ngược lại ở trên)                   |
| 0        | đi chuyển ra đầu dòng                                        |
| ^        | Beginning of line                                            |
| Home     | di chuyển ra đầu dòng                                        |
| $        | đi chuyển ra cuối dòng                                       |
| End      | di chuyển ra cuối dòng                                       |

## copy paste cut

| keybinds | action                                          |
| -------- | ----------------------------------------------- |
| y        | copy một đoạn nào đó đang bôi đen               |
| p        | paste                                           |
| Shift p  | paste lên dòng trước đó                         |
| d        | cut đoạn đang bôi đen (hoặc coi như xoá 1 dòng) |
| dd       | Delete current line                             |
| 3dd      | Delete the next three lines                     |
| dw       | Delete the current word                         |
| d3w      | Delete the next three words                     |
| d4h      | Delete four characters to the left              |

## change

| keybinds | action                             |
| -------- | ---------------------------------- |
| cc       | Change current line                |
| cw       | Change current word                |
| c3w      | Change the next three words        |
| c5h      | Change five characters to the left |
| yy       | Yank current line                  |
| 3yy      | Yank the next three lines          |
| yw       | Yank the current word              |
| y$       | Yank to the end of the line        |

## find and replace

| keybinds             | action                                                        |
| -------------------- | ------------------------------------------------------------- |
| :/từ_cần_tìm         | tự gõ tìm kiếm một đoạn nào đó con trỏ sẽ ở đó                |
| Shift 8              | tìm kiếm từ hiện tại con trỏ đặt ở match đầu tiên từ đầu file |
| n                    | next tìm kiếm                                                 |
| Shift + n            | prev tìm kiếm                                                 |
| :%s/text_cũ/text_mới | find and replace all                                          |

## file

| keybinds     | action                                          |
| ------------ | ----------------------------------------------- |
| :e/tên_file  | mở file                                         |
| :q           | thoát chương trình                              |
| :bd          | đóng file đang mở (buffer delete)               |
| :w           | ghi file (write)                                |
| :wq          | vừa thoát vừa save                              |
| :q!          | thoát không save                                |
| :vs tên_file | mở file nữa và chia đôi cửa sổ                  |
| :w           | Write the current file to the filesystem        |
| :w filename  | Save a copy of the current file as filename     |
| :w!          | Force writing to the current file               |
| :1           | Go to line number 1 or whatever number is given |
| :e filename  | Open filename                                   |
| :q           | Quit if no changes made to file                 |
| :q!          | Quit without saving changes to file             |
