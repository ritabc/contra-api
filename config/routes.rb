Rails.application.routes.draw do

  ## We want routes for
    ## - getting next possible moves
    ## - getting information on a dance
    ## - saving a dance

    get 'next-moves' => 'moves#available_next'

    resources :positions, only: [:index]

end
