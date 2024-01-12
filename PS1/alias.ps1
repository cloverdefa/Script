<# git alias #>

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