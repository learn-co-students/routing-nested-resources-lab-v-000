module ApplicationHelper
  def missing_record
    flash[:alert] = "Artist not found."
    redirect_to artists_path
  end
end
