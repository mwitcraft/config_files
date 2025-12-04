##################################################
# Required apps
##################################################
# chocolatey    - `https://chocolatey.org/`
# oh my posh    - `choco install oh-my-posh`    - Sets powershell prompt
# posh git      - `choco install poshgit`       - Allows prompt to show git info
# neovim        - `choco install neovim`        - Vim editor
# git           - `choco install git`           - Needed for `ls` and prompt
# fd            - `choco install fd`            - Quickly find directories/files
# fzf           - `choco install fzf`           - Fuzzy finder, uses fd to search & select
##################################################

# To use, add this to your $PROFILE (open `$PROFILE` in vscode or vim - note the '.' at the beginning)
#. "C:\Users\Mason.Witcraft\git\config_files\windows_terminal\Microsoft.PowerShell_profile.ps1"

# Load custom theme
oh-my-posh init pwsh --config 'C:\Users\Mason.Witcraft\git\config_files\windows_terminal\mwitcraft.omp.json' | Invoke-Expression
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Aliases
function src    { . $PROFILE }
function ex     { explorer $args }
function n      { notepad $args }
function vim 	  { nvim $args }
function cn     { code --new-window $args }

# Maps 'ls' to the git bash 'ls' - I like it more lol
function ls_git { & 'C:\Program Files\Git\usr\bin\ls.exe' --color=auto -hF $args }
Set-Alias -Name ls -Value ls_git -Option Private

# Use `fd` to quickly find directories
# and `fzf` to interactively choose the dir
function f {
    $selectedDir = fd --type d -H | fzf --height 40% --border --reverse
    if ($selectedDir) {
        Set-Location $selectedDir
    }
}

# Use `fd` to quickly find files 
# and `fzf` to interactively choose the file 
# and open in configured app
function ff {
    $selectedFile = fd --type f -H | fzf --height 40% --border --reverse
    if ($selectedFile) {
        # Resolve to an absolute path
        $absolutePath = Resolve-Path $selectedFile

        # Check if the selected file has a .pdf extension
        if ($absolutePath -match "\.pdf$") {
            # Open PDF in Edge (or your default PDF viewer)
            Start-Process "msedge" -ArgumentList $absolutePath
        } else {
            # Open non-PDF files in a new vscode window
            code --new-window $absolutePath
        }
    }
}

function runner {
  param(
    [Parameter(Mandatory=$true)]
    [string]$Location,

    [Parameter(Mandatory=$true)]
    [string]$Command
  )

  Set-Location $Location
  Invoke-Expression $Command
}

Set-Alias Run_PlanUpgrade Run_PlanUpgrade_Fn
function Run_PlanUpgrade_Fn {
  runner "C:\Users\Mason.Witcraft\git\Plan\Plan\InEight.Plan.Presentation\PlanUpgrade" "ng build --watch"
}

Set-Alias Run_Echo Run_Echo_Fn
function Run_Echo_Fn {
  Write-Host "ECHO... Echo... echo..."
}

# Define runner-based aliases explicitly
$runnerAliases = @(
    'Run_PlanUpgrade',
    'Run_Echo'
)

Set-Alias run RunnerAliasMenu
function RunnerAliasMenu {
    param([string[]]$Aliases = $runnerAliases)

    if ($Aliases.Count -eq 0) {
        Write-Host "No runner-based aliases defined."
        return
    }

    $index = 0

    # Print the menu once
    foreach ($alias in $Aliases) {
        Write-Host "  $alias"
    }

    # Save the starting cursor position
    $menuStart = $host.UI.RawUI.CursorPosition
    $menuStart = @{ X = 0; Y = $menuStart.Y - $Aliases.Count }

    # Highlight the initial selection
    function UpdateHighlight {
        for ($i = 0; $i -lt $Aliases.Count; $i++) {
            $host.UI.RawUI.CursorPosition = @{ X=0; Y=$menuStart.Y + $i }
            if ($i -eq $index) {
                Write-Host "> $($Aliases[$i])" -ForegroundColor Cyan
            } else {
                Write-Host "  $($Aliases[$i])"
            }
        }
    }

    UpdateHighlight

    while ($true) {
        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

        # Enter key
        if ($key.Character -eq "`r" -or $key.VirtualKeyCode -eq 13) {
            break
        }

        # Escape key
        if ($key.Character -eq "") {
            # Clear the menu before exiting
            for ($i = 0; $i -lt $Aliases.Count; $i++) {
                $host.UI.RawUI.CursorPosition = @{ X=0; Y=$menuStart.Y + $i }
                Write-Host (" " * ($Aliases[$i].Length + 2)) -NoNewline
            }
            return
        }

        switch ($key.Character) {
            'j' { if ($index -lt $Aliases.Count - 1) { $index++ } }
            'k' { if ($index -gt 0) { $index-- } }
        }

        UpdateHighlight
    }

    # Clear the menu before running the selected alias
    for ($i = 0; $i -lt $Aliases.Count; $i++) {
        $host.UI.RawUI.CursorPosition = @{ X=0; Y=$menuStart.Y + $i }
        Write-Host (" " * ($Aliases[$i].Length + 2))
    }

    # Move cursor to where the menu started
    $host.UI.RawUI.CursorPosition = @{ X=0; Y=$menuStart.Y }

    $selectedAlias = $Aliases[$index]
    Write-Host "Executing $selectedAlias...`n"
    & $selectedAlias
}

# Import posh-git (allows git branch tab completion)
Import-Module posh-git
