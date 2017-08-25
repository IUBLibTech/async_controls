AsyncControls::Engine.routes.draw do
  # Adds routes to large file interactions provided through AsyncControls::AsyncControlsBehavior
  get '/concern/file_sets/:id/file_status' => '/hyrax/file_sets#file_status', as: :file_status_curation_concerns_file_set
  get '/concern/file_sets/:id/stage' => '/hyrax/file_sets#stage', as: :stage_curation_concerns_file_set
  get '/concern/file_sets/:id/unstage' => '/hyrax/file_sets#unstage', as: :unstage_curation_concerns_file_set
  get '/concern/file_sets/:id/fixity' => '/hyrax/file_sets#fixity', as: :fixity_curation_concerns_file_set
end
