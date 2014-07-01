module MovieDecorator
  def format_created_at
    created_at.strftime("%Y-%m-%d %H:%M")
  end
end
