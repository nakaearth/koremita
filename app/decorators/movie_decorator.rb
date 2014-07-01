<<<<<<< HEAD
class MovieDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def created_time
    movie.created_at.strftime("%y-%m-%d %H:%M")
=======
module MovieDecorator
  def format_created_at
    created_at.strftime("%Y-%m-%d %H:%M")
>>>>>>> d66a1555926b7908d91cd671939f96da99c62eeb
  end
end
