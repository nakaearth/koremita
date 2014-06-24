module MovieDecorator
  def format_created_at
    created_at.strftime("%y-%m-%d %H:%M")
  end
end
