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
get 'students/elective'
get 'home/dashboard'
get 'students/admission1'
get 'students/admission2'
post 'students/adm_create'
get 'students/admission2_1'
get 'newscasts/select'
get 'newscasts/display'
get 'students/admission3'
patch 'students/update_immediate_contact'
get 'students/previous_data'
post 'students/previous_data_create'
get 'students/previous_subject'
post 'students/previous_subject_create'
get 'students/profile_pdf'
get 'students/report'
get 'students/email'
get 'students/change_to_former'
get 'students/delete'
get 'students/remove'

root 'home#dashboard'
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
 
 resources :students do
    resources :guardians
end

resources :newscasts do
resources :comments
end
resources :users

end
