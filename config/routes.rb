Rails.application.routes.draw do
  root 'welcome#index'
  get "/auth/:provider/callback" => "session#create"
  delete "/logout" => "session#destroy"
end
