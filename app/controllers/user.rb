Tests::App.controllers :user do

  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end

  get :hardworker, map: '/hardworker' do
    logger.info "I'll call HardWorker"
    HardWorker.perform_async(44)
    logger.info "HardWorker was called"
    return "The job should still be running in background."
  end

end
