<# git alias #>

function cc {
    codegpt commit
}

function grt {
    cd "$(git rev-parse --show-toplevel || echo .)"
}

function ggpnp {
    ggl && ggp
}

function ggpur {
    ggu
}

function ga {
    git add
}

function gaa {
    git add --all
}

function gapa {
    git add --patch
}

function gau {
    git add --update
}

function gav {
    git add --verbose
}

function gwip {
    git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"
}

function gam {
    git am
}

function gama {
    git am --abort
}

function gamc {
    git am --continue
}

function gamscp {
    git am --show-current-patch
}

function gams {
    git am --skip
}

function gap {
    git apply
}

function gapt {
    git apply --3way
}

function gbs {
    git bisect
}

function gbsb {
    git bisect bad
}

function gbsg {
    git bisect good
}

function gbsn {
    git bisect new
}

function gbso {
    git bisect old
}

function gbsr {
    git bisect reset
}

function gbss {
    git bisect start
}

function gbl {
    git blame -w
}

function gb {
    git branch
}

function gba {
    git branch --all
}

function gbd {
    git branch --delete
}

function gbD {
    git branch --delete --force
}

function gbgd {
    LANG=C git branch --no-color -vv | grep ": gone\]" | awk '"'"'{print $1}'"'"' | xargs git branch -d
}

function gbgD {
    LANG=C git branch --no-color -vv | grep ": gone\]" | awk '"'"'{print $1}'"'"' | xargs git branch -D
}

function gbm {
    git branch --move
}

function gbnm {
    git branch --no-merged
}

function gbr {
    git branch --remote
}

function ggsup {
    git branch --set-upstream-to=origin/$(git_current_branch)
}

function gbg {
    LANG=C git branch -vv | grep ": gone\]"
}

function gco {
    git checkout
}

function gcor {
    git checkout --recurse-submodules
}

function gcb {
    git checkout -b
}

function gcB {
    git checkout -B
}

function gcd {
    git checkout $(git_develop_branch)
}

function gcm {
    git checkout $(git_main_branch)
}

function gcp {
    git cherry-pick
}

function gcpa {
    git cherry-pick --abort
}

function gcpc {
    git cherry-pick --continue
}

function gclean {
    git clean --interactive -d
}

function gcl {
    git clone --recurse-submodules
}

function gccd {
    git clone --recurse-submodules "$@" && cd "$(basename $\_ .git)"
}

function gcam {
    git commit --all --message
}

function gcas {
    git commit --all --signoff
}

function gcasm {
    git commit --all --signoff --message
}

function gcmsg {
    git commit --message
}

function gcsm {
    git commit --signoff --message
}

function gc {
    git commit --verbose
}

function gca {
    git commit --verbose --all
}

function gca! {
    git commit --verbose --all --amend
}

function gcan! {
    git commit --verbose --all --no-edit --amend
}

function gcans! {
    git commit --verbose --all --signoff --no-edit --amend
}

function gc! {
    git commit --verbose --amend
}

function gcn! {
    git commit --verbose --no-edit --amend
}

function gcs {
    git commit -S
}

function gcss {
    git commit -S -s
}

function gcssm {
    git commit -S -s -m
}

function gcf {
    git config --list
}

function gdct {
    git describe --tags $(git rev-list --tags --max-count=1)
}

function gd {
    git diff
}

function gdca {
    git diff --cached
}

function gdcw {
    git diff --cached --word-diff
}

function gds {
    git diff --staged
}

function gdw {
    git diff --word-diff
}

function gdv {
    git diff -w "$@" | view -
}

function gdup {
    git diff @{upstream}
}

function gdnolock {
    git diff $@ ":(exclude)package-lock.json" ":(exclude)\*.lock"
}

function gdt {
    git diff-tree --no-commit-id --name-only -r
}

function gf {
    git fetch
}

function gfa {
    git fetch --all --prune
}

function gfo {
    git fetch origin
}

function gg {
    git gui citool
}

function gga {
    git gui citool --amend
}

function ghh {
    git help
}

function glgg{
    git log --graph
}

function glgga {
    git log --graph --decorate --all
}

function glgm {
    git log --graph --max-count=10
}

function glod {
    git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'
}

function glods {
    git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short
}

function glol {
    git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'
}

function glola {
    git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all
}

function glols {
    git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat
}

function glo {
    git log --oneline --decorate
}

function glog {
    git log --oneline --decorate --graph
}

function gloga {
    git log --oneline --decorate --graph --all
}

function glp {
    git log --pretty=<format>
}

function glg {
    git log --stat
}

function glgp {
    git log --stat --patch
}

function gignored {
    git ls-files -v | grep "^[[:lower:]]"
}

function gfg {
    git ls-files | grep
}

function gm {
    git merge
}

function gma {
    git merge --abort
}

function gms {
    git merge --squash
}

