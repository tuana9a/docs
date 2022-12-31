# vscode

## create shortcut to switch between terminal

[https://stackoverflow.com/questions/48440673/how-to-switch-between-terminals-in-visual-studio-code](https://stackoverflow.com/questions/48440673/how-to-switch-between-terminals-in-visual-studio-code)

Open `File` -> `Preferences` -> `Keyboard Shortcuts`

Open as json

add these line

```json
{
    "key": "ctrl+pagedown",
    "command": "workbench.action.terminal.focusNext",
    "when": "terminalFocus"
},
{
    "key": "ctrl+pageup",
    "command": "workbench.action.terminal.focusPrevious",
    "when": "terminalFocus"
}
```

## Ctrl+. (Dot) makes "e" appear instead of showing suggestions in VSCode on Gnome

[https://stackoverflow.com/questions/71997823/ctrl-dot-makes-e-appear-instead-of-showing-suggestions-in-vscode-on-gnome](https://stackoverflow.com/questions/71997823/ctrl-dot-makes-e-appear-instead-of-showing-suggestions-in-vscode-on-gnome)

[https://superuser.com/questions/1672408/linux-gnome-how-to-disable-ctrl-shortcut](https://superuser.com/questions/1672408/linux-gnome-how-to-disable-ctrl-shortcut)

just disable emoji shortcut of ibus
