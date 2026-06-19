function groot
  set toplevel (git rev-parse --show-toplevel)
  if test $status = 0
    cd $toplevel
  else
    echo "Not a Git repository."
  end
end
