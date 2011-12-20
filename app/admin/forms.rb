ActiveAdmin.register Form do
 
 #action_item :only => :show do
    #link_to "DONE", collection_form_admin_form_path(resource)
  #end

  #member_action :collection_form do
  #  @form = Form.find(params[:id])
  #  @form.status = Form::STATUS_DONE
  #  @form.save
    
  #  redirect_to admin_form_path(@form), :notice => "Email will be send to Admin"
  #end

  scope :all, :default => true

   scope :NOT_ANSWER do |forms|
    forms.where( :status => Form::STATUS_NOTANSWER )
  end

  scope :DONE do |form|
    form.where(:status => Form::STATUS_DONE )
  end  

 form do |f|
    f.inputs "Memorandum" do
      f.input :date_issued
      f.input :issued_to, :label => "Issue To"
      f.input :from, :collection => [[" ","ADMIN"]], :include_blank => false, :wrapper_html => { :style => "display:none;"}
      f.input :subject
      f.input :why, :input_html => { :rows => 4 }
      f.input :issued_by, :collection => [["- Auto Generated -","Admin"]], :wrapper_html => { :style => "display:none;" }, :include_blank => false
      f.input :status, :collection => Form.status_collection, :include_blank => false
    end 
   f.buttons
  end 


  index do
    column :status do |form|
      status_tag form.status, form.status_tag
    end
    column :issued_to
    column :subject
    column :issued_by
    column do |form|
      link_to("Details", admin_form_path(form)) + " | " + \
      link_to("Delete", admin_form_path(form), :method => :delete, :confirm => "Are you sure?")
    end
  end

end
