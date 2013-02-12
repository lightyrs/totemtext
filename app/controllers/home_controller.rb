class HomeController < ApplicationController

  before_filter :before_home_index

  def index

  end

  private

  def before_home_index
    @document = find_or_build_user_document if user_signed_in?
  end

  def find_or_build_user_document
    if current_user.previous_document.created_at < 1.minute.ago
      current_user.previous_document
    else
      current_user.documents.build
    end
  end
end
