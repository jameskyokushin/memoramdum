class FormsController < InheritedResources::Base

  before_filter :authenticate_user!
 
  def index
     @forms = Form.order("").page(params[:page]).per(10)
  end 

end
