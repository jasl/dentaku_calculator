class Forms::PreviewsController < Forms::ApplicationController
  before_action :eager_load_fields
  before_action :set_preview

  def show
    @instance = @preview.new
    render :new
  end

  def create
    @instance = @preview.new(preview_params)

    if @instance.valid?
      render :show
    else
      render :new
    end
  end

  private

  def eager_load_fields
    @form.fields.find_all
  end

  def set_preview
    @preview = @form.to_virtual_model
  end

  def preview_params
    params.fetch(:preview, {}).permit!
  end
end
