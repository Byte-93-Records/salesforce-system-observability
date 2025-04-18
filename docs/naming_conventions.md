### File Naming Conventions

- **Bash Scripts**:
  - **Descriptive Names**: Use names that clearly describe the script's function or purpose.
  - **Hyphen Separation**: Use hyphens to separate words, enhancing readability and understanding.
  - **Avoid Special Characters**: Stick to alphanumeric characters and hyphens to prevent handling issues.
  - **Versioning**: Include version numbers if the script evolves over time.
  - **Environment or Purpose-Specific**: Indicate the environment (e.g., `dev`, `prod`) or specific use case.

  #### Examples:
  - **Action-Based Names**:
    - `backup-database.sh`: A script to back up the database.
    - `start-server.sh`: A script to start the server.
  
  - **Feature-Based Names**:
    - `user-authentication.sh`: Handles user login and authentication.
    - `data-processing.sh`: Processes data for analysis.
  
  - **Date or Version-Based Names**:
    - `cleanup-logs-v1.sh`: Initial version of the log cleanup script.
    - `generate-report-20231001.sh`: Report generation script for October 1, 2023.
  
  - **Environment or Purpose-Specific Names**:
    - `dev-start-server.sh`: Start server script for the development environment.
    - `prod-deploy-app.sh`: Deployment script for production.

- **SQL Files**:
  - **Descriptive Names**: Use names that clearly describe the script's function or purpose.
  - **Underscore Separation**: Use underscores to separate words, enhancing readability and understanding.
  - **Avoid Special Characters**: Stick to alphanumeric characters and underscores to prevent handling issues.
  - **Versioning**: Include version numbers if the script evolves over time.
  - **Environment or Purpose-Specific**: Indicate the environment (e.g., `dev`, `prod`) or specific use case.

  #### Examples:
  - **Action-Based Names**:
    - `create_table_users.sql`: Script to create the users table.
    - `update_sales_data.sql`: Updates records in the sales data table.
  
  - **Feature-Based Names**:
    - `inventory_management_report.sql`: Generates reports for inventory management.
    - `user_authentication_procedure.sql`: Contains procedures for user authentication.
  
  - **Date or Version-Based Names**:
    - `20231001_monthly_report.sql`: SQL file for the monthly report on October 1, 2023.
    - `v2_create_index_products.sql`: Version 2 of a script to create an index on the products table.
  
  - **Environment or Purpose-Specific Names**:
    - `dev_load_test_data.sql`: Loads test data in the development environment.
    - `prod_backup_script.sql`: Backup script for production environment.