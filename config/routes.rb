FitogramStatic::Application.routes.draw do
  root to: "static#index"
  
  get ':controller(/:action(/:id))'
  get ':action' => 'static#:action'
end