class ApplicationController < ActionController::Base
  # ↓pathに/adminが含まれている全てのページは、adminでログインしないと見れない
  before_action :authenticate_admin!, if: :admin_url

  def admin_url
    request.fullpath.include?("/admin")
  end

end
