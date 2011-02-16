atom_feed do |feed|
  feed.title("#{@user.name} Projects list")
  feed.updated(@user.aq_repositories.public.first.created_at)
  for repository in @user.aq_repositories.public
    feed.entry(@user, repository) do |entry|
      entry.title("Repository: #{repository.name}")
      entry.content("Description: #{!repository.desc.blank? ? repository.desc : "No description available"}", :type => 'html')
      entry.updated(repository.updated_at)
      entry.author do |author|
        author.name(@user.name)
        author.uri(user_url(@user))
      end
    end
  end
end