function gmom {
    git merge origin/$(git_main_branch)
}

function gmum {
    git merge upstream/$(git_main_branch)
}

function gmtl {
    git mergetool --no-prompt
}

function gmtlvim {
    git mergetool --no-prompt --tool=vimdiff
}

function gl {
    git pull
}

function gpr {
    git pull --rebase
}

function gprv {
    git pull --rebase -v
}

function gpra {
    git pull --rebase --autostash
}

function gprav {
    git pull --rebase --autostash -v
}

function gprom {
    git pull --rebase origin $(git_main_branch)
}

function gpromi {
    git pull --rebase=interactive origin $(git_main_branch)
}

function ggpull {
    git pull origin "$(git_current_branch)"
}

function ggl {
    git pull origin $(current_branch)
}

function gluc {
    git pull upstream $(git_current_branch)
}

function glum {
    git pull upstream $(git_main_branch)
}

function gp {
    git push
}

function gpd {
    git push --dry-run
}

function gpf! {
    git push --force
}

function ggf {
    git push --force origin $(current_branch)
}

function gpf {
    git push --force-with-lease --force-if-includes
}

function ggfl {
    git push --force-with-lease origin $(current_branch)
}

function gpsup {
    git push --set-upstream origin $(git_current_branch)
}

function gpsupf {
    git push --set-upstream origin $(git_current_branch) --force-with-lease --force-if-includes
}

function gpv {
    git push --verbose
}

function gpoat {
    git push origin --all && git push origin --tags
}

function gpod {
    git push origin --delete
}

function ggpush {
    git push origin "$(git_current_branch)"
}

function ggp {
    git push origin $(current_branch)
}

function gpu {
    git push upstream
}

function grb {
    git rebase
}

function grba {
    git rebase --abort
}

function grbc {
    git rebase --continue
}

function grbi {
    git rebase --interactive
}

function grbo {
    git rebase --onto
}

function grbs {
    git rebase --skip
}

function grbd {
    git rebase $(git_develop_branch)
}

function grbm {
    git rebase $(git_main_branch)
}

function grbom {
    git rebase origin/$(git_main_branch)
}

function gr {
    git remote
}

function grv {
    git remote --verbose
}

function gra {
    git remote add
}

function grrm {
    git remote remove
}

function grmv {
    git remote rename
}

function grset {
    git remote set-url
}

function grup {
    git remote update
}

function grh {
    git reset
}

function gru {
    git reset --
}

function grhh {
    git reset --hard
}

function grhk {
    git reset --keep
}

function grhs {
    git reset --soft
}

function gpristine {
    git reset --hard && git clean --force -dfx
}

function groh {
    git reset origin/$(git_current_branch) --hard
}

function grs {
    git restore
}

function grss {
    git restore --source
}

function grst {
    git restore --staged
}

function gunwip {
    git rev-list --max-count=1 --format="%s" HEAD | grep -q "--wip--" && git reset HEAD~1
}

function grev {
    git revert
}

function grm {
    git rm
}

function grmc {
    git rm --cached
}

function gcount {
    git shortlog --summary -n
}

function gsh {
    git show
}

function gsps {
    git show --pretty=short --show-signature
}

function gstall {
    git stash --all
}

function gstu {
    git stash --include-untracked
}

function gstaa {
    git stash apply
}

function gstc {
    git stash clear
}

function gstd {
    git stash drop
}

function gstl {
    git stash list
}

function gstp {
    git stash pop
}

function gsta {
    git stash push
}

function gsts {
    git stash show --patch
}

function gst {
    git status
}

function gss {
    git status --short
}

function gsb {
    git status --short -b
}

function gsi {
    git submodule init
}

function gsu {
    git submodule update
}

function gsd {
    git svn dcommit
}

function git-svn-dcommit-push {
    git svn dcommit && git push github $(git_main_branch):svntrunk
}

function gsr {
    git svn rebase
}

function gsw {
    git switch
}

function gswc {
    git switch -c
}

function gswd {
    git switch $(git_develop_branch)
}

function gswm {
    git switch $(git_main_branch)
}

function gta {
    git tag --annotate
}

function gts {
    git tag -s
}

function gtv {
    git tag | sort -V
}

function gignore {
    git update-index --assume-unchanged
}

function gunignore {
    git update-index --no-assume-unchanged
}

function gwch {
    git whatchanged -p --abbrev-commit --pretty=medium
}

function gwt {
    git worktree
}

function gwtls {
    git worktree list
}

function gwtmv {
    git worktree move
}

function gwtrm {
    git worktree remove
}

function gk {
    gitk --all --branches &!
}

function gke {
    gitk --all $(git log --walk-reflogs --pretty=%h) &!
}

function gtl {
    gtl(){ git tag --sort=-v:refname -n --list ${1}\* }; noglob gtl
}

function prc {
    gh pr create
}