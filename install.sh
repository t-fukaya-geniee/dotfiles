find . -maxdepth 1 -name '.*' | grep -v git | ruby -ne 'puts $_[2..-1]' | xargs -I{} rm ~/{}
find . -maxdepth 1 -name '.*' | grep -v git | ruby -ne 'puts $_[2..-1]' | xargs -I{} ln -s $(pwd)/{} ~/{}
