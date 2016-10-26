plan:
	@vagrant ssh -c "cd /vagrant/environments/$(ENV) && terraform get && terraform plan -out terraform.tfplan"
apply:
	@vagrant ssh -c "cd /vagrant/environments/$(ENV) && terraform get && terraform apply"
destroy:
	@vagrant ssh -c "cd /vagrant/environments/$(ENV) && terraform get && terraform destroy"