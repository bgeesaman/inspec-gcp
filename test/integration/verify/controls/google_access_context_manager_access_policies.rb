# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

title 'Test GCP google_access_context_manager_access_policies resource.'

gcp_organization_id = attribute(:gcp_organization_id, default: gcp_organization_id, description: 'The identifier of the organization that is the parent of the perimeter')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources, default:0, description:'Flag to enable privileged resources requiring elevated privileges in GCP.')
service_perimeter = attribute('service_perimeter', default: {
  "name": "restrict_all",
  "title": "restrict_all",
  "restricted_service": "storage.googleapis.com",
  "policy_title": "policytitle"
}, description: 'Service perimeter definition')
control 'google_access_context_manager_access_policies-1.0' do
  impact 1.0
  title 'google_access_context_manager_access_policies resource test'

  only_if { gcp_enable_privileged_resources.to_i == 1 && gcp_organization_id != ''}

  describe google_access_context_manager_access_policies(org_id: gcp_organization_id) do
    its('count') { should be >= 1 }
    its('titles') { should include service_perimeter['policy_title'] }
  end
end