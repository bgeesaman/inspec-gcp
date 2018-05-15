title 'IAM Service Account Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_service_account_display_name = attribute(:gcp_service_account_display_name, default: '', description: 'The GCP IAM Service Account display name.')

control 'gcp-generic-iam-service-account' do

  impact 1.0
  title 'Ensure that the Service Account is correctly set up'

  describe google_service_account(project: gcp_project_id, name: gcp_service_account_display_name ) do
    its('display_name') { should eq gcp_service_account_display_name }
    its('project_id') { should eq gcp_project_id }
  end
end