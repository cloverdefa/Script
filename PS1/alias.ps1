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