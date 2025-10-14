function git-rebase-continue-no-edit --wraps='GIT_EDITOR=true git rebase --continue' --description 'alias git-rebase-continue-no-edit GIT_EDITOR=true git rebase --continue'
  GIT_EDITOR=true git rebase --continue $argv; 
end
