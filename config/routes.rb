Rails.application.routes.draw do

  ## We want routes for
    ## - getting next possible moves
    ## - getting information on a dance
    ## - saving a dance

    get 'next-moves' => 'moves#available_next'

    resources :moves, only: [:index]

    resources :positions, only: [:index]
    resource :position, only: [:show]

    resources :dances, only: [:index, :show]

    get 'dance-moves-info' => 'dance_moves#get_dance_moves_information'

end
