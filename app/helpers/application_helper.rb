module ApplicationHelper
  def set_flash
    flash[:alert] = "Song not found."
  end
end
