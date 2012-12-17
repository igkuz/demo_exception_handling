DemoExceptionHandling::Application.routes.draw do
  
  match '/404', :to => 'errors#not_found'
  match '/422', :to => 'errors#unprocessable_entity'
  match '/500', :to => 'errors#internal_error'
  
  root :to => "welcome#index"
end
