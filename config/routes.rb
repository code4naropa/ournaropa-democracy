OurnaropaDecisions::Engine.routes.draw do
  #get 'mock_ups/index'

  get 'decision/:id', to: 'mock_ups#show_decision', as: "decision"

  get 'mock_ups/decision_2'

  get 'mock_ups/decision_3'

  #resources :decisions

  root :to => "mock_ups#index"
end
