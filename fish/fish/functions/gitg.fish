function gitg
  set toplevel (git rev-parse --show-toplevel)
  if test $status = 0
    open -a SourceTree $toplevel
  else
    echo "Not a Git repository."
  end
end
