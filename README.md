# Coding challenge

## Automation
---
There are two CI-Solutions which would enhance our Lambda function.
- The first one would be a pipeline to automate the infractructure deployment. 
- The second could be a pull request pipeline running quality checks like validatig syntax and running "checkov" to validate our code and increasing the overall code quality. 


## Versioning
---
### Usage of semantic versioning
Using the guidelines of a semantic version number. In summary, this means that with a version number of the form MAJOR.MINOR.PATCH

### Working with feature branches
Using feature branches to develop new features for our application and merging them with a pull request requiring additonal reviewers. Pushing directly to the main branch is blocked by policy. 

### Tracking changes with a changelog
For a better operational expirience, all changes should be documented in a ***changelog.md*** by category.
(Breaking Changes, Notes, Features, Enhancements, Bug Fixes)

## Known Issues
---
- Lambda is creating its own Log group, this results in two issues: 
    - In case of a terraform destroy the log group will not be deleted
    - The Log group cannot be configured by terraform and logs will not be kept over time because there is no retention time configured by default. 
- The python source code and the terraform infrastrucure code are both stored in the same repository. This makes the versioning of the repository more challenging as it is more complicated to track changes either to the infrastructure or the source code. Separating both into own repositieries might be better as bove could receive their own version number.
- Storring the Terraform state file in a s3 bucket instead of the local device