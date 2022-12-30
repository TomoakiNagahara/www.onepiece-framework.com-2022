
 ## op-app-skeleton-2020-nep:/ci.sh
 #
 # <pre>
 # How to use: `sh ci.sh`
 #
 # This file does a git stash save.
 # Uncommitted files are not inspect.
 # </pre>
 #
 # @created   2022-10-31
 # @version   1.0
 # @package   op-app-skeleton-2020-nep
 # @author    Tomoaki Nagahara <tomoaki.nagahara@gmail.com>
 # @copyright Tomoaki Nagahara All right reserved.

# Skeleton
git add .
git stash save

# Submodules
git submodule foreach git add .
git submodule foreach git stash save

# CI
php ci.php display=0
# Result
if [ $? -ne 0 ]; then
  EXIT=1
fi

# Skeleton
git stash pop
git reset

# Submodules
git submodule foreach git stash pop
git submodule foreach git reset

# Exit
exit $EXIT
