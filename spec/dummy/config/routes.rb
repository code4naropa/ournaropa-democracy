Rails.application.routes.draw do

  mount OurnaropaDecisions::Engine => "/democracy", :as => "democracy"
end
