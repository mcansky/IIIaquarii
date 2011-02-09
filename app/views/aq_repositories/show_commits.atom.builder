atom_feed do |feed|
  feed.title("#{@repository.name} Project: Details of all changes")
  feed.updated(@commits.first.date)
  for commit in @commits
    feed.entry([@repository.owner, @repository]) do |entry|
      entry.title(commit.message.slice(0,100) + "...")
      entry.content(commit.message + "<br/><br/><pre>#{format_commit_changes_for_atom(commit)}</pre>", :type => 'html')
      entry.updated(commit.date)
      entry.author do |author|
        author.name(commit.author.name)
      end
    end
  end
end
