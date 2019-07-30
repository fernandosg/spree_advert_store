class Spree::Admin::AdvertismentsController < Spree::Admin::ResourceController
  before_action :collection, only: :index
  before_action :define_new_object, only: :new
  before_action :define_edit_object, only: :edit

  def index
    session[:return_to]
    respond_with(@collection)
  end

  def model_class
    @model_class ||= Spree::Advertisment
  end

  private
  def collection
    @collection = Spree::Advertisment.all
  end

  def load_index_data
    #@image = Spree::Image.find(params[:image_id])
  end

  def load_edit_data
  end

  def define_new_object
    @advertisment = Spree::Advertisment.new
  end

  def define_edit_object
    @advertisment = Spree::Advertisment.find(params[:id])
  end

  def checking
    binding.pry
  end

  def collection_url
    admin_advertisment_index_url
  end
end
