echo "This is just one set of possible solutions to the proposed exercises."
echo "There are many ways these activities could be completed."

echo "1) Make a new change to a branch"
git checkout master  # ensure were on the master branch to start
git checkout -b alter-readme  # creates the alter-readme branch off commit "master" is currently pointing to
echo "Dan Couture" > editor.md  # directs the output string to a new file editor.md
git add editor.md # Tell git to start tracking this file
git commit -m "Adding an editor file"  # commit the staged chages (the new file)

echo "2) Move a branch"
git checkout A
git log --oneline # shows the following
# b99f5fe new engineer 3
# 342e2df new engineer 2
# a8c3582 new engineer 1
# 95cbf4a veteran work 3
# d41cdf3 veteran work 2
# 6bbceda veteran work 1
# bac0498 Adding exercises to README.md
# 06d31da Initial commit
git reset A~3  # Move A 3 steps back
git log --oneline
# 95cbf4a veteran work 3
# d41cdf3 veteran work 2
# 6bbceda veteran work 1
# bac0498 Adding exercises to README.md
# 06d31da Initial commit

echo "3) Merge a branch"
git checkout C
# Branch "B" doesn't exist for our local repo yet which is why 
# this merge is `git merge origin/B` instead of just 
# `git merge B`.  We could instead do `git checkout B`, 
# `git checkout C`, then `git merge B`.
git merge origin/B -m "Merging branch B into C"
git cat-file commit HEAD # will show metadata about the commit and list the 2 parent commits

echo "4) Merge a branch (part 2)"
git checkout D
git checkout E
git rebase D
git cat-file commit HEAD # will show metadata about the commit and will only list 1 parent commit

echo "5) Prepping a release"
git checkout F # Let's look at all the commits in F
git log --oneline 
# 316744e everything's fine here
# 99cf213 change text color
# b8635ae so is this one
# d4963e6 This feature is good to go
# bac0498 Adding exercises to README.md
# 06d31da Initial commit
git checkout G
git log --oneline
# d4963e6 This feature is good to go
# bac0498 Adding exercises to README.md
# 06d31da Initial commit

# So d4963e6 is the last commit they have in common
# which leaves 316744e, 99cf213, and b8635ae which are new
# on branch F.  And 99cf213 (change text color) is the commit 
# that we want to exclude.
git cherry-pick 316744e b8635ae
git log --oneline 
# 45cfd9c so is this one
# b94c559 everything's fine here
# d4963e6 This feature is good to go
# bac0498 Adding exercises to README.md
# 06d31da Initial commit

echo "6) Commit early and often"
git checkout H
git log --oneline 
# b8a095e 2am... finally finished
# d0507b2 gah. I need to get home
# 7f08a79 guess I can play one round of ping pong
# 7d2e223 head down time
# 0c27a30 back from lunch
# 42750f7 yay, lunch time
# deb4017 is it lunch time yet?
# 2c925f5 time for second breakfast
# 55fd3c1 Time for a coffee break
# ca46cfd Start of the day
# bac0498 Adding exercises to README.md
# 06d31da Initial commit
git rebase -i HEAD~10
# This will list the last 10 commits.
# Change all but one of them from "pick" to "squash"
# pick ca46cfd Start of the day
# squash 55fd3c1 Time for a coffee break
# squash 2c925f5 time for second breakfast
# squash deb4017 is it lunch time yet?
# squash 42750f7 yay, lunch time
# squash 0c27a30 back from lunch
# squash 7d2e223 head down time
# squash 7f08a79 guess I can play one round of ping pong
# squash d0507b2 gah. I need to get home
# squash b8a095e 2am... finally finished

# save and exit
# Another screen will pop up that starts with
# This is a combination of 10 commits.
# save and exit here too
git log --oneline # Note the commit hash for (Start of the day) has changed since its content changed
# 430645a Start of the day
# bac0498 Adding exercises to README.md
# 06d31da Initial commit

echo "7) Tag code"
git checkout K
git merge origin/I origin/J -m "merging I and J into K"
git tag 0.3.4

