#!/bin/bash

set -e

fail_with_usage() {
  echo "Usage: $0 [-R <repository>] <type> <version>" >&2
  exit 1
}

repository=VOICEVOX/onnxruntime-builder

while getopts R: opt; do
  case "$opt" in
    R)
      repository=$OPTARG
      shift 2 ;;
    *)
      fail_with_usage
  esac
done

if [ $# -ne 2 ]; then
  fail_with_usage
fi

type=$1
version=$2

remotes=$(git remote -v)
remote=$(grep -e '\shttps://github\.com/'"$repository"'\(\.git\)\? (push)$' <<< "$remotes")
remote_name=$(awk '{ print $1 }' <<< "$remote")

tag=$type-$version
msg=$tag

local_rev=$(git rev-parse HEAD)
remote_rev=$(gh release -R "$repository" view "$tag" --json targetCommitish -q .targetCommitish)

if [ "$local_rev" != "$remote_rev" ]; then
  echo "local: '$local_rev', remote: '$remote_rev'" >&2
  exit 1
fi
echo 'Commit SHA: OK' >&2

echo >&2
table=$'Repository\t'"$repository ($remote_name)"$'\n'
table+=$'Tag name\t'"$tag"$'\n'
table+=$'Tag message\t'"$msg"$'\n'
table+=$'Revision\t'"$local_rev"
column <(cat <<< "$table") -tms $'\t' -o ' | ' | sed 's/.*/| \0|/' >&2
echo >&2

read -rp 'Proceed? (y/N): ' input
if ! [[ "$input" =~ ^[yY]$ ]]; then
  echo 'Aborted' >&2
  exit
fi

git tag "$tag" -sm "$msg"
echo "Created '$tag'" >&2

git push "$remote_name" "$tag"
