module HomeHelper
  def search_helper(query)
    @user_results = User.search(query)
    @project_results = Project.search(query)
    @team_results = Team.search(query)
  end

end
