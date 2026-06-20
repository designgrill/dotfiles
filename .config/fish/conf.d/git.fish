abbr --add g 'git'

abbr --add gst 'git status'

# Log
abbr --add gl 'git log --oneline --graph --decorate'
abbr --add gg 'tig'

# Branch
abbr --add gbc 'git switch -c'
abbr --add gbs 'git switch'

# Push Pull
abbr --add gpr 'git pull --rebase=merges'
abbr --add gpf 'git push --force-with-lease'

# Commit
abbr --add gcm --set-cursor 'git commit -m "%"'
abbr --add gca 'git commit --amend --no-edit'

# Diff
abbr --add gd 'git diff'
abbr --add gds 'git diff --staged'
abbr --add staged --command git 'diff --staged'