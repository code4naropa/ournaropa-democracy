OurnaropaDecisions::Engine.routes.draw do
  #get 'mock_ups/index'

  get 'decision/1', to: 'mock_ups#decision_1', as: "decision_1"

  get 'mock_ups/decision_2'

  get 'mock_ups/decision_3'

  #resources :decisions

  root :to => "mock_ups#index"
end
