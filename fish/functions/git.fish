function git-default-main --description "Migrates a git repository from master to main as default branch"

    echo "=== Migrating repository default branch from master to main ==="
    echo

    echo "* Moves branch master to main locally"
    git branch --move master main

    echo "* Pushes local main branch to remote repository"
    git push --set-upstream origin main

    echo "* Points the HEAD to main branch"
    git symbolic-ref refs/remotes/origin/HEAD refs/remotes/origin/main

    echo "* Change default branch o Github to main"
    gh api -X PATCH "repos/:owner/:repo" --raw-field default_branch="main" > /dev/null

    echo "* Change base branch to main on all open Pull Requests"
    for pr_n in (gh pr list --base master --limit 999 | awk '{print $1}')

        gh api -X PATCH "repos/:owner/:repo/pulls/$pr_n" --raw-field base="main" > /dev/null
    end

    echo "* Delete branch master remotelly"
    git push origin --delete master

    echo
    echo "=== Done ==="
end
