# Load custom theme
oh-my-posh init pwsh --config 'C:\Users\Mason.Witcraft\git\config_files\windows_terminal\mwitcraft.omp.json' | Invoke-Expression
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete


# Aliases
function src    { . $PROFILE }
function ex     { explorer $args }
function n      { notepad $args }
function cdg    { cd '~\git\' }

function ls_git { & 'C:\Users\Mason.Witcraft\AppData\Local\Programs\Git\usr\bin\ls.exe' --color=auto -hF $args }
Set-Alias -Name ls -Value ls_git -Option Private

