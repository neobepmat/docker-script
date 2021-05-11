# Cloning SVN repository to local GIT repository
git svn clone --stdlayout --no-metadata https://svnserver/svn/CLA/CommonLibrary/DbCommonLibrary dbcommonlibrary --authors-file="where-i-saved-my-authors.txt"

# Migrate SVN tags to GIT tags
git for-each-ref refs/remotes/tags | cut -d / -f 4- | grep -v @ | while read tagname; do git tag "$tagname" "tags/$tagname"; git branch -r -d "tags/$tagname"; done

# Migrating SVN Branches to GIT branches
git for-each-ref refs/remotes | cut -d / -f 3- | grep -v @ | while read branchname; do git branch "$branchname" "refs/remotes/$branchname"; git branch -r -d "$branchname"; done

# Pushing on remote GIT repository

Set remote
>git remote add origin git@ubuntu2004.wsl:sandbox/firstrepo/dbcommonlibrary.git

Push all
>git push origin --all

Push tags
> git push origin --tags

# Removing unused branches LOCAL
> git branch -d origin/trunk

# Removing unused branches REMOTE
> $ git push origin --delete origin/trunk