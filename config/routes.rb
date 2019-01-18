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

    get 'dance-composition' => 'dance_moves#steps'

    get 'info-for-animation' => 'dance_moves#formation_moves'


end
