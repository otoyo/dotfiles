for f in .*; do
  [ $f = '.' ] && continue
  [ $f = '..' ] && continue
  [ $f = '.git' ] && continue
  [ $f = '.DS_Store' ] && continue
  ln -fns $(pwd)/$f ~/$f
done
