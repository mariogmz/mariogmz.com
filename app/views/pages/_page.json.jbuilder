json.extract! page, :id, :summary, :about_title, :about_text, :services_title, :projects_title, :contact_title, :contact_number, :active, :profile_id, :created_at, :updated_at
json.url page_url(page, format: :json)
