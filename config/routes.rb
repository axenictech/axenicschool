Rails.application.routes.draw do

get 'setting/course_batch'
get 'batches/:id/display', to: 'batches#display', as: 'batches_display'
get 'batches/select' 
get 'grading_levels/select'
get 'batch_transfers/select'
get 'batch_transfers/:batch_id/graduation',to: 'batch_transfers#graduation', as: 'batch_transfers_graduation'
get 'batch_transfers/:batch_id/transfer',to: 'batch_transfers#transfer', as: 'batch_transfers_transfer'
get 'subjects/select'
get 'batches/:batch_id/subjects/subject',to: 'subjects#subject', as: 'batches_subjects_subject'
get 'elective_groups/:elective_group_id/elective_subject',to: 'elective_groups#elective_subject', as: 'elective_groups_elective_subject'
get 'students/search' 
get 'students/search_ajax'
get 'students/view_all'
get 'students/select'  
get 'students/profile'
get 'students/archived_profile'  
get 'students/advanced_search'
get 'students/advanced_student_search'
get 'students/:subject_id/elective',to: 'students#elective',as: 'students_elective'
get 'home/dashboard'
get 'students/admission1'
get 'students/admission2'
post 'students/adm_create'
post 'students/archived_student_create'
get 'students/admission2_1'
get 'newscasts/select'
get 'newscasts/display'
get 'students/admission3'
patch 'students/update_immediate_contact'
get 'students/previous_data'
post 'students/previous_data_create'
get 'students/previous_subject'
post 'students/previous_subject_create'
get 'students/:id/profile_pdf',to: 'students#profile_pdf',as: 'students_profile_pdf'
get 'students/report'
get 'students/archived_report'
get 'students/email'
get 'students/change_to_former'
get 'students/delete'
get 'students/remove'
get 'students/dispguardian'
get 'students/archived_student_guardian'
get 'students/addguardian'
post 'students/assign_elective'
get 'students/:subject_id/assign_all',to: 'students#assign_all',as: 'students_assign_all'
get 'students/:subject_id/remove_all',to: 'students#remove_all',as: 'students_remove_all'
post 'guardians/addguardian_create',to: 'guardians#addguardian_create',as: 'guardians_addguardian_create'
get 'users/search'
get 'users/select'
get 'users/view_all'
get 'users/view_all_details'
get 'class_timings/select'
get 'events/show'
get 'weekdays/select'
get 'weekdays/index'
post'weekdays/create'
get 'time_tables/select'
get 'time_tables/sub'
get 'time_tables/new'
get 'time_tables/timetable'
get 'time_table_entries/select'
get 'exam_reports/report_center'
get 'exam_reports/exam_wise_report'
get 'exam_reports/generate_exam_report'
get 'exam_reports/select_batch'
get 'exam_reports/:exam_group_id/student_exam_report/:student_id',
                    to: 'exam_reports#student_exam_report',as: 'exam_reports_student_exam_report'
get 'exam_reports/:exam_group_id/consolidated_report',to: 'exam_reports#consolidated_report',as: 'exam_reports_consolidated_report'
get 'calender/next'
get 'calender/demo' 
get 'calender/holiday_event_view'
get 'exam_setting/:course_id/setting',to: 'exam_setting#setting', as: 'course_class_designations'
get 'exam_setting/select'
get 'exam_setting/selectrank'
get 'exam_setting/:course_id/settingrank',to: 'exam_setting#settingrank',as: 'course_ranking_levels'
get 'exam_setting/newrank'
post 'exam_setting/createrank'
get 'exam_setting/:course_id/editRank/:id',to:'exam_setting#editRank',as:'course_ranking_level'
patch 'exam_setting/updateRank'
delete 'exam_setting/:id/destroyRank', to:'exam_setting#destroyRank', as:'exam_setting_destroyRank'
get 'exam_groups/select'

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

resources :time_tables
resources :class_timings
  resources :batches do
  resources :class_timings
end  
resources :events
resources :calender
resources :weekdays
resources :time_tables

resources :time_table_entries

  resources :batches do
  resources :time_table_entries
end  

resources :exams
resources :exam_setting
resources :exam_groups do
  resources :exams
end
resources :online_exam_groups
resources :exam_reports

resources :courses do
  resources :exam_setting
end  

end
