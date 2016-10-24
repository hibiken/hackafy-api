class Post::Create
  attr_reader :post

  def initialize(post)
    @post = post
  end

  def run
    if post.save
      create_tags
      post
    else
      false
    end
  end

  private

  def create_tags
    post.tags = post.caption.scan(/#\w+/).map do |tag_name|
      Tag.where(name: tag_name[1..-1]).first_or_create
    end
  end
end
