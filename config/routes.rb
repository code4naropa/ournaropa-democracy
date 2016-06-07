OurnaropaDecisions::Engine.routes.draw do
  #get 'mock_ups/index'

  get 'decision/:id', to: 'mock_ups#show_decision', as: "decision"

  get 'mock_ups/decision_2'

  get 'mock_ups/decision_3'

  match '/submit_feedback', to: 'mock_ups#submit_feedback', as: "submit_feedback", via: :post

  #resources :decisions

  root :to => "mock_ups#index"
end
