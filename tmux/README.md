ctra-a =>
C-a | : split pane vertically
C-A - : split pane horizontally

C-d : close pane
C-a c : create new window
C-a & : kill window
C-a <number> : switch to specific window
C-d : detach from current session
C-b D : detach from specific session

To re-attach to session and continue:
tmux ls
tmux attach -t <session-id>

nice to know
tmux new -s <session name> # instead of being 0-1-2 etc
tmux rename-session -t 0 <session name>
C-a z : full screen or shrink to normal
