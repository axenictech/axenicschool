Rails.application.routes.draw do

get 'setting/course_batch'
get 'batches/display'
get 'batches/select' 
get 'grading_levels/select'
get 'batch_transfers/graduation'
get 'batch_transfers/transfer'
get 'subjects/select'
get 'students/search' 
get 'students/search_ajax'
get 'students/view_all'
get 'students/select'  
get 'students/profile'  
get 'students/advanced_search'
get 'students/advanced_student_search'

root 'home#index'
 resources :home
 resources :setting
 resources :categories
 resources :general_settings
  
 resources :courses do
    resources :batches
  end

  resources :grading_levels
  resources :batches do
  resources :grading_levels
end  

resources :batch_transfers
  
  resources :subjects 
   resources :batches do
    resources :subjects
    resources :elective_groups do
     resources :subjects 
    end  
  end 
 
 resources :students

end
