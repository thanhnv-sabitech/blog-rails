class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def edit?
    user_owns_post?
  end

  def update?
    user_owns_post?
  end

  def destroy?
    user_owns_post?
  end

  private

  def user_owns_post?
    user.present? && user.id == post.user_id
  end
end
