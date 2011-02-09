atom_feed do |feed|
  feed.title("#{@user.name} Commits list")
  feed.updated(@commits.first.committed_time)
  for commit in @commits
    feed.entry([@user, commit.repository]) do |entry|
      entry.title(commit.log.slice(0,100) + "...")
      entry.content("Log: #{commit.log}.<br>See more at: #{link_to show_commit_user_aq_repository_url(@user, commit.repository, commit.sha), show_commit_user_aq_repository_url(@user, commit.repository, commit.sha)}", :type => 'html')
      entry.updated(commit.committed_time)
      entry.author do |author|
        author.name(commit.author_name)
      end
    end
  end
end
